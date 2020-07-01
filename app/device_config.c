/* Copyright (c) Microsoft Corporation.
   Licensed under the MIT License. */

#include "device_config.h"

/**
 ** \brief Hardfault Handler
 
 * Used to identify when a location outside the reserved area
 * for SmartEEPROM is accessed.
 */
void HardFault_Handler(void)
{
	printf("\r\n!!!!!!!! In HardFault_Handler !!!!!!!!\r\n");

	while (1) {
		;
	}
}

/**
 * \brief Verify the custom data in SmartEEPROM
 *
 * Verify the custom data at initial 4 bytes of SmartEEPROM
 */
int8_t verify_seep_signature(void)
{
	/* Define a pointer to access SmartEEPROM as words (32-bits) */
	uint32_t *SmartEEPROM32 = (uint32_t *)SEEPROM_ADDR;
	
	int8_t ret_val = ERR_INVALID_DATA;

	while (hri_nvmctrl_get_SEESTAT_BUSY_bit(NVMCTRL)) ;

	/* If SBLK fuse is not configured, inform the user and wait here */
	if (!(hri_nvmctrl_read_SEESTAT_SBLK_bf(NVMCTRL))) {
		printf("\r\nPlease configure SBLK fuse to allocate SmartEEPROM area\r\n");
		while (1) ;
	}

	if (SMEE_CUSTOM_SIG == SmartEEPROM32[0]) {
		ret_val = ERR_NONE;
	}

	return ret_val;
}

/**
 * \brief Verify the SmartEEPROM is setup properly 
 * 
 *	Verify the SmartEEPROM is setup properly 
 */
void verify_eeprom_status(void)
{
	uint32_t *SmartEEPROM32 = (uint32_t *)SEEPROM_ADDR;
	
	/* Initializes MCU, drivers and middleware */
	if (ERR_NONE == verify_seep_signature()) {
		printf("\r\nSmartEEPROM contains valid data \r\n");
	}
	else {
		printf("\r\nStoring signature to SmartEEPROM address 0x00 to 0x03\r\n");
		while (hri_nvmctrl_get_SEESTAT_BUSY_bit(NVMCTRL)) ;
		SmartEEPROM32[0] = SMEE_CUSTOM_SIG;
	}
}

/*
 * Verifies if the eeprom has been Azure IoT credentials*/
int8_t has_credentials(void)
{
	/* Define a pointer to access SmartEEPROM as words (32-bits) */
	uint8_t *SmartEEPROM = (uint8_t *)EEPROM_ADDR;
	
	int8_t ret_val = ERR_INVALID_DATA;

	if (SmartEEPROM[0] != EMPTY_EEPROM_VAL) 
	{
		// Proper value stored in EEPROM
		ret_val = ERR_NONE;
	}

	return ret_val;
}

/*
 * Format and store Azure IoT credentials in flash 
 **/
int8_t save_to_flash(char *hostname, char *device_id, char* primary_key)
{
	int8_t ret_val = 1;
	
	// Pointer used to access EEPROM
	uint8_t *SmartEEPROM = (uint8_t *)EEPROM_ADDR;
	
	const char *format = "hostname=%s device_id=%s primary_key=%s";
	
	char writeData[MAX_READ_BUFF] = { 0 };
	
	// Create credential string using format string
	if (sprintf(writeData, format, hostname, device_id, primary_key) < 0)
	{
		// Error 
		ret_val = 0;
		return ret_val;
	}
	
	// Store byte by byte into EEPROM
	for (int i = 0; i < sizeof(writeData); i++)
	{
		SmartEEPROM[i] = writeData[i];
	}
	
	return ret_val;
}

/*
 * Erase EERPOM by setting buffer to 0xFF to clear
 **/
void erase_flash(void)
{
	uint8_t *SmartEEPROM = (uint8_t *)EEPROM_ADDR;
	for (int i = 0; i < MAX_READ_BUFF; i++)
	{
		SmartEEPROM[i] = EMPTY_EEPROM_VAL;
	}
	printf("SmartEEPROM erased\n");
}

/*
 * Read credentials from memory and write info to buffers
 **/
void read_flash(char* hostname, char* device_id, char* primary_key)
{
	char readData[MAX_READ_BUFF] = { 0 };
	char _hostname[MAX_HOSTNAME_LEN] = { 0 }; 
	char _device_id[MAX_DEVICEID_LEN] = { 0 };
	char _primary_key[MAX_KEY_LEN] = { 0 };

	const char *format = "hostname=%s device_id=%s primary_key=%s"; 
	
	// Pointer to access the EEPROM
	uint8_t *EEPROM = (uint8_t *)EEPROM_ADDR;
	
	// Read  one char at a time
	for(int i = 0 ; i < MAX_READ_BUFF ; i++)
	{
		readData[i] = EEPROM[i];
	}

	// Parse credentials from string
	sscanf(readData, format, _hostname, _device_id, _primary_key);
	
	// Store content in buffers
	strcpy(hostname, _hostname);
	strcpy(device_id, _device_id);
	strcpy(primary_key, _primary_key);
	
}
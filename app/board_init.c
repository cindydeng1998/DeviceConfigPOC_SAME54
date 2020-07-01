/* Copyright (c) Microsoft Corporation.
   Licensed under the MIT License. */
   
#include "board_init.h"

void board_init()
{
    /* Initializes MCU, drivers and middleware */
    atmel_start_init();
    printf("Board initialized.\r\n");
	
	verify_eeprom_status();

	char hostname[MAX_HOSTNAME_LEN] = ""; 
	char device_id[MAX_DEVICEID_LEN] = "";
	char primary_key[MAX_KEY_LEN] = "";
	
	if (has_credentials() == ERR_NONE)
	{
		read_flash(hostname, device_id, primary_key);
		printf("\n Currently device %s is connected to %s. \n", device_id, hostname);
		
		// Start menu option
		int menu_option;
		
		printf("Press 0: Continue .\r\n");
		printf("Press 1: Erase credentials/Reset Flash .\r\n");
		if (scanf("%d", &menu_option) == 0)
		{
			/* Not valid input, flush stdin */
			fflush(stdin);
		}
		if (menu_option == 1)
		{
			erase_flash();
		}
	}
	
	while (has_credentials() != ERR_NONE) 
	{
		printf("No Azure IoT credentials stored in device. Please enter credentials into serial terminal. \n\n");
		
		printf("Please enter your IoTHub hostname: \n");
		if (scanf("%s", hostname) == 0) {
			/* Not valid input, flush stdin */
			fflush(stdin);
			continue;
		}
		
		printf("Please enter your IoTHub device ID: \n");
		if (scanf("%s", device_id) == 0) {
			/* Not valid input, flush stdin */
			fflush(stdin);
			continue;
		}
		
		printf("Please enter your IoTHub primary key: \n");
		if (scanf("%s", primary_key) == 0) {
			/* Not valid input, flush stdin */
			fflush(stdin);
			continue;
		}
		
		printf("Please verify you have entered the correct configuration: \n\n");
		printf("hostname: %s\n", hostname);
		printf("device_id: %s\n", device_id);
		printf("primary_key: %s\n\n", primary_key);
		
		// Logic about going back and changing if things are wrong		
		printf("Press 0: YES, proceed \n");
		printf("Press 1: NO, re-enter credentials \n");

		int user_selection = 0;
		if (scanf("%d", &user_selection) == 0)
		{
			/* Not valid input, flush stdin */
			fflush(stdin);
			continue;
		}
		if (user_selection == 1)
		{
			// loop again
			continue;
		}
		
		if (save_to_flash(hostname, device_id, primary_key) == 1)
		{
			printf("Successfully saved credentials to flash. \n\n");
		}
	} 
	
	
    WeatherClick_initialize();
    printf("Temperature sensor initialized.\r\n");
}

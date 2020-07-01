AZRTOSDeviceConfiguration

struct ConfigInfo {

#ifdef STM43L4
    WIFI_SSID           "Cindy's Phone"
    WIFI_PASSWORD       "qazqwe123"
    WIFI_MODE           WPA2_PSK_AES
#endif

    IOT_HUB_HOSTNAME
    IOT_DEVICE_ID
    IOT_PRIMARY_KEY
}

char* compose_cred_string(ConfigInfo info);
int save_to_flash(uint8_t *data);
int read_from_flash();
int erase_flash();
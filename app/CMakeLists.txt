# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

set(LINKER_SCRIPT "${CMAKE_CURRENT_LIST_DIR}/startup/same54p20a_flash.ld")

set(SOURCES
    startup/startup_same54.c
    startup/system_same54.c
    startup/tx_initialize_low_level.S
    azure_iothub.c
    board_init.c
    main.c
    device_config.c)

add_executable(${PROJECT_NAME} ${SOURCES})

target_link_libraries(${PROJECT_NAME}
    azrtos::threadx
    azrtos::netxduo
    netxdriver
    atmel_start
    app_common
)

target_link_options(${PROJECT_NAME}
    PRIVATE 
        -T${LINKER_SCRIPT} -Wl,-Map=${PROJECT_NAME}.map)

set_target_properties(${PROJECT_NAME}
    PROPERTIES 
        LINK_DEPENDS ${LINKER_SCRIPT}
        SUFFIX ".elf"
)

create_bin_output(${PROJECT_NAME})
firmware_size(${PROJECT_NAME})

# This file will be configured to contain variables for CPack. These variables
# should be set in the CMake list file of the project before CPack module is
# included. The list of available CPACK_xxx variables and their associated
# documentation may be obtained using
#  cpack --help-variable-list
#
# Some variables are common to all generators (e.g. CPACK_PACKAGE_NAME)
# and some are specific to a generator
# (e.g. CPACK_NSIS_EXTRA_INSTALL_COMMANDS). The generator specific variables
# usually begin with CPACK_<GENNAME>_xxxx.


set(CPACK_BINARY_7Z "OFF")
set(CPACK_BINARY_IFW "OFF")
set(CPACK_BINARY_NSIS "ON")
set(CPACK_BINARY_NUGET "OFF")
set(CPACK_BINARY_WIX "OFF")
set(CPACK_BINARY_ZIP "OFF")
set(CPACK_BUILD_SOURCE_DIRS "C:/Users/t-xinden/Desktop/Examples/Azure RTOS/getting-started/Microchip/ATSAME54-XPRO;C:/Users/t-xinden/Desktop/Examples/Azure RTOS/getting-started/Microchip/ATSAME54-XPRO/build")
set(CPACK_CMAKE_GENERATOR "Ninja")
set(CPACK_COMPONENTS_ALL "")
set(CPACK_COMPONENT_UNSPECIFIED_HIDDEN "TRUE")
set(CPACK_COMPONENT_UNSPECIFIED_REQUIRED "TRUE")
set(CPACK_DEFAULT_PACKAGE_DESCRIPTION_FILE "C:/Program Files (x86)/CMake/share/cmake-3.17/Templates/CPack.GenericDescription.txt")
set(CPACK_DEFAULT_PACKAGE_DESCRIPTION_SUMMARY "atsame54_azure_iot built using CMake")
set(CPACK_GENERATOR "NSIS")
set(CPACK_INSTALL_CMAKE_PROJECTS "C:/Users/t-xinden/Desktop/Examples/Azure RTOS/getting-started/Microchip/ATSAME54-XPRO/build;atsame54_azure_iot;ALL;/")
set(CPACK_INSTALL_PREFIX "C:/Program Files (x86)/atsame54_azure_iot")
set(CPACK_MODULE_PATH "C:/Users/t-xinden/Desktop/Examples/Azure RTOS/getting-started/Microchip/ATSAME54-XPRO/build/CPM_modules;C:/Users/t-xinden/Desktop/Examples/Azure RTOS/getting-started/Microchip/ATSAME54-XPRO/../../cmake")
set(CPACK_NSIS_DISPLAY_NAME "atsame54_azure_iot 6.0.0")
set(CPACK_NSIS_INSTALLER_ICON_CODE "")
set(CPACK_NSIS_INSTALLER_MUI_ICON_CODE "")
set(CPACK_NSIS_INSTALL_ROOT "\$PROGRAMFILES")
set(CPACK_NSIS_PACKAGE_NAME "atsame54_azure_iot 6.0.0")
set(CPACK_NSIS_UNINSTALL_NAME "Uninstall")
set(CPACK_OUTPUT_CONFIG_FILE "C:/Users/t-xinden/Desktop/Examples/Azure RTOS/getting-started/Microchip/ATSAME54-XPRO/build/CPackConfig.cmake")
set(CPACK_PACKAGE_DEFAULT_LOCATION "/")
set(CPACK_PACKAGE_DESCRIPTION_FILE "C:/Program Files (x86)/CMake/share/cmake-3.17/Templates/CPack.GenericDescription.txt")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "atsame54_azure_iot built using CMake")
set(CPACK_PACKAGE_FILE_NAME "atsame54_azure_iot-6.0.0-Generic")
set(CPACK_PACKAGE_INSTALL_DIRECTORY "atsame54_azure_iot 6.0.0")
set(CPACK_PACKAGE_INSTALL_REGISTRY_KEY "atsame54_azure_iot 6.0.0")
set(CPACK_PACKAGE_NAME "atsame54_azure_iot")
set(CPACK_PACKAGE_RELOCATABLE "true")
set(CPACK_PACKAGE_VENDOR "Humanity")
set(CPACK_PACKAGE_VERSION "6.0.0")
set(CPACK_PACKAGE_VERSION_MAJOR "6")
set(CPACK_PACKAGE_VERSION_MINOR "0")
set(CPACK_PACKAGE_VERSION_PATCH "0")
set(CPACK_RESOURCE_FILE_LICENSE "C:/Program Files (x86)/CMake/share/cmake-3.17/Templates/CPack.GenericLicense.txt")
set(CPACK_RESOURCE_FILE_README "C:/Program Files (x86)/CMake/share/cmake-3.17/Templates/CPack.GenericDescription.txt")
set(CPACK_RESOURCE_FILE_WELCOME "C:/Program Files (x86)/CMake/share/cmake-3.17/Templates/CPack.GenericWelcome.txt")
set(CPACK_SET_DESTDIR "OFF")
set(CPACK_SOURCE_GENERATOR "ZIP")
set(CPACK_SOURCE_IGNORE_FILES "\\.git/;\\.github/;_build/;\\.git;\\.gitattributes;\\.gitignore;.*~\$")
set(CPACK_SOURCE_OUTPUT_CONFIG_FILE "C:/Users/t-xinden/Desktop/Examples/Azure RTOS/getting-started/Microchip/ATSAME54-XPRO/build/CPackSourceConfig.cmake")
set(CPACK_SYSTEM_NAME "Generic")
set(CPACK_TOPLEVEL_TAG "Generic")
set(CPACK_VERBATIM_VARIABLES "YES")
set(CPACK_WIX_SIZEOF_VOID_P "4")

if(NOT CPACK_PROPERTIES_FILE)
  set(CPACK_PROPERTIES_FILE "C:/Users/t-xinden/Desktop/Examples/Azure RTOS/getting-started/Microchip/ATSAME54-XPRO/build/CPackProperties.cmake")
endif()

if(EXISTS ${CPACK_PROPERTIES_FILE})
  include(${CPACK_PROPERTIES_FILE})
endif()

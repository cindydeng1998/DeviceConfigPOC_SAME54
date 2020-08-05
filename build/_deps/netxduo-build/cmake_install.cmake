# Install script for directory: C:/Users/t-xinden/.cpm/netxduo/0c1075509b3c47a37ae4bb2e75260dad004b3309

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/atsame54_azure_iot")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("C:/Users/t-xinden/Desktop/Examples/AzureRTOS/getting-started/Microchip/ATSAME54-XPRO/build/_deps/netxduo-build/ports/cortex_m4/gnu/cmake_install.cmake")
  include("C:/Users/t-xinden/Desktop/Examples/AzureRTOS/getting-started/Microchip/ATSAME54-XPRO/build/_deps/netxduo-build/common/cmake_install.cmake")
  include("C:/Users/t-xinden/Desktop/Examples/AzureRTOS/getting-started/Microchip/ATSAME54-XPRO/build/_deps/netxduo-build/addons/cmake_install.cmake")
  include("C:/Users/t-xinden/Desktop/Examples/AzureRTOS/getting-started/Microchip/ATSAME54-XPRO/build/_deps/netxduo-build/crypto_libraries/cmake_install.cmake")
  include("C:/Users/t-xinden/Desktop/Examples/AzureRTOS/getting-started/Microchip/ATSAME54-XPRO/build/_deps/netxduo-build/nx_secure/cmake_install.cmake")

endif()


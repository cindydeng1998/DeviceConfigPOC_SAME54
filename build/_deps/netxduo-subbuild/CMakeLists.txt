# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.17.3)

# We name the project and the target for the ExternalProject_Add() call
# to something that will highlight to the user what we are working on if
# something goes wrong and an error message is produced.

project(netxduo-populate NONE)

include(ExternalProject)
ExternalProject_Add(netxduo-populate
                     "UPDATE_DISCONNECTED" "False" "GIT_REPOSITORY" "https://github.com/azure-rtos/netxduo.git" "GIT_TAG" "master" "DOWNLOAD_COMMAND" "C:/Program Files (x86)/CMake/bin/cmake.exe"
                    SOURCE_DIR          "C:/Users/t-xinden/.cpm/netxduo/0c1075509b3c47a37ae4bb2e75260dad004b3309"
                    BINARY_DIR          "C:/Users/t-xinden/Desktop/Examples/AzureRTOS/getting-started/Microchip/ATSAME54-XPRO/build/_deps/netxduo-build"
                    CONFIGURE_COMMAND   ""
                    BUILD_COMMAND       ""
                    INSTALL_COMMAND     ""
                    TEST_COMMAND        ""
                    USES_TERMINAL_DOWNLOAD  YES
                    USES_TERMINAL_UPDATE    YES
)

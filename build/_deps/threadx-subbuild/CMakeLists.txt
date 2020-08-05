# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.17.3)

# We name the project and the target for the ExternalProject_Add() call
# to something that will highlight to the user what we are working on if
# something goes wrong and an error message is produced.

project(threadx-populate NONE)

include(ExternalProject)
ExternalProject_Add(threadx-populate
                     "UPDATE_DISCONNECTED" "False" "GIT_REPOSITORY" "https://github.com/azure-rtos/threadx.git" "GIT_TAG" "master" "DOWNLOAD_COMMAND" "C:/Program Files (x86)/CMake/bin/cmake.exe"
                    SOURCE_DIR          "C:/Users/t-xinden/.cpm/threadx/48d2aeea6e9e13f45fa08c42184ac847ba6a65c5"
                    BINARY_DIR          "C:/Users/t-xinden/Desktop/Examples/AzureRTOS/getting-started/Microchip/ATSAME54-XPRO/build/_deps/threadx-build"
                    CONFIGURE_COMMAND   ""
                    BUILD_COMMAND       ""
                    INSTALL_COMMAND     ""
                    TEST_COMMAND        ""
                    USES_TERMINAL_DOWNLOAD  YES
                    USES_TERMINAL_UPDATE    YES
)

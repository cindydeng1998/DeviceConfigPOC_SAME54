
if(NOT "C:/Users/t-xinden/Desktop/Examples/AzureRTOS/getting-started/Microchip/ATSAME54-XPRO/VisualGDB/Debug/_deps/netxduo-subbuild/netxduo-populate-prefix/src/netxduo-populate-stamp/netxduo-populate-gitinfo.txt" IS_NEWER_THAN "C:/Users/t-xinden/Desktop/Examples/AzureRTOS/getting-started/Microchip/ATSAME54-XPRO/VisualGDB/Debug/_deps/netxduo-subbuild/netxduo-populate-prefix/src/netxduo-populate-stamp/netxduo-populate-gitclone-lastrun.txt")
  message(STATUS "Avoiding repeated git clone, stamp file is up to date: 'C:/Users/t-xinden/Desktop/Examples/AzureRTOS/getting-started/Microchip/ATSAME54-XPRO/VisualGDB/Debug/_deps/netxduo-subbuild/netxduo-populate-prefix/src/netxduo-populate-stamp/netxduo-populate-gitclone-lastrun.txt'")
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E remove_directory "C:/Users/t-xinden/Desktop/Examples/AzureRTOS/getting-started/Microchip/ATSAME54-XPRO/VisualGDB/Debug/_deps/netxduo-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: 'C:/Users/t-xinden/Desktop/Examples/AzureRTOS/getting-started/Microchip/ATSAME54-XPRO/VisualGDB/Debug/_deps/netxduo-src'")
endif()

# try the clone 3 times in case there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "C:/Program Files/Git/cmd/git.exe"  clone  "https://github.com/azure-rtos/netxduo.git" "netxduo-src"
    WORKING_DIRECTORY "C:/Users/t-xinden/Desktop/Examples/AzureRTOS/getting-started/Microchip/ATSAME54-XPRO/VisualGDB/Debug/_deps"
    RESULT_VARIABLE error_code
    )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once:
          ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/azure-rtos/netxduo.git'")
endif()

execute_process(
  COMMAND "C:/Program Files/Git/cmd/git.exe"  checkout master --
  WORKING_DIRECTORY "C:/Users/t-xinden/Desktop/Examples/AzureRTOS/getting-started/Microchip/ATSAME54-XPRO/VisualGDB/Debug/_deps/netxduo-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: 'master'")
endif()

execute_process(
  COMMAND "C:/Program Files/Git/cmd/git.exe"  submodule update --recursive --init 
  WORKING_DIRECTORY "C:/Users/t-xinden/Desktop/Examples/AzureRTOS/getting-started/Microchip/ATSAME54-XPRO/VisualGDB/Debug/_deps/netxduo-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: 'C:/Users/t-xinden/Desktop/Examples/AzureRTOS/getting-started/Microchip/ATSAME54-XPRO/VisualGDB/Debug/_deps/netxduo-src'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy
    "C:/Users/t-xinden/Desktop/Examples/AzureRTOS/getting-started/Microchip/ATSAME54-XPRO/VisualGDB/Debug/_deps/netxduo-subbuild/netxduo-populate-prefix/src/netxduo-populate-stamp/netxduo-populate-gitinfo.txt"
    "C:/Users/t-xinden/Desktop/Examples/AzureRTOS/getting-started/Microchip/ATSAME54-XPRO/VisualGDB/Debug/_deps/netxduo-subbuild/netxduo-populate-prefix/src/netxduo-populate-stamp/netxduo-populate-gitclone-lastrun.txt"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: 'C:/Users/t-xinden/Desktop/Examples/AzureRTOS/getting-started/Microchip/ATSAME54-XPRO/VisualGDB/Debug/_deps/netxduo-subbuild/netxduo-populate-prefix/src/netxduo-populate-stamp/netxduo-populate-gitclone-lastrun.txt'")
endif()


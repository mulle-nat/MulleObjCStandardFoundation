cmake_minimum_required( VERSION 3.1)

project( MulleObjCStandardFoundation C)

set( CMAKE_C_DEBUG_FLAGS "${CMAKE_C_DEBUG_FLAGS} -Wuninitialized")

### mulle-sde environment

# add cmake module paths to search path
list( INSERT CMAKE_MODULE_PATH 0 "${PROJECT_SOURCE_DIR}/cmake/share")
list( INSERT CMAKE_MODULE_PATH 0 "${PROJECT_SOURCE_DIR}/cmake/reflect")
list( INSERT CMAKE_MODULE_PATH 0 "${PROJECT_SOURCE_DIR}/cmake")

include( Environment)

include( Files)

### Library

if( HEADERS_PHASE)
   install( FILES ${INSTALL_PUBLIC_HEADERS}  DESTINATION "include/MulleObjCStandardFoundation")
   install( FILES ${INSTALL_PRIVATE_HEADERS} DESTINATION "include/MulleObjCStandardFoundation/private")
   install( FILES ${CMAKE_INCLUDES}          DESTINATION "include/MulleObjCStandardFoundation/cmake")

   # short cut out
   if( NOT COMPILE_PHASE AND NOT LINK_PHASE)
      return()
   endif()
endif()

if( LINK_PHASE)
   include( Dependencies OPTIONAL)
endif()

unset( STARTUP_LIBRARY_NAME)

include( Library)
include( InstallLibrary)
include( FinalOutput OPTIONAL)

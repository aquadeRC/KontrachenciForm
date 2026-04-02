cmake_minimum_required(VERSION 3.16)
project(Kernel VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTORCC ON)

#add_subdirectory(ModeleDanych)
qt_add_qml_module(${PROJECT_NAME}
    STATIC
    URI Kernel
    SOURCES userdatamodel.h userdatamodel.cpp
    SOURCES usernamefiltermodel.h usernamefiltermodel.cpp
    SOURCES jsonwrapper.h jsonwrapper.cpp
    SOURCES UserData.h  
)

target_link_libraries(${PROJECT_NAME}
    PRIVATE Qt6::Quick
    )

cmake_minimum_required(VERSION 3.16)

project(Dialog VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS Quick LinguistTools)

qt_standard_project_setup(REQUIRES 6.8)


# Because modules are not in top folder//
    set(QT_QML_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/)
    set(QML_IMPORT_PATH ${QT_QML_OUTPUT_DIRECTORY}
    CACHE STRING "Import paths for Qt Creator's code model"
    FORCE
    )
# //

add_subdirectory(Kernel)
add_subdirectory(UI)


qt_add_executable(app${PROJECT_NAME}
    main.cpp
    Resources.qrc
)

qt_add_qml_module(app${PROJECT_NAME}
    URI ${PROJECT_NAME}
    QML_FILES
        Main.qml
        RESOURCES Ikony/LogoIntegra.svg
        RESOURCES data/Userdata.json
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(app${PROJECT_NAME} PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appDialog
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_include_directories(app${PROJECT_NAME}
    PUBLIC
    Kernel
    )

target_link_libraries(app${PROJECT_NAME}
    PRIVATE Qt6::Quick
    LG_GUI
    Kernel
)


include(GNUInstallDirs)
install(TARGETS app${PROJECT_NAME}
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

add_custom_target(copy_icons
        COMMAND ${CMAKE_COMMAND} -E copy_directory_if_different
        "${CMAKE_CURRENT_SOURCE_DIR}/Ikony/"
        "${CMAKE_CURRENT_BINARY_DIR}/Ikony"
    COMMENT "Copying icons"
)
add_dependencies(appDialog copy_icons)

add_custom_target(copy_data
        COMMAND ${CMAKE_COMMAND} -E copy_directory_if_different
        "${CMAKE_CURRENT_SOURCE_DIR}/data/"
        "${CMAKE_CURRENT_BINARY_DIR}/data"
    COMMENT "Copying users data"
)
add_dependencies(appDialog copy_data)

qt_generate_deploy_qml_app_script(
    TARGET app${PROJECT_NAME}
    OUTPUT_SCRIPT deploy_script
)
install(SCRIPT ${deploy_script})
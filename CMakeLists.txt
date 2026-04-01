cmake_minimum_required(VERSION 3.16)

project(Dialog VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS Quick LinguistTools)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appDialog 
    main.cpp
    Resources.qrc
)

qt_add_qml_module(appDialog
    URI Dialog
    QML_FILES
        Main.qml
        RESOURCES
        QML_FILES Footer.qml
        QML_FILES PersonPanel.qml
        QML_FILES PersonDataPanel.qml
        RESOURCES Resources.qrc
        QML_FILES UserCombo.qml
        SOURCES userdatamodel.h userdatamodel.cpp
        SOURCES usernamefiltermodel.h usernamefiltermodel.cpp
        SOURCES jsonwrapper.h jsonwrapper.cpp
        SOURCES UserData.h
        RESOURCES data/Userdata.json
        RESOURCES Ikony/checklist.svg
        RESOURCES Ikony/email.svg
        RESOURCES Ikony/Files_has_not_found.png
        RESOURCES Ikony/GlobeSearchNIP.svg
        RESOURCES Ikony/Home.svg
        RESOURCES Ikony/Info.svg
        RESOURCES Ikony/LogoIntegra.svg
        RESOURCES Ikony/mobile-devices-iphone-call-phone.svg
        RESOURCES Ikony/More.svg
        RESOURCES Ikony/NIP.svg
        RESOURCES Ikony/PenEdit2.svg
        RESOURCES Ikony/PenEdit.svg
        RESOURCES Ikony/Phones.svg
        RESOURCES Ikony/plusadd.svg
        RESOURCES Ikony/SearchLoupe.svg
        RESOURCES Ikony/settingsgear.svg
        RESOURCES Ikony/single-user.svg
        RESOURCES Ikony/toolssettings.svg
        RESOURCES Ikony/WindowClose.svg
        RESOURCES Ikony/WindowMaximize.svg
        RESOURCES Ikony/WindowMinimize.svg
        QML_FILES UserComboDelegate.qml
        SOURCES
        QML_FILES NipCombo.qml
        QML_FILES NipFoundBox.qml
        QML_FILES NIpNotFoundBox.qml
        QML_FILES FloatingTitle.qml
        QML_FILES IconTextField.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appDialog PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appDialog
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appDialog
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appDialog
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
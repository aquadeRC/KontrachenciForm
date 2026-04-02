project(LG_GUI VERSION 0.1 LANGUAGES CXX)

qt_add_qml_module(${PROJECT_NAME}
    STATIC
    URI LG_GUI
       QML_FILES Footer.qml
       QML_FILES PersonPanel.qml
       QML_FILES PersonDataPanel.qml
       QML_FILES UserComboDelegate.qml
       QML_FILES NipCombo.qml
       QML_FILES NipFoundBox.qml
       QML_FILES NIpNotFoundBox.qml
       QML_FILES FloatingTitle.qml
       QML_FILES IconTextField.qml
       QML_FILES UserCombo.qml  
       RESOURCES Resources.qrc

       RESOURCES Ikony/checklist.svg
       RESOURCES Ikony/email.svg
       RESOURCES Ikony/Files_has_not_found.png
       RESOURCES Ikony/GlobeSearchNIP.svg
       RESOURCES Ikony/Home.svg
       RESOURCES Ikony/Info.svg
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
)
add_custom_target(copy_UI_icons
        COMMAND ${CMAKE_COMMAND} -E copy_directory_if_different
        "${CMAKE_CURRENT_SOURCE_DIR}/Ikony/"
        "${CMAKE_CURRENT_BINARY_DIR}/Ikony"
    COMMENT "Copying UI icons"
)
add_dependencies(${PROJECT_NAME} copy_UI_icons)

target_link_libraries(${PROJECT_NAME} PRIVATE Qt6::Quick)
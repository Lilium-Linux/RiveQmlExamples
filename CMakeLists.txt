cmake_minimum_required(VERSION 3.24)

project(
    RiveQmlExamples
    VERSION 0.1.0
    DESCRIPTION "Standalone consumer examples for the RiveQml module"
    LANGUAGES CXX
)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

find_package(Qt6 6.8 REQUIRED COMPONENTS Core Gui Qml Quick QuickControls2)

find_package(RiveQml CONFIG QUIET)

if(NOT TARGET RiveQml::RiveQml)
    set(_riveqml_sibling_dir "${CMAKE_CURRENT_SOURCE_DIR}/../RiveQML")

    if(NOT EXISTS "${_riveqml_sibling_dir}/CMakeLists.txt")
        message(FATAL_ERROR
            "RiveQml was not found as an installed package and no sibling checkout exists at "
            "${_riveqml_sibling_dir}."
        )
    endif()

    add_subdirectory("${_riveqml_sibling_dir}" "${CMAKE_CURRENT_BINARY_DIR}/RiveQML")
endif()

if(COMMAND qt_standard_project_setup)
    qt_standard_project_setup(REQUIRES 6.8)
endif()

function(add_rive_example target uri example_dir asset_path)
    qt_add_executable(${target}
        ${example_dir}/main.cpp
    )

    qt_add_qml_module(${target}
        URI ${uri}
        VERSION 1.0
        RESOURCE_PREFIX /
        QML_FILES
            ${example_dir}/Main.qml
        RESOURCES
            ${example_dir}/${asset_path}
    )

    target_link_libraries(${target}
        PRIVATE
            Qt6::Core
            Qt6::Gui
            Qt6::Qml
            Qt6::Quick
            Qt6::QuickControls2
            RiveQml::RiveQml
    )

    target_compile_definitions(
        ${target}
        PRIVATE
            RIVEQML_IMPORT_PATH="${CMAKE_BINARY_DIR}/qml"
    )
endfunction()

add_rive_example(
    BrightnessControlExample
    BrightnessControlExampleApp
    brightness-control
    assets/brightnessControl.riv
)

add_rive_example(
    AnimatedIconsExample
    AnimatedIconsExampleApp
    animated-icons
    assets/animatedIcons.riv
)

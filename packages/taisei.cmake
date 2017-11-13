find_program(MESON meson)
find_program(NINJA ninja)

if((NOT MESON) OR (NOT NINJA))
    message(FATAL_ERROR "Meson and Ninja are required to build Taisei")
endif()

ExternalProject_Add(taisei
    DEPENDS sdl2 sdl2_ttf sdl2_mixer zlib libpng libzip
    GIT_REPOSITORY "https://github.com/taisei-project/taisei.git"
    GIT_TAG meson
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ${CMAKE_COMMAND} -E remove_directory <BINARY_DIR>
        COMMAND ${CMAKE_COMMAND} -E make_directory <BINARY_DIR>
        COMMAND ${EXEC} cd <BINARY_DIR> &&
        ${MESON}
        --prefix=${CMAKE_CURRENT_BINARY_DIR}/taisei-package
        --bindir=
        --cross-file=${MESON_CROSS}
        --buildtype release
        --strip
        -Dstatic=true
        <SOURCE_DIR>
    BUILD_COMMAND ${NINJA}
    INSTALL_COMMAND ${NINJA} install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(taisei)

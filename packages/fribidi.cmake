find_program(MESON meson)
find_program(NINJA ninja)

if((NOT MESON) OR (NOT NINJA))
    message(FATAL_ERROR "Meson and Ninja are required to build fribidi")
endif()

ExternalProject_Add(fribidi
    DEPENDS gcc
    GIT_REPOSITORY "https://github.com/fribidi/fribidi.git"
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ${CMAKE_COMMAND} -E remove_directory <BINARY_DIR>
        COMMAND ${CMAKE_COMMAND} -E make_directory <BINARY_DIR>
        COMMAND ${EXEC} cd <BINARY_DIR> &&
        ${MESON}
        --prefix=${MINGW_INSTALL_PREFIX}
        --cross-file=${MESON_CROSS}
        --default-library=static
        -Ddocs=false
        <SOURCE_DIR>
    BUILD_COMMAND ${NINJA}
    INSTALL_COMMAND ${NINJA} install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(fribidi)

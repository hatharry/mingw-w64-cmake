find_program(NASM nasm)

if(NOT NASM)
    message(FATAL_ERROR "nasm is required to build libass")
endif()

ExternalProject_Add(libass
    DEPENDS
        harfbuzz
        freetype2
        fribidi
        libiconv
    GIT_REPOSITORY "https://github.com/libass/libass.git"
    UPDATE_COMMAND "" 
    CONFIGURE_COMMAND ${EXEC} <SOURCE_DIR>/configure
        --host=${TARGET_ARCH}
        --prefix=${MINGW_INSTALL_PREFIX}
        --disable-shared
        --disable-fontconfig
    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND ${MAKE} install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(libass)
autogen(libass)

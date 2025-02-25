# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

licenses(["notice"])

# Common include paths
sdl_includes = [
    "include",
    "src/video/khronos",
]

objc_library(
    name = "sdl2_objc",
    srcs = glob([
        "include/*.h",
        "src/**/*.h",
        "src/audio/coreaudio/*.m",
        "src/file/cocoa/*.m",
        "src/filesystem/cocoa/*.m",
        "src/joystick/iphoneos/*.m",
        "src/render/metal/*.m",
        "src/video/cocoa/*.m",
    ]),
    includes = sdl_includes,
    sdk_frameworks = [
        "AudioToolbox",
        "Carbon",
        "CoreAudio",
        "CoreHaptics",
        "CoreVideo",
        "Cocoa",
        "ForceFeedback",
        "GameController",
        "IOKit",
        "OpenGL",
        "Metal",
    ],
    alwayslink = 1,
)

sdl_srcs = glob(
    include = [
        "src/**/*.c",
        "src/**/*.h",
    ],
    exclude = [
        # Exclude non-Mac platforms.
        "src/*/android/**",
        "src/*/emscripten/**",
        "src/*/gdk/**",
        "src/*/libusb/**",
        "src/*/linux/**",
        "src/*/n3ds/**",
        "src/*/openbsd/**",
        "src/*/os2/**",
        "src/*/ps2/**",
        "src/*/psp/**",
        "src/*/qnx/**",
        "src/*/riscos/**",
        "src/*/vita/**",
        "src/*/windows/**",
        "src/*/winrt/**",
        # These C files are included as headers.
        "src/hidapi/mac/**",
        "src/thread/generic/**",
        # Exclude tests.
        "src/test/**",
    ],
)

# In general, we bundle SDL2.  However, on Linux that would require a header
# generated by --configure, and a lot of buildflags and installing dev headers
# is in general less painful, so we just link it dynamically.
cc_library(
    name = "sdl2",
    srcs = select({
        "@platforms//os:linux": [],
        "@platforms//os:osx": sdl_srcs,
    }),
    hdrs = glob(["include/*.h"]),
    includes = sdl_includes,
    linkopts = select({
        "@platforms//os:linux": ["-lSDL2"],
        "@platforms//os:osx": [],
    }),
    textual_hdrs = glob([
        "src/hidapi/mac/*.c",
        "src/thread/generic/*.c",
    ]),
    visibility = ["//visibility:public"],
    deps = select({
        "@platforms//os:linux": [],
        "@platforms//os:osx": [":sdl2_objc"],
    }),
)

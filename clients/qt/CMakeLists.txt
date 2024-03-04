set(CMAKE_AUTOMOC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

# policy regarding how to handle generated stuff, OLD behavior would ignore generated files
# (which includes the generated protobuf cpp files)
if (POLICY CMP0071)
    cmake_policy(SET CMP0071 NEW)
endif()

set(libs)

find_package(Qt5 COMPONENTS Core Widgets Network REQUIRED)
list(APPEND libs Qt5::Core Qt5::Widgets Qt5::Network)

find_package(protobuf CONFIG REQUIRED)
list(APPEND libs protobuf::libprotobuf)

protobuf_generate_cpp(PROTO_CPP PROTO_H
    ../../src/proto/grSim_Replacement.proto
    ../../src/proto/grSim_Commands.proto
    ../../src/proto/grSim_Packet.proto
)

set(app client)

add_executable(${app} MACOSX_BUNDLE
    ${PROTO_CPP}
    ${PROTO_H}
    main.cpp
    mainwindow.cpp
    mainwindow.h
)

if(TARGET protobuf_external)
    add_dependencies(${app} protobuf_external)
endif()

target_link_libraries(${app} ${libs})

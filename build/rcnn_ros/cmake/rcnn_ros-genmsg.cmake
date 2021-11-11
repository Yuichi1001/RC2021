# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "rcnn_ros: 2 messages, 0 services")

set(MSG_I_FLAGS "-Ircnn_ros:/home/qudoudou/RC2021/src/rcnn_ros/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(rcnn_ros_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/qudoudou/RC2021/src/rcnn_ros/msg/results.msg" NAME_WE)
add_custom_target(_rcnn_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rcnn_ros" "/home/qudoudou/RC2021/src/rcnn_ros/msg/results.msg" "rcnn_ros/detection"
)

get_filename_component(_filename "/home/qudoudou/RC2021/src/rcnn_ros/msg/detection.msg" NAME_WE)
add_custom_target(_rcnn_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rcnn_ros" "/home/qudoudou/RC2021/src/rcnn_ros/msg/detection.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(rcnn_ros
  "/home/qudoudou/RC2021/src/rcnn_ros/msg/results.msg"
  "${MSG_I_FLAGS}"
  "/home/qudoudou/RC2021/src/rcnn_ros/msg/detection.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rcnn_ros
)
_generate_msg_cpp(rcnn_ros
  "/home/qudoudou/RC2021/src/rcnn_ros/msg/detection.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rcnn_ros
)

### Generating Services

### Generating Module File
_generate_module_cpp(rcnn_ros
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rcnn_ros
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(rcnn_ros_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(rcnn_ros_generate_messages rcnn_ros_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/qudoudou/RC2021/src/rcnn_ros/msg/results.msg" NAME_WE)
add_dependencies(rcnn_ros_generate_messages_cpp _rcnn_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qudoudou/RC2021/src/rcnn_ros/msg/detection.msg" NAME_WE)
add_dependencies(rcnn_ros_generate_messages_cpp _rcnn_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rcnn_ros_gencpp)
add_dependencies(rcnn_ros_gencpp rcnn_ros_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rcnn_ros_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(rcnn_ros
  "/home/qudoudou/RC2021/src/rcnn_ros/msg/results.msg"
  "${MSG_I_FLAGS}"
  "/home/qudoudou/RC2021/src/rcnn_ros/msg/detection.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rcnn_ros
)
_generate_msg_eus(rcnn_ros
  "/home/qudoudou/RC2021/src/rcnn_ros/msg/detection.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rcnn_ros
)

### Generating Services

### Generating Module File
_generate_module_eus(rcnn_ros
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rcnn_ros
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(rcnn_ros_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(rcnn_ros_generate_messages rcnn_ros_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/qudoudou/RC2021/src/rcnn_ros/msg/results.msg" NAME_WE)
add_dependencies(rcnn_ros_generate_messages_eus _rcnn_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qudoudou/RC2021/src/rcnn_ros/msg/detection.msg" NAME_WE)
add_dependencies(rcnn_ros_generate_messages_eus _rcnn_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rcnn_ros_geneus)
add_dependencies(rcnn_ros_geneus rcnn_ros_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rcnn_ros_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(rcnn_ros
  "/home/qudoudou/RC2021/src/rcnn_ros/msg/results.msg"
  "${MSG_I_FLAGS}"
  "/home/qudoudou/RC2021/src/rcnn_ros/msg/detection.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rcnn_ros
)
_generate_msg_lisp(rcnn_ros
  "/home/qudoudou/RC2021/src/rcnn_ros/msg/detection.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rcnn_ros
)

### Generating Services

### Generating Module File
_generate_module_lisp(rcnn_ros
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rcnn_ros
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(rcnn_ros_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(rcnn_ros_generate_messages rcnn_ros_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/qudoudou/RC2021/src/rcnn_ros/msg/results.msg" NAME_WE)
add_dependencies(rcnn_ros_generate_messages_lisp _rcnn_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qudoudou/RC2021/src/rcnn_ros/msg/detection.msg" NAME_WE)
add_dependencies(rcnn_ros_generate_messages_lisp _rcnn_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rcnn_ros_genlisp)
add_dependencies(rcnn_ros_genlisp rcnn_ros_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rcnn_ros_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(rcnn_ros
  "/home/qudoudou/RC2021/src/rcnn_ros/msg/results.msg"
  "${MSG_I_FLAGS}"
  "/home/qudoudou/RC2021/src/rcnn_ros/msg/detection.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rcnn_ros
)
_generate_msg_nodejs(rcnn_ros
  "/home/qudoudou/RC2021/src/rcnn_ros/msg/detection.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rcnn_ros
)

### Generating Services

### Generating Module File
_generate_module_nodejs(rcnn_ros
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rcnn_ros
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(rcnn_ros_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(rcnn_ros_generate_messages rcnn_ros_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/qudoudou/RC2021/src/rcnn_ros/msg/results.msg" NAME_WE)
add_dependencies(rcnn_ros_generate_messages_nodejs _rcnn_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qudoudou/RC2021/src/rcnn_ros/msg/detection.msg" NAME_WE)
add_dependencies(rcnn_ros_generate_messages_nodejs _rcnn_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rcnn_ros_gennodejs)
add_dependencies(rcnn_ros_gennodejs rcnn_ros_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rcnn_ros_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(rcnn_ros
  "/home/qudoudou/RC2021/src/rcnn_ros/msg/results.msg"
  "${MSG_I_FLAGS}"
  "/home/qudoudou/RC2021/src/rcnn_ros/msg/detection.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rcnn_ros
)
_generate_msg_py(rcnn_ros
  "/home/qudoudou/RC2021/src/rcnn_ros/msg/detection.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rcnn_ros
)

### Generating Services

### Generating Module File
_generate_module_py(rcnn_ros
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rcnn_ros
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(rcnn_ros_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(rcnn_ros_generate_messages rcnn_ros_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/qudoudou/RC2021/src/rcnn_ros/msg/results.msg" NAME_WE)
add_dependencies(rcnn_ros_generate_messages_py _rcnn_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qudoudou/RC2021/src/rcnn_ros/msg/detection.msg" NAME_WE)
add_dependencies(rcnn_ros_generate_messages_py _rcnn_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rcnn_ros_genpy)
add_dependencies(rcnn_ros_genpy rcnn_ros_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rcnn_ros_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rcnn_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rcnn_ros
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rcnn_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rcnn_ros
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rcnn_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rcnn_ros
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rcnn_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rcnn_ros
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rcnn_ros)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rcnn_ros\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rcnn_ros
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()

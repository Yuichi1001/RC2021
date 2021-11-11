; Auto-generated. Do not edit!


(cl:in-package rcnn_ros-msg)


;//! \htmlinclude detection.msg.html

(cl:defclass <detection> (roslisp-msg-protocol:ros-message)
  ((class_id
    :reader class_id
    :initarg :class_id
    :type cl:float
    :initform 0.0)
   (conf
    :reader conf
    :initarg :conf
    :type cl:float
    :initform 0.0)
   (x_axis
    :reader x_axis
    :initarg :x_axis
    :type cl:float
    :initform 0.0)
   (y_axis
    :reader y_axis
    :initarg :y_axis
    :type cl:float
    :initform 0.0)
   (weight
    :reader weight
    :initarg :weight
    :type cl:float
    :initform 0.0)
   (height
    :reader height
    :initarg :height
    :type cl:float
    :initform 0.0))
)

(cl:defclass detection (<detection>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <detection>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'detection)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rcnn_ros-msg:<detection> is deprecated: use rcnn_ros-msg:detection instead.")))

(cl:ensure-generic-function 'class_id-val :lambda-list '(m))
(cl:defmethod class_id-val ((m <detection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rcnn_ros-msg:class_id-val is deprecated.  Use rcnn_ros-msg:class_id instead.")
  (class_id m))

(cl:ensure-generic-function 'conf-val :lambda-list '(m))
(cl:defmethod conf-val ((m <detection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rcnn_ros-msg:conf-val is deprecated.  Use rcnn_ros-msg:conf instead.")
  (conf m))

(cl:ensure-generic-function 'x_axis-val :lambda-list '(m))
(cl:defmethod x_axis-val ((m <detection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rcnn_ros-msg:x_axis-val is deprecated.  Use rcnn_ros-msg:x_axis instead.")
  (x_axis m))

(cl:ensure-generic-function 'y_axis-val :lambda-list '(m))
(cl:defmethod y_axis-val ((m <detection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rcnn_ros-msg:y_axis-val is deprecated.  Use rcnn_ros-msg:y_axis instead.")
  (y_axis m))

(cl:ensure-generic-function 'weight-val :lambda-list '(m))
(cl:defmethod weight-val ((m <detection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rcnn_ros-msg:weight-val is deprecated.  Use rcnn_ros-msg:weight instead.")
  (weight m))

(cl:ensure-generic-function 'height-val :lambda-list '(m))
(cl:defmethod height-val ((m <detection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rcnn_ros-msg:height-val is deprecated.  Use rcnn_ros-msg:height instead.")
  (height m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <detection>) ostream)
  "Serializes a message object of type '<detection>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'class_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'conf))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x_axis))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y_axis))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'weight))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'height))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <detection>) istream)
  "Deserializes a message object of type '<detection>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'class_id) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'conf) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x_axis) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y_axis) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'weight) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'height) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<detection>)))
  "Returns string type for a message object of type '<detection>"
  "rcnn_ros/detection")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'detection)))
  "Returns string type for a message object of type 'detection"
  "rcnn_ros/detection")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<detection>)))
  "Returns md5sum for a message object of type '<detection>"
  "18249658e877a86d85ab6523f10897f4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'detection)))
  "Returns md5sum for a message object of type 'detection"
  "18249658e877a86d85ab6523f10897f4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<detection>)))
  "Returns full string definition for message of type '<detection>"
  (cl:format cl:nil "float32 class_id~%float32 conf~%float32 x_axis~%float32 y_axis~%float32 weight~%float32 height~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'detection)))
  "Returns full string definition for message of type 'detection"
  (cl:format cl:nil "float32 class_id~%float32 conf~%float32 x_axis~%float32 y_axis~%float32 weight~%float32 height~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <detection>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <detection>))
  "Converts a ROS message object to a list"
  (cl:list 'detection
    (cl:cons ':class_id (class_id msg))
    (cl:cons ':conf (conf msg))
    (cl:cons ':x_axis (x_axis msg))
    (cl:cons ':y_axis (y_axis msg))
    (cl:cons ':weight (weight msg))
    (cl:cons ':height (height msg))
))

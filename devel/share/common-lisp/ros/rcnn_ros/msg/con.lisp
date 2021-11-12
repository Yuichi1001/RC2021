; Auto-generated. Do not edit!


(cl:in-package rcnn_ros-msg)


;//! \htmlinclude con.msg.html

(cl:defclass <con> (roslisp-msg-protocol:ros-message)
  ((points
    :reader points
    :initarg :points
    :type (cl:vector rcnn_ros-msg:point)
   :initform (cl:make-array 0 :element-type 'rcnn_ros-msg:point :initial-element (cl:make-instance 'rcnn_ros-msg:point))))
)

(cl:defclass con (<con>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <con>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'con)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rcnn_ros-msg:<con> is deprecated: use rcnn_ros-msg:con instead.")))

(cl:ensure-generic-function 'points-val :lambda-list '(m))
(cl:defmethod points-val ((m <con>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rcnn_ros-msg:points-val is deprecated.  Use rcnn_ros-msg:points instead.")
  (points m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <con>) ostream)
  "Serializes a message object of type '<con>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'points))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'points))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <con>) istream)
  "Deserializes a message object of type '<con>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'points) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'points)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'rcnn_ros-msg:point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<con>)))
  "Returns string type for a message object of type '<con>"
  "rcnn_ros/con")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'con)))
  "Returns string type for a message object of type 'con"
  "rcnn_ros/con")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<con>)))
  "Returns md5sum for a message object of type '<con>"
  "0fdb65a22c648d991c020db3d6e69363")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'con)))
  "Returns md5sum for a message object of type 'con"
  "0fdb65a22c648d991c020db3d6e69363")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<con>)))
  "Returns full string definition for message of type '<con>"
  (cl:format cl:nil "rcnn_ros/point[] points~%~%================================================================================~%MSG: rcnn_ros/point~%int32 x~%int32 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'con)))
  "Returns full string definition for message of type 'con"
  (cl:format cl:nil "rcnn_ros/point[] points~%~%================================================================================~%MSG: rcnn_ros/point~%int32 x~%int32 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <con>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'points) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <con>))
  "Converts a ROS message object to a list"
  (cl:list 'con
    (cl:cons ':points (points msg))
))

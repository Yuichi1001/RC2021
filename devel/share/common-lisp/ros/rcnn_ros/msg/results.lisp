; Auto-generated. Do not edit!


(cl:in-package rcnn_ros-msg)


;//! \htmlinclude results.msg.html

(cl:defclass <results> (roslisp-msg-protocol:ros-message)
  ((stamp
    :reader stamp
    :initarg :stamp
    :type cl:real
    :initform 0)
   (results
    :reader results
    :initarg :results
    :type (cl:vector rcnn_ros-msg:detection)
   :initform (cl:make-array 0 :element-type 'rcnn_ros-msg:detection :initial-element (cl:make-instance 'rcnn_ros-msg:detection))))
)

(cl:defclass results (<results>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <results>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'results)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rcnn_ros-msg:<results> is deprecated: use rcnn_ros-msg:results instead.")))

(cl:ensure-generic-function 'stamp-val :lambda-list '(m))
(cl:defmethod stamp-val ((m <results>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rcnn_ros-msg:stamp-val is deprecated.  Use rcnn_ros-msg:stamp instead.")
  (stamp m))

(cl:ensure-generic-function 'results-val :lambda-list '(m))
(cl:defmethod results-val ((m <results>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rcnn_ros-msg:results-val is deprecated.  Use rcnn_ros-msg:results instead.")
  (results m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <results>) ostream)
  "Serializes a message object of type '<results>"
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'stamp)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'stamp) (cl:floor (cl:slot-value msg 'stamp)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'results))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'results))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <results>) istream)
  "Deserializes a message object of type '<results>"
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'stamp) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'results) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'results)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'rcnn_ros-msg:detection))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<results>)))
  "Returns string type for a message object of type '<results>"
  "rcnn_ros/results")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'results)))
  "Returns string type for a message object of type 'results"
  "rcnn_ros/results")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<results>)))
  "Returns md5sum for a message object of type '<results>"
  "128a74f45c3c1bb074f854b411cdfc9d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'results)))
  "Returns md5sum for a message object of type 'results"
  "128a74f45c3c1bb074f854b411cdfc9d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<results>)))
  "Returns full string definition for message of type '<results>"
  (cl:format cl:nil "time stamp~%rcnn_ros/detection[] results~%~%================================================================================~%MSG: rcnn_ros/detection~%int32 label~%float32 score~%float32 x1~%float32 y1~%float32 x2~%float32 y2~%rcnn_ros/point[] contours~%~%================================================================================~%MSG: rcnn_ros/point~%int32 x~%int32 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'results)))
  "Returns full string definition for message of type 'results"
  (cl:format cl:nil "time stamp~%rcnn_ros/detection[] results~%~%================================================================================~%MSG: rcnn_ros/detection~%int32 label~%float32 score~%float32 x1~%float32 y1~%float32 x2~%float32 y2~%rcnn_ros/point[] contours~%~%================================================================================~%MSG: rcnn_ros/point~%int32 x~%int32 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <results>))
  (cl:+ 0
     8
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'results) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <results>))
  "Converts a ROS message object to a list"
  (cl:list 'results
    (cl:cons ':stamp (stamp msg))
    (cl:cons ':results (results msg))
))

;; Auto-generated. Do not edit!


(when (boundp 'rcnn_ros::detection)
  (if (not (find-package "RCNN_ROS"))
    (make-package "RCNN_ROS"))
  (shadow 'detection (find-package "RCNN_ROS")))
(unless (find-package "RCNN_ROS::DETECTION")
  (make-package "RCNN_ROS::DETECTION"))

(in-package "ROS")
;;//! \htmlinclude detection.msg.html


(defclass rcnn_ros::detection
  :super ros::object
  :slots (_class_id _conf _x_axis _y_axis _weight _height ))

(defmethod rcnn_ros::detection
  (:init
   (&key
    ((:class_id __class_id) 0.0)
    ((:conf __conf) 0.0)
    ((:x_axis __x_axis) 0.0)
    ((:y_axis __y_axis) 0.0)
    ((:weight __weight) 0.0)
    ((:height __height) 0.0)
    )
   (send-super :init)
   (setq _class_id (float __class_id))
   (setq _conf (float __conf))
   (setq _x_axis (float __x_axis))
   (setq _y_axis (float __y_axis))
   (setq _weight (float __weight))
   (setq _height (float __height))
   self)
  (:class_id
   (&optional __class_id)
   (if __class_id (setq _class_id __class_id)) _class_id)
  (:conf
   (&optional __conf)
   (if __conf (setq _conf __conf)) _conf)
  (:x_axis
   (&optional __x_axis)
   (if __x_axis (setq _x_axis __x_axis)) _x_axis)
  (:y_axis
   (&optional __y_axis)
   (if __y_axis (setq _y_axis __y_axis)) _y_axis)
  (:weight
   (&optional __weight)
   (if __weight (setq _weight __weight)) _weight)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:serialization-length
   ()
   (+
    ;; float32 _class_id
    4
    ;; float32 _conf
    4
    ;; float32 _x_axis
    4
    ;; float32 _y_axis
    4
    ;; float32 _weight
    4
    ;; float32 _height
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _class_id
       (sys::poke _class_id (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _conf
       (sys::poke _conf (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _x_axis
       (sys::poke _x_axis (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y_axis
       (sys::poke _y_axis (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _weight
       (sys::poke _weight (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _height
       (sys::poke _height (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _class_id
     (setq _class_id (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _conf
     (setq _conf (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _x_axis
     (setq _x_axis (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y_axis
     (setq _y_axis (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _weight
     (setq _weight (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _height
     (setq _height (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get rcnn_ros::detection :md5sum-) "18249658e877a86d85ab6523f10897f4")
(setf (get rcnn_ros::detection :datatype-) "rcnn_ros/detection")
(setf (get rcnn_ros::detection :definition-)
      "float32 class_id
float32 conf
float32 x_axis
float32 y_axis
float32 weight
float32 height
")



(provide :rcnn_ros/detection "18249658e877a86d85ab6523f10897f4")



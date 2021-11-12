;; Auto-generated. Do not edit!


(when (boundp 'rcnn_ros::con)
  (if (not (find-package "RCNN_ROS"))
    (make-package "RCNN_ROS"))
  (shadow 'con (find-package "RCNN_ROS")))
(unless (find-package "RCNN_ROS::CON")
  (make-package "RCNN_ROS::CON"))

(in-package "ROS")
;;//! \htmlinclude con.msg.html


(defclass rcnn_ros::con
  :super ros::object
  :slots (_points ))

(defmethod rcnn_ros::con
  (:init
   (&key
    ((:points __points) (let (r) (dotimes (i 0) (push (instance rcnn_ros::point :init) r)) r))
    )
   (send-super :init)
   (setq _points __points)
   self)
  (:points
   (&rest __points)
   (if (keywordp (car __points))
       (send* _points __points)
     (progn
       (if __points (setq _points (car __points)))
       _points)))
  (:serialization-length
   ()
   (+
    ;; rcnn_ros/point[] _points
    (apply #'+ (send-all _points :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; rcnn_ros/point[] _points
     (write-long (length _points) s)
     (dolist (elem _points)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; rcnn_ros/point[] _points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _points (let (r) (dotimes (i n) (push (instance rcnn_ros::point :init) r)) r))
     (dolist (elem- _points)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get rcnn_ros::con :md5sum-) "0fdb65a22c648d991c020db3d6e69363")
(setf (get rcnn_ros::con :datatype-) "rcnn_ros/con")
(setf (get rcnn_ros::con :definition-)
      "rcnn_ros/point[] points

================================================================================
MSG: rcnn_ros/point
int32 x
int32 y

")



(provide :rcnn_ros/con "0fdb65a22c648d991c020db3d6e69363")



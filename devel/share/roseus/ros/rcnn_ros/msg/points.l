;; Auto-generated. Do not edit!


(when (boundp 'rcnn_ros::points)
  (if (not (find-package "RCNN_ROS"))
    (make-package "RCNN_ROS"))
  (shadow 'points (find-package "RCNN_ROS")))
(unless (find-package "RCNN_ROS::POINTS")
  (make-package "RCNN_ROS::POINTS"))

(in-package "ROS")
;;//! \htmlinclude points.msg.html


(defclass rcnn_ros::points
  :super ros::object
  :slots (_points ))

(defmethod rcnn_ros::points
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

(setf (get rcnn_ros::points :md5sum-) "6ce136a87e01d93db92be5dd91e0f8f1")
(setf (get rcnn_ros::points :datatype-) "rcnn_ros/points")
(setf (get rcnn_ros::points :definition-)
      "rcnn_ros/point[] points

================================================================================
MSG: rcnn_ros/point
int32 point

")



(provide :rcnn_ros/points "6ce136a87e01d93db92be5dd91e0f8f1")



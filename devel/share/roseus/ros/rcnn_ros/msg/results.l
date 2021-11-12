;; Auto-generated. Do not edit!


(when (boundp 'rcnn_ros::results)
  (if (not (find-package "RCNN_ROS"))
    (make-package "RCNN_ROS"))
  (shadow 'results (find-package "RCNN_ROS")))
(unless (find-package "RCNN_ROS::RESULTS")
  (make-package "RCNN_ROS::RESULTS"))

(in-package "ROS")
;;//! \htmlinclude results.msg.html


(defclass rcnn_ros::results
  :super ros::object
  :slots (_stamp _results ))

(defmethod rcnn_ros::results
  (:init
   (&key
    ((:stamp __stamp) (instance ros::time :init))
    ((:results __results) (let (r) (dotimes (i 0) (push (instance rcnn_ros::detection :init) r)) r))
    )
   (send-super :init)
   (setq _stamp __stamp)
   (setq _results __results)
   self)
  (:stamp
   (&optional __stamp)
   (if __stamp (setq _stamp __stamp)) _stamp)
  (:results
   (&rest __results)
   (if (keywordp (car __results))
       (send* _results __results)
     (progn
       (if __results (setq _results (car __results)))
       _results)))
  (:serialization-length
   ()
   (+
    ;; time _stamp
    8
    ;; rcnn_ros/detection[] _results
    (apply #'+ (send-all _results :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; time _stamp
       (write-long (send _stamp :sec) s) (write-long (send _stamp :nsec) s)
     ;; rcnn_ros/detection[] _results
     (write-long (length _results) s)
     (dolist (elem _results)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; time _stamp
     (send _stamp :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _stamp :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; rcnn_ros/detection[] _results
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _results (let (r) (dotimes (i n) (push (instance rcnn_ros::detection :init) r)) r))
     (dolist (elem- _results)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get rcnn_ros::results :md5sum-) "128a74f45c3c1bb074f854b411cdfc9d")
(setf (get rcnn_ros::results :datatype-) "rcnn_ros/results")
(setf (get rcnn_ros::results :definition-)
      "time stamp
rcnn_ros/detection[] results

================================================================================
MSG: rcnn_ros/detection
int32 label
float32 score
float32 x1
float32 y1
float32 x2
float32 y2
rcnn_ros/point[] contours

================================================================================
MSG: rcnn_ros/point
int32 x
int32 y

")



(provide :rcnn_ros/results "128a74f45c3c1bb074f854b411cdfc9d")



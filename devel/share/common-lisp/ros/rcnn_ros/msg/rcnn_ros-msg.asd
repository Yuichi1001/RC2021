
(cl:in-package :asdf)

(defsystem "rcnn_ros-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "detection" :depends-on ("_package_detection"))
    (:file "_package_detection" :depends-on ("_package"))
    (:file "point" :depends-on ("_package_point"))
    (:file "_package_point" :depends-on ("_package"))
    (:file "results" :depends-on ("_package_results"))
    (:file "_package_results" :depends-on ("_package"))
  ))
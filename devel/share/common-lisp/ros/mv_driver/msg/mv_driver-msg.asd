
(cl:in-package :asdf)

(defsystem "mv_driver-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "raw_img" :depends-on ("_package_raw_img"))
    (:file "_package_raw_img" :depends-on ("_package"))
  ))
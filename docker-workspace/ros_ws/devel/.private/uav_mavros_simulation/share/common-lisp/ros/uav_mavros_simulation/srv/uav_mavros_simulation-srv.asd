
(cl:in-package :asdf)

(defsystem "uav_mavros_simulation-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :mavros_msgs-msg
)
  :components ((:file "_package")
    (:file "goto_aruco" :depends-on ("_package_goto_aruco"))
    (:file "_package_goto_aruco" :depends-on ("_package"))
    (:file "land_aruco" :depends-on ("_package_land_aruco"))
    (:file "_package_land_aruco" :depends-on ("_package"))
    (:file "target_global_pos" :depends-on ("_package_target_global_pos"))
    (:file "_package_target_global_pos" :depends-on ("_package"))
    (:file "target_local_pos" :depends-on ("_package_target_local_pos"))
    (:file "_package_target_local_pos" :depends-on ("_package"))
  ))
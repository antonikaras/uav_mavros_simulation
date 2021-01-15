;; Auto-generated. Do not edit!


(when (boundp 'uav_mavros_simulation::goto_aruco)
  (if (not (find-package "UAV_MAVROS_SIMULATION"))
    (make-package "UAV_MAVROS_SIMULATION"))
  (shadow 'goto_aruco (find-package "UAV_MAVROS_SIMULATION")))
(unless (find-package "UAV_MAVROS_SIMULATION::GOTO_ARUCO")
  (make-package "UAV_MAVROS_SIMULATION::GOTO_ARUCO"))
(unless (find-package "UAV_MAVROS_SIMULATION::GOTO_ARUCOREQUEST")
  (make-package "UAV_MAVROS_SIMULATION::GOTO_ARUCOREQUEST"))
(unless (find-package "UAV_MAVROS_SIMULATION::GOTO_ARUCORESPONSE")
  (make-package "UAV_MAVROS_SIMULATION::GOTO_ARUCORESPONSE"))

(in-package "ROS")





(defclass uav_mavros_simulation::goto_arucoRequest
  :super ros::object
  :slots (_timeOut ))

(defmethod uav_mavros_simulation::goto_arucoRequest
  (:init
   (&key
    ((:timeOut __timeOut) 0.0)
    )
   (send-super :init)
   (setq _timeOut (float __timeOut))
   self)
  (:timeOut
   (&optional __timeOut)
   (if __timeOut (setq _timeOut __timeOut)) _timeOut)
  (:serialization-length
   ()
   (+
    ;; float64 _timeOut
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _timeOut
       (sys::poke _timeOut (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _timeOut
     (setq _timeOut (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass uav_mavros_simulation::goto_arucoResponse
  :super ros::object
  :slots (_dist ))

(defmethod uav_mavros_simulation::goto_arucoResponse
  (:init
   (&key
    ((:dist __dist) 0.0)
    )
   (send-super :init)
   (setq _dist (float __dist))
   self)
  (:dist
   (&optional __dist)
   (if __dist (setq _dist __dist)) _dist)
  (:serialization-length
   ()
   (+
    ;; float64 _dist
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _dist
       (sys::poke _dist (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _dist
     (setq _dist (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass uav_mavros_simulation::goto_aruco
  :super ros::object
  :slots ())

(setf (get uav_mavros_simulation::goto_aruco :md5sum-) "02fd582894f05f0c4b5cc3fc3ea23d3d")
(setf (get uav_mavros_simulation::goto_aruco :datatype-) "uav_mavros_simulation/goto_aruco")
(setf (get uav_mavros_simulation::goto_aruco :request) uav_mavros_simulation::goto_arucoRequest)
(setf (get uav_mavros_simulation::goto_aruco :response) uav_mavros_simulation::goto_arucoResponse)

(defmethod uav_mavros_simulation::goto_arucoRequest
  (:response () (instance uav_mavros_simulation::goto_arucoResponse :init)))

(setf (get uav_mavros_simulation::goto_arucoRequest :md5sum-) "02fd582894f05f0c4b5cc3fc3ea23d3d")
(setf (get uav_mavros_simulation::goto_arucoRequest :datatype-) "uav_mavros_simulation/goto_arucoRequest")
(setf (get uav_mavros_simulation::goto_arucoRequest :definition-)
      "float64 timeOut
---
float64 dist
")

(setf (get uav_mavros_simulation::goto_arucoResponse :md5sum-) "02fd582894f05f0c4b5cc3fc3ea23d3d")
(setf (get uav_mavros_simulation::goto_arucoResponse :datatype-) "uav_mavros_simulation/goto_arucoResponse")
(setf (get uav_mavros_simulation::goto_arucoResponse :definition-)
      "float64 timeOut
---
float64 dist
")



(provide :uav_mavros_simulation/goto_aruco "02fd582894f05f0c4b5cc3fc3ea23d3d")



;; Auto-generated. Do not edit!


(when (boundp 'uav_mavros_simulation::target_local_pos)
  (if (not (find-package "UAV_MAVROS_SIMULATION"))
    (make-package "UAV_MAVROS_SIMULATION"))
  (shadow 'target_local_pos (find-package "UAV_MAVROS_SIMULATION")))
(unless (find-package "UAV_MAVROS_SIMULATION::TARGET_LOCAL_POS")
  (make-package "UAV_MAVROS_SIMULATION::TARGET_LOCAL_POS"))
(unless (find-package "UAV_MAVROS_SIMULATION::TARGET_LOCAL_POSREQUEST")
  (make-package "UAV_MAVROS_SIMULATION::TARGET_LOCAL_POSREQUEST"))
(unless (find-package "UAV_MAVROS_SIMULATION::TARGET_LOCAL_POSRESPONSE")
  (make-package "UAV_MAVROS_SIMULATION::TARGET_LOCAL_POSRESPONSE"))

(in-package "ROS")

(if (not (find-package "MAVROS_MSGS"))
  (ros::roseus-add-msgs "mavros_msgs"))




(defclass uav_mavros_simulation::target_local_posRequest
  :super ros::object
  :slots (_goal_pos ))

(defmethod uav_mavros_simulation::target_local_posRequest
  (:init
   (&key
    ((:goal_pos __goal_pos) (instance mavros_msgs::PositionTarget :init))
    )
   (send-super :init)
   (setq _goal_pos __goal_pos)
   self)
  (:goal_pos
   (&rest __goal_pos)
   (if (keywordp (car __goal_pos))
       (send* _goal_pos __goal_pos)
     (progn
       (if __goal_pos (setq _goal_pos (car __goal_pos)))
       _goal_pos)))
  (:serialization-length
   ()
   (+
    ;; mavros_msgs/PositionTarget _goal_pos
    (send _goal_pos :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; mavros_msgs/PositionTarget _goal_pos
       (send _goal_pos :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; mavros_msgs/PositionTarget _goal_pos
     (send _goal_pos :deserialize buf ptr-) (incf ptr- (send _goal_pos :serialization-length))
   ;;
   self)
  )

(defclass uav_mavros_simulation::target_local_posResponse
  :super ros::object
  :slots (_dist ))

(defmethod uav_mavros_simulation::target_local_posResponse
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

(defclass uav_mavros_simulation::target_local_pos
  :super ros::object
  :slots ())

(setf (get uav_mavros_simulation::target_local_pos :md5sum-) "fb2d2cec436c25bb2c92caf8218fe6ff")
(setf (get uav_mavros_simulation::target_local_pos :datatype-) "uav_mavros_simulation/target_local_pos")
(setf (get uav_mavros_simulation::target_local_pos :request) uav_mavros_simulation::target_local_posRequest)
(setf (get uav_mavros_simulation::target_local_pos :response) uav_mavros_simulation::target_local_posResponse)

(defmethod uav_mavros_simulation::target_local_posRequest
  (:response () (instance uav_mavros_simulation::target_local_posResponse :init)))

(setf (get uav_mavros_simulation::target_local_posRequest :md5sum-) "fb2d2cec436c25bb2c92caf8218fe6ff")
(setf (get uav_mavros_simulation::target_local_posRequest :datatype-) "uav_mavros_simulation/target_local_posRequest")
(setf (get uav_mavros_simulation::target_local_posRequest :definition-)
      "mavros_msgs/PositionTarget goal_pos

================================================================================
MSG: mavros_msgs/PositionTarget
# Message for SET_POSITION_TARGET_LOCAL_NED
#
# Some complex system requires all feautures that mavlink
# message provide. See issue #402.

std_msgs/Header header

uint8 coordinate_frame
uint8 FRAME_LOCAL_NED = 1
uint8 FRAME_LOCAL_OFFSET_NED = 7
uint8 FRAME_BODY_NED = 8
uint8 FRAME_BODY_OFFSET_NED = 9

uint16 type_mask
uint16 IGNORE_PX = 1	# Position ignore flags
uint16 IGNORE_PY = 2
uint16 IGNORE_PZ = 4
uint16 IGNORE_VX = 8	# Velocity vector ignore flags
uint16 IGNORE_VY = 16
uint16 IGNORE_VZ = 32
uint16 IGNORE_AFX = 64	# Acceleration/Force vector ignore flags
uint16 IGNORE_AFY = 128
uint16 IGNORE_AFZ = 256
uint16 FORCE = 512	# Force in af vector flag
uint16 IGNORE_YAW = 1024
uint16 IGNORE_YAW_RATE = 2048

geometry_msgs/Point position
geometry_msgs/Vector3 velocity
geometry_msgs/Vector3 acceleration_or_force
float32 yaw
float32 yaw_rate

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
---
float64 dist
")

(setf (get uav_mavros_simulation::target_local_posResponse :md5sum-) "fb2d2cec436c25bb2c92caf8218fe6ff")
(setf (get uav_mavros_simulation::target_local_posResponse :datatype-) "uav_mavros_simulation/target_local_posResponse")
(setf (get uav_mavros_simulation::target_local_posResponse :definition-)
      "mavros_msgs/PositionTarget goal_pos

================================================================================
MSG: mavros_msgs/PositionTarget
# Message for SET_POSITION_TARGET_LOCAL_NED
#
# Some complex system requires all feautures that mavlink
# message provide. See issue #402.

std_msgs/Header header

uint8 coordinate_frame
uint8 FRAME_LOCAL_NED = 1
uint8 FRAME_LOCAL_OFFSET_NED = 7
uint8 FRAME_BODY_NED = 8
uint8 FRAME_BODY_OFFSET_NED = 9

uint16 type_mask
uint16 IGNORE_PX = 1	# Position ignore flags
uint16 IGNORE_PY = 2
uint16 IGNORE_PZ = 4
uint16 IGNORE_VX = 8	# Velocity vector ignore flags
uint16 IGNORE_VY = 16
uint16 IGNORE_VZ = 32
uint16 IGNORE_AFX = 64	# Acceleration/Force vector ignore flags
uint16 IGNORE_AFY = 128
uint16 IGNORE_AFZ = 256
uint16 FORCE = 512	# Force in af vector flag
uint16 IGNORE_YAW = 1024
uint16 IGNORE_YAW_RATE = 2048

geometry_msgs/Point position
geometry_msgs/Vector3 velocity
geometry_msgs/Vector3 acceleration_or_force
float32 yaw
float32 yaw_rate

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
---
float64 dist
")



(provide :uav_mavros_simulation/target_local_pos "fb2d2cec436c25bb2c92caf8218fe6ff")



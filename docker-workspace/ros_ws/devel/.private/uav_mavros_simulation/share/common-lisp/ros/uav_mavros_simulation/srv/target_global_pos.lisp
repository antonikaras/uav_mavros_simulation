; Auto-generated. Do not edit!


(cl:in-package uav_mavros_simulation-srv)


;//! \htmlinclude target_global_pos-request.msg.html

(cl:defclass <target_global_pos-request> (roslisp-msg-protocol:ros-message)
  ((goal_pos
    :reader goal_pos
    :initarg :goal_pos
    :type mavros_msgs-msg:GlobalPositionTarget
    :initform (cl:make-instance 'mavros_msgs-msg:GlobalPositionTarget)))
)

(cl:defclass target_global_pos-request (<target_global_pos-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <target_global_pos-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'target_global_pos-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name uav_mavros_simulation-srv:<target_global_pos-request> is deprecated: use uav_mavros_simulation-srv:target_global_pos-request instead.")))

(cl:ensure-generic-function 'goal_pos-val :lambda-list '(m))
(cl:defmethod goal_pos-val ((m <target_global_pos-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uav_mavros_simulation-srv:goal_pos-val is deprecated.  Use uav_mavros_simulation-srv:goal_pos instead.")
  (goal_pos m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <target_global_pos-request>) ostream)
  "Serializes a message object of type '<target_global_pos-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'goal_pos) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <target_global_pos-request>) istream)
  "Deserializes a message object of type '<target_global_pos-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'goal_pos) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<target_global_pos-request>)))
  "Returns string type for a service object of type '<target_global_pos-request>"
  "uav_mavros_simulation/target_global_posRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'target_global_pos-request)))
  "Returns string type for a service object of type 'target_global_pos-request"
  "uav_mavros_simulation/target_global_posRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<target_global_pos-request>)))
  "Returns md5sum for a message object of type '<target_global_pos-request>"
  "98e43780eebfdb5a8104168ac5430b7a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'target_global_pos-request)))
  "Returns md5sum for a message object of type 'target_global_pos-request"
  "98e43780eebfdb5a8104168ac5430b7a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<target_global_pos-request>)))
  "Returns full string definition for message of type '<target_global_pos-request>"
  (cl:format cl:nil "mavros_msgs/GlobalPositionTarget goal_pos~%~%================================================================================~%MSG: mavros_msgs/GlobalPositionTarget~%# Message for SET_POSITION_TARGET_GLOBAL_INT~%#~%# https://mavlink.io/en/messages/common.html#SET_POSITION_TARGET_GLOBAL_INT~%# Some complex system requires all feautures that mavlink~%# message provide. See issue #402, #415.~%~%std_msgs/Header header~%~%uint8 coordinate_frame~%uint8 FRAME_GLOBAL_INT = 5~%uint8 FRAME_GLOBAL_REL_ALT = 6~%uint8 FRAME_GLOBAL_TERRAIN_ALT = 11~%~%uint16 type_mask~%uint16 IGNORE_LATITUDE = 1	# Position ignore flags~%uint16 IGNORE_LONGITUDE = 2~%uint16 IGNORE_ALTITUDE = 4~%uint16 IGNORE_VX = 8	# Velocity vector ignore flags~%uint16 IGNORE_VY = 16~%uint16 IGNORE_VZ = 32~%uint16 IGNORE_AFX = 64	# Acceleration/Force vector ignore flags~%uint16 IGNORE_AFY = 128~%uint16 IGNORE_AFZ = 256~%uint16 FORCE = 512	# Force in af vector flag~%uint16 IGNORE_YAW = 1024~%uint16 IGNORE_YAW_RATE = 2048~%~%float64 latitude~%float64 longitude~%float32 altitude	# in meters, AMSL or above terrain~%geometry_msgs/Vector3 velocity~%geometry_msgs/Vector3 acceleration_or_force~%float32 yaw~%float32 yaw_rate~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'target_global_pos-request)))
  "Returns full string definition for message of type 'target_global_pos-request"
  (cl:format cl:nil "mavros_msgs/GlobalPositionTarget goal_pos~%~%================================================================================~%MSG: mavros_msgs/GlobalPositionTarget~%# Message for SET_POSITION_TARGET_GLOBAL_INT~%#~%# https://mavlink.io/en/messages/common.html#SET_POSITION_TARGET_GLOBAL_INT~%# Some complex system requires all feautures that mavlink~%# message provide. See issue #402, #415.~%~%std_msgs/Header header~%~%uint8 coordinate_frame~%uint8 FRAME_GLOBAL_INT = 5~%uint8 FRAME_GLOBAL_REL_ALT = 6~%uint8 FRAME_GLOBAL_TERRAIN_ALT = 11~%~%uint16 type_mask~%uint16 IGNORE_LATITUDE = 1	# Position ignore flags~%uint16 IGNORE_LONGITUDE = 2~%uint16 IGNORE_ALTITUDE = 4~%uint16 IGNORE_VX = 8	# Velocity vector ignore flags~%uint16 IGNORE_VY = 16~%uint16 IGNORE_VZ = 32~%uint16 IGNORE_AFX = 64	# Acceleration/Force vector ignore flags~%uint16 IGNORE_AFY = 128~%uint16 IGNORE_AFZ = 256~%uint16 FORCE = 512	# Force in af vector flag~%uint16 IGNORE_YAW = 1024~%uint16 IGNORE_YAW_RATE = 2048~%~%float64 latitude~%float64 longitude~%float32 altitude	# in meters, AMSL or above terrain~%geometry_msgs/Vector3 velocity~%geometry_msgs/Vector3 acceleration_or_force~%float32 yaw~%float32 yaw_rate~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <target_global_pos-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'goal_pos))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <target_global_pos-request>))
  "Converts a ROS message object to a list"
  (cl:list 'target_global_pos-request
    (cl:cons ':goal_pos (goal_pos msg))
))
;//! \htmlinclude target_global_pos-response.msg.html

(cl:defclass <target_global_pos-response> (roslisp-msg-protocol:ros-message)
  ((dist
    :reader dist
    :initarg :dist
    :type cl:float
    :initform 0.0))
)

(cl:defclass target_global_pos-response (<target_global_pos-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <target_global_pos-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'target_global_pos-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name uav_mavros_simulation-srv:<target_global_pos-response> is deprecated: use uav_mavros_simulation-srv:target_global_pos-response instead.")))

(cl:ensure-generic-function 'dist-val :lambda-list '(m))
(cl:defmethod dist-val ((m <target_global_pos-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uav_mavros_simulation-srv:dist-val is deprecated.  Use uav_mavros_simulation-srv:dist instead.")
  (dist m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <target_global_pos-response>) ostream)
  "Serializes a message object of type '<target_global_pos-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'dist))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <target_global_pos-response>) istream)
  "Deserializes a message object of type '<target_global_pos-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dist) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<target_global_pos-response>)))
  "Returns string type for a service object of type '<target_global_pos-response>"
  "uav_mavros_simulation/target_global_posResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'target_global_pos-response)))
  "Returns string type for a service object of type 'target_global_pos-response"
  "uav_mavros_simulation/target_global_posResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<target_global_pos-response>)))
  "Returns md5sum for a message object of type '<target_global_pos-response>"
  "98e43780eebfdb5a8104168ac5430b7a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'target_global_pos-response)))
  "Returns md5sum for a message object of type 'target_global_pos-response"
  "98e43780eebfdb5a8104168ac5430b7a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<target_global_pos-response>)))
  "Returns full string definition for message of type '<target_global_pos-response>"
  (cl:format cl:nil "float64 dist~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'target_global_pos-response)))
  "Returns full string definition for message of type 'target_global_pos-response"
  (cl:format cl:nil "float64 dist~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <target_global_pos-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <target_global_pos-response>))
  "Converts a ROS message object to a list"
  (cl:list 'target_global_pos-response
    (cl:cons ':dist (dist msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'target_global_pos)))
  'target_global_pos-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'target_global_pos)))
  'target_global_pos-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'target_global_pos)))
  "Returns string type for a service object of type '<target_global_pos>"
  "uav_mavros_simulation/target_global_pos")
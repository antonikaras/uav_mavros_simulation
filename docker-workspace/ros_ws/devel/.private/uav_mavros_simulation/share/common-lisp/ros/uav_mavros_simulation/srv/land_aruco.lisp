; Auto-generated. Do not edit!


(cl:in-package uav_mavros_simulation-srv)


;//! \htmlinclude land_aruco-request.msg.html

(cl:defclass <land_aruco-request> (roslisp-msg-protocol:ros-message)
  ((timeOut
    :reader timeOut
    :initarg :timeOut
    :type cl:float
    :initform 0.0))
)

(cl:defclass land_aruco-request (<land_aruco-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <land_aruco-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'land_aruco-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name uav_mavros_simulation-srv:<land_aruco-request> is deprecated: use uav_mavros_simulation-srv:land_aruco-request instead.")))

(cl:ensure-generic-function 'timeOut-val :lambda-list '(m))
(cl:defmethod timeOut-val ((m <land_aruco-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uav_mavros_simulation-srv:timeOut-val is deprecated.  Use uav_mavros_simulation-srv:timeOut instead.")
  (timeOut m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <land_aruco-request>) ostream)
  "Serializes a message object of type '<land_aruco-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'timeOut))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <land_aruco-request>) istream)
  "Deserializes a message object of type '<land_aruco-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'timeOut) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<land_aruco-request>)))
  "Returns string type for a service object of type '<land_aruco-request>"
  "uav_mavros_simulation/land_arucoRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'land_aruco-request)))
  "Returns string type for a service object of type 'land_aruco-request"
  "uav_mavros_simulation/land_arucoRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<land_aruco-request>)))
  "Returns md5sum for a message object of type '<land_aruco-request>"
  "02fd582894f05f0c4b5cc3fc3ea23d3d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'land_aruco-request)))
  "Returns md5sum for a message object of type 'land_aruco-request"
  "02fd582894f05f0c4b5cc3fc3ea23d3d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<land_aruco-request>)))
  "Returns full string definition for message of type '<land_aruco-request>"
  (cl:format cl:nil "float64 timeOut~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'land_aruco-request)))
  "Returns full string definition for message of type 'land_aruco-request"
  (cl:format cl:nil "float64 timeOut~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <land_aruco-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <land_aruco-request>))
  "Converts a ROS message object to a list"
  (cl:list 'land_aruco-request
    (cl:cons ':timeOut (timeOut msg))
))
;//! \htmlinclude land_aruco-response.msg.html

(cl:defclass <land_aruco-response> (roslisp-msg-protocol:ros-message)
  ((dist
    :reader dist
    :initarg :dist
    :type cl:float
    :initform 0.0))
)

(cl:defclass land_aruco-response (<land_aruco-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <land_aruco-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'land_aruco-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name uav_mavros_simulation-srv:<land_aruco-response> is deprecated: use uav_mavros_simulation-srv:land_aruco-response instead.")))

(cl:ensure-generic-function 'dist-val :lambda-list '(m))
(cl:defmethod dist-val ((m <land_aruco-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uav_mavros_simulation-srv:dist-val is deprecated.  Use uav_mavros_simulation-srv:dist instead.")
  (dist m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <land_aruco-response>) ostream)
  "Serializes a message object of type '<land_aruco-response>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <land_aruco-response>) istream)
  "Deserializes a message object of type '<land_aruco-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<land_aruco-response>)))
  "Returns string type for a service object of type '<land_aruco-response>"
  "uav_mavros_simulation/land_arucoResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'land_aruco-response)))
  "Returns string type for a service object of type 'land_aruco-response"
  "uav_mavros_simulation/land_arucoResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<land_aruco-response>)))
  "Returns md5sum for a message object of type '<land_aruco-response>"
  "02fd582894f05f0c4b5cc3fc3ea23d3d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'land_aruco-response)))
  "Returns md5sum for a message object of type 'land_aruco-response"
  "02fd582894f05f0c4b5cc3fc3ea23d3d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<land_aruco-response>)))
  "Returns full string definition for message of type '<land_aruco-response>"
  (cl:format cl:nil "float64 dist~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'land_aruco-response)))
  "Returns full string definition for message of type 'land_aruco-response"
  (cl:format cl:nil "float64 dist~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <land_aruco-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <land_aruco-response>))
  "Converts a ROS message object to a list"
  (cl:list 'land_aruco-response
    (cl:cons ':dist (dist msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'land_aruco)))
  'land_aruco-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'land_aruco)))
  'land_aruco-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'land_aruco)))
  "Returns string type for a service object of type '<land_aruco>"
  "uav_mavros_simulation/land_aruco")
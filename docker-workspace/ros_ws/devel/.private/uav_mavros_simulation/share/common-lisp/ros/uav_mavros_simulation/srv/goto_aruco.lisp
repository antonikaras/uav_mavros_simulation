; Auto-generated. Do not edit!


(cl:in-package uav_mavros_simulation-srv)


;//! \htmlinclude goto_aruco-request.msg.html

(cl:defclass <goto_aruco-request> (roslisp-msg-protocol:ros-message)
  ((timeOut
    :reader timeOut
    :initarg :timeOut
    :type cl:float
    :initform 0.0))
)

(cl:defclass goto_aruco-request (<goto_aruco-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <goto_aruco-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'goto_aruco-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name uav_mavros_simulation-srv:<goto_aruco-request> is deprecated: use uav_mavros_simulation-srv:goto_aruco-request instead.")))

(cl:ensure-generic-function 'timeOut-val :lambda-list '(m))
(cl:defmethod timeOut-val ((m <goto_aruco-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uav_mavros_simulation-srv:timeOut-val is deprecated.  Use uav_mavros_simulation-srv:timeOut instead.")
  (timeOut m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <goto_aruco-request>) ostream)
  "Serializes a message object of type '<goto_aruco-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <goto_aruco-request>) istream)
  "Deserializes a message object of type '<goto_aruco-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<goto_aruco-request>)))
  "Returns string type for a service object of type '<goto_aruco-request>"
  "uav_mavros_simulation/goto_arucoRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'goto_aruco-request)))
  "Returns string type for a service object of type 'goto_aruco-request"
  "uav_mavros_simulation/goto_arucoRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<goto_aruco-request>)))
  "Returns md5sum for a message object of type '<goto_aruco-request>"
  "02fd582894f05f0c4b5cc3fc3ea23d3d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'goto_aruco-request)))
  "Returns md5sum for a message object of type 'goto_aruco-request"
  "02fd582894f05f0c4b5cc3fc3ea23d3d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<goto_aruco-request>)))
  "Returns full string definition for message of type '<goto_aruco-request>"
  (cl:format cl:nil "float64 timeOut~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'goto_aruco-request)))
  "Returns full string definition for message of type 'goto_aruco-request"
  (cl:format cl:nil "float64 timeOut~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <goto_aruco-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <goto_aruco-request>))
  "Converts a ROS message object to a list"
  (cl:list 'goto_aruco-request
    (cl:cons ':timeOut (timeOut msg))
))
;//! \htmlinclude goto_aruco-response.msg.html

(cl:defclass <goto_aruco-response> (roslisp-msg-protocol:ros-message)
  ((dist
    :reader dist
    :initarg :dist
    :type cl:float
    :initform 0.0))
)

(cl:defclass goto_aruco-response (<goto_aruco-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <goto_aruco-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'goto_aruco-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name uav_mavros_simulation-srv:<goto_aruco-response> is deprecated: use uav_mavros_simulation-srv:goto_aruco-response instead.")))

(cl:ensure-generic-function 'dist-val :lambda-list '(m))
(cl:defmethod dist-val ((m <goto_aruco-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uav_mavros_simulation-srv:dist-val is deprecated.  Use uav_mavros_simulation-srv:dist instead.")
  (dist m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <goto_aruco-response>) ostream)
  "Serializes a message object of type '<goto_aruco-response>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <goto_aruco-response>) istream)
  "Deserializes a message object of type '<goto_aruco-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<goto_aruco-response>)))
  "Returns string type for a service object of type '<goto_aruco-response>"
  "uav_mavros_simulation/goto_arucoResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'goto_aruco-response)))
  "Returns string type for a service object of type 'goto_aruco-response"
  "uav_mavros_simulation/goto_arucoResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<goto_aruco-response>)))
  "Returns md5sum for a message object of type '<goto_aruco-response>"
  "02fd582894f05f0c4b5cc3fc3ea23d3d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'goto_aruco-response)))
  "Returns md5sum for a message object of type 'goto_aruco-response"
  "02fd582894f05f0c4b5cc3fc3ea23d3d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<goto_aruco-response>)))
  "Returns full string definition for message of type '<goto_aruco-response>"
  (cl:format cl:nil "float64 dist~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'goto_aruco-response)))
  "Returns full string definition for message of type 'goto_aruco-response"
  (cl:format cl:nil "float64 dist~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <goto_aruco-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <goto_aruco-response>))
  "Converts a ROS message object to a list"
  (cl:list 'goto_aruco-response
    (cl:cons ':dist (dist msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'goto_aruco)))
  'goto_aruco-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'goto_aruco)))
  'goto_aruco-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'goto_aruco)))
  "Returns string type for a service object of type '<goto_aruco>"
  "uav_mavros_simulation/goto_aruco")
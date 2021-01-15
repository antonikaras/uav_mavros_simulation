// Auto-generated. Do not edit!

// (in-package uav_mavros_simulation.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let mavros_msgs = _finder('mavros_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class target_global_posRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.goal_pos = null;
    }
    else {
      if (initObj.hasOwnProperty('goal_pos')) {
        this.goal_pos = initObj.goal_pos
      }
      else {
        this.goal_pos = new mavros_msgs.msg.GlobalPositionTarget();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type target_global_posRequest
    // Serialize message field [goal_pos]
    bufferOffset = mavros_msgs.msg.GlobalPositionTarget.serialize(obj.goal_pos, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type target_global_posRequest
    let len;
    let data = new target_global_posRequest(null);
    // Deserialize message field [goal_pos]
    data.goal_pos = mavros_msgs.msg.GlobalPositionTarget.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += mavros_msgs.msg.GlobalPositionTarget.getMessageSize(object.goal_pos);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'uav_mavros_simulation/target_global_posRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5d9ece801327c4b84f63aa6e9a5c0c41';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    mavros_msgs/GlobalPositionTarget goal_pos
    
    ================================================================================
    MSG: mavros_msgs/GlobalPositionTarget
    # Message for SET_POSITION_TARGET_GLOBAL_INT
    #
    # https://mavlink.io/en/messages/common.html#SET_POSITION_TARGET_GLOBAL_INT
    # Some complex system requires all feautures that mavlink
    # message provide. See issue #402, #415.
    
    std_msgs/Header header
    
    uint8 coordinate_frame
    uint8 FRAME_GLOBAL_INT = 5
    uint8 FRAME_GLOBAL_REL_ALT = 6
    uint8 FRAME_GLOBAL_TERRAIN_ALT = 11
    
    uint16 type_mask
    uint16 IGNORE_LATITUDE = 1	# Position ignore flags
    uint16 IGNORE_LONGITUDE = 2
    uint16 IGNORE_ALTITUDE = 4
    uint16 IGNORE_VX = 8	# Velocity vector ignore flags
    uint16 IGNORE_VY = 16
    uint16 IGNORE_VZ = 32
    uint16 IGNORE_AFX = 64	# Acceleration/Force vector ignore flags
    uint16 IGNORE_AFY = 128
    uint16 IGNORE_AFZ = 256
    uint16 FORCE = 512	# Force in af vector flag
    uint16 IGNORE_YAW = 1024
    uint16 IGNORE_YAW_RATE = 2048
    
    float64 latitude
    float64 longitude
    float32 altitude	# in meters, AMSL or above terrain
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
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new target_global_posRequest(null);
    if (msg.goal_pos !== undefined) {
      resolved.goal_pos = mavros_msgs.msg.GlobalPositionTarget.Resolve(msg.goal_pos)
    }
    else {
      resolved.goal_pos = new mavros_msgs.msg.GlobalPositionTarget()
    }

    return resolved;
    }
};

class target_global_posResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.dist = null;
    }
    else {
      if (initObj.hasOwnProperty('dist')) {
        this.dist = initObj.dist
      }
      else {
        this.dist = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type target_global_posResponse
    // Serialize message field [dist]
    bufferOffset = _serializer.float64(obj.dist, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type target_global_posResponse
    let len;
    let data = new target_global_posResponse(null);
    // Deserialize message field [dist]
    data.dist = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'uav_mavros_simulation/target_global_posResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3f4fece6412db25720b2bab9f80b3473';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 dist
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new target_global_posResponse(null);
    if (msg.dist !== undefined) {
      resolved.dist = msg.dist;
    }
    else {
      resolved.dist = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: target_global_posRequest,
  Response: target_global_posResponse,
  md5sum() { return '98e43780eebfdb5a8104168ac5430b7a'; },
  datatype() { return 'uav_mavros_simulation/target_global_pos'; }
};

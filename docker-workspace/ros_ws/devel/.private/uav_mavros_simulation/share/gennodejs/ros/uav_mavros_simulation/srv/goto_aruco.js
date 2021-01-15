// Auto-generated. Do not edit!

// (in-package uav_mavros_simulation.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class goto_arucoRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.timeOut = null;
    }
    else {
      if (initObj.hasOwnProperty('timeOut')) {
        this.timeOut = initObj.timeOut
      }
      else {
        this.timeOut = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type goto_arucoRequest
    // Serialize message field [timeOut]
    bufferOffset = _serializer.float64(obj.timeOut, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type goto_arucoRequest
    let len;
    let data = new goto_arucoRequest(null);
    // Deserialize message field [timeOut]
    data.timeOut = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'uav_mavros_simulation/goto_arucoRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a7a138008fb2d0c41d90d6ef0f7caaf3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 timeOut
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new goto_arucoRequest(null);
    if (msg.timeOut !== undefined) {
      resolved.timeOut = msg.timeOut;
    }
    else {
      resolved.timeOut = 0.0
    }

    return resolved;
    }
};

class goto_arucoResponse {
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
    // Serializes a message object of type goto_arucoResponse
    // Serialize message field [dist]
    bufferOffset = _serializer.float64(obj.dist, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type goto_arucoResponse
    let len;
    let data = new goto_arucoResponse(null);
    // Deserialize message field [dist]
    data.dist = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'uav_mavros_simulation/goto_arucoResponse';
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
    const resolved = new goto_arucoResponse(null);
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
  Request: goto_arucoRequest,
  Response: goto_arucoResponse,
  md5sum() { return '02fd582894f05f0c4b5cc3fc3ea23d3d'; },
  datatype() { return 'uav_mavros_simulation/goto_aruco'; }
};

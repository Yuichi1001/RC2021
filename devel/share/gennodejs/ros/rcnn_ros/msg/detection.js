// Auto-generated. Do not edit!

// (in-package rcnn_ros.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class detection {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.class_id = null;
      this.conf = null;
      this.x_axis = null;
      this.y_axis = null;
      this.weight = null;
      this.height = null;
    }
    else {
      if (initObj.hasOwnProperty('class_id')) {
        this.class_id = initObj.class_id
      }
      else {
        this.class_id = 0.0;
      }
      if (initObj.hasOwnProperty('conf')) {
        this.conf = initObj.conf
      }
      else {
        this.conf = 0.0;
      }
      if (initObj.hasOwnProperty('x_axis')) {
        this.x_axis = initObj.x_axis
      }
      else {
        this.x_axis = 0.0;
      }
      if (initObj.hasOwnProperty('y_axis')) {
        this.y_axis = initObj.y_axis
      }
      else {
        this.y_axis = 0.0;
      }
      if (initObj.hasOwnProperty('weight')) {
        this.weight = initObj.weight
      }
      else {
        this.weight = 0.0;
      }
      if (initObj.hasOwnProperty('height')) {
        this.height = initObj.height
      }
      else {
        this.height = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type detection
    // Serialize message field [class_id]
    bufferOffset = _serializer.float32(obj.class_id, buffer, bufferOffset);
    // Serialize message field [conf]
    bufferOffset = _serializer.float32(obj.conf, buffer, bufferOffset);
    // Serialize message field [x_axis]
    bufferOffset = _serializer.float32(obj.x_axis, buffer, bufferOffset);
    // Serialize message field [y_axis]
    bufferOffset = _serializer.float32(obj.y_axis, buffer, bufferOffset);
    // Serialize message field [weight]
    bufferOffset = _serializer.float32(obj.weight, buffer, bufferOffset);
    // Serialize message field [height]
    bufferOffset = _serializer.float32(obj.height, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type detection
    let len;
    let data = new detection(null);
    // Deserialize message field [class_id]
    data.class_id = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [conf]
    data.conf = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [x_axis]
    data.x_axis = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [y_axis]
    data.y_axis = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [weight]
    data.weight = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [height]
    data.height = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rcnn_ros/detection';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '18249658e877a86d85ab6523f10897f4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 class_id
    float32 conf
    float32 x_axis
    float32 y_axis
    float32 weight
    float32 height
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new detection(null);
    if (msg.class_id !== undefined) {
      resolved.class_id = msg.class_id;
    }
    else {
      resolved.class_id = 0.0
    }

    if (msg.conf !== undefined) {
      resolved.conf = msg.conf;
    }
    else {
      resolved.conf = 0.0
    }

    if (msg.x_axis !== undefined) {
      resolved.x_axis = msg.x_axis;
    }
    else {
      resolved.x_axis = 0.0
    }

    if (msg.y_axis !== undefined) {
      resolved.y_axis = msg.y_axis;
    }
    else {
      resolved.y_axis = 0.0
    }

    if (msg.weight !== undefined) {
      resolved.weight = msg.weight;
    }
    else {
      resolved.weight = 0.0
    }

    if (msg.height !== undefined) {
      resolved.height = msg.height;
    }
    else {
      resolved.height = 0.0
    }

    return resolved;
    }
};

module.exports = detection;

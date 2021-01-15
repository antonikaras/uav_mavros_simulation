// Generated by gencpp from file uav_mavros_simulation/target_global_pos.msg
// DO NOT EDIT!


#ifndef UAV_MAVROS_SIMULATION_MESSAGE_TARGET_GLOBAL_POS_H
#define UAV_MAVROS_SIMULATION_MESSAGE_TARGET_GLOBAL_POS_H

#include <ros/service_traits.h>


#include <uav_mavros_simulation/target_global_posRequest.h>
#include <uav_mavros_simulation/target_global_posResponse.h>


namespace uav_mavros_simulation
{

struct target_global_pos
{

typedef target_global_posRequest Request;
typedef target_global_posResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct target_global_pos
} // namespace uav_mavros_simulation


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::uav_mavros_simulation::target_global_pos > {
  static const char* value()
  {
    return "98e43780eebfdb5a8104168ac5430b7a";
  }

  static const char* value(const ::uav_mavros_simulation::target_global_pos&) { return value(); }
};

template<>
struct DataType< ::uav_mavros_simulation::target_global_pos > {
  static const char* value()
  {
    return "uav_mavros_simulation/target_global_pos";
  }

  static const char* value(const ::uav_mavros_simulation::target_global_pos&) { return value(); }
};


// service_traits::MD5Sum< ::uav_mavros_simulation::target_global_posRequest> should match
// service_traits::MD5Sum< ::uav_mavros_simulation::target_global_pos >
template<>
struct MD5Sum< ::uav_mavros_simulation::target_global_posRequest>
{
  static const char* value()
  {
    return MD5Sum< ::uav_mavros_simulation::target_global_pos >::value();
  }
  static const char* value(const ::uav_mavros_simulation::target_global_posRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::uav_mavros_simulation::target_global_posRequest> should match
// service_traits::DataType< ::uav_mavros_simulation::target_global_pos >
template<>
struct DataType< ::uav_mavros_simulation::target_global_posRequest>
{
  static const char* value()
  {
    return DataType< ::uav_mavros_simulation::target_global_pos >::value();
  }
  static const char* value(const ::uav_mavros_simulation::target_global_posRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::uav_mavros_simulation::target_global_posResponse> should match
// service_traits::MD5Sum< ::uav_mavros_simulation::target_global_pos >
template<>
struct MD5Sum< ::uav_mavros_simulation::target_global_posResponse>
{
  static const char* value()
  {
    return MD5Sum< ::uav_mavros_simulation::target_global_pos >::value();
  }
  static const char* value(const ::uav_mavros_simulation::target_global_posResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::uav_mavros_simulation::target_global_posResponse> should match
// service_traits::DataType< ::uav_mavros_simulation::target_global_pos >
template<>
struct DataType< ::uav_mavros_simulation::target_global_posResponse>
{
  static const char* value()
  {
    return DataType< ::uav_mavros_simulation::target_global_pos >::value();
  }
  static const char* value(const ::uav_mavros_simulation::target_global_posResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // UAV_MAVROS_SIMULATION_MESSAGE_TARGET_GLOBAL_POS_H
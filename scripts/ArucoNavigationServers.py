#! /usr/bin/env python2

import rospy
import mavros
import cv2 as cv
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
from nav_msgs.msg import Odometry
from mavros_msgs.msg import PositionTarget as PT
from geometry_msgs.msg import Vector3, TwistStamped
from uav_mavros_simulation.srv import goto_aruco, goto_arucoResponse, land_aruco, land_arucoResponse
from std_msgs.msg import Float32
from tf import transformations as tr
import mavros_msgs.msg
import mavros.command
from mavros import setpoint as SP
from simple_pid import PID

class ArucoNavigationController():

    def __init__(self):
        ''' Class that acts as a server for the goto_aruco service and the land_aruco service '''

        # init node
        rospy.init_node('aruco_navigation')
        mavros.set_namespace('mavros')

        # Setup Subscribers
        ## Marker pos
        aruco_pos = rospy.Subscriber('/aruco_marker_pos', PT, self._arucoCallback)
        ## mavros state
        state_sub = rospy.Subscriber(mavros.get_topic('state'),
                                 mavros_msgs.msg.State, self._state_callback)
        
         # Setup publishers
        # /mavros/setpoint_velocity/cmd_vel
        self.cmd_vel_pub = rospy.Publisher("mavros/setpoint_velocity/cmd_vel", TwistStamped, queue_size=10)
        
        # setup services
        # /mavros/cmd/arming
        self.set_arming = rospy.ServiceProxy('/mavros/cmd/arming', mavros_msgs.srv.CommandBool)
        # /mavros/set_mode
        self.set_mode = rospy.ServiceProxy('/mavros/set_mode', mavros_msgs.srv.SetMode)      
        
        # Initialize the service servers
        goto_aruco_serv = rospy.Service('goto_aruco', goto_aruco, self.GotoAruco)
        land_aruco_serv = rospy.Service('land_aruco', land_aruco, self.LandAruco)

        # Initialize variables
        self.pos = [0.0] * 4
        self.markerPos = [0.0] * 4
        self.UAV_state = mavros_msgs.msg.State()
        self.markerHeight = 20.0 # Height above the marker

        # Setup rate
        self.rate = rospy.Rate(30)
        rospy.sleep(1)
        rospy.spin()

    def _arucoCallback(self, msg):
        ''' Callback for the aruco marker POS '''
        self.markerPos[0] = msg.position.x
        self.markerPos[1] = msg.position.y
        self.markerPos[2] = msg.position.z
        self.markerPos[3] = msg.yaw

        self.markerPos = np.array(self.markerPos)
    
    def _state_callback(self, topic):
        self.UAV_state.armed = topic.armed
        self.UAV_state.connected = topic.connected
        self.UAV_state.mode = topic.mode
        self.UAV_state.guided = topic.guided
    
    def GotoAruco(self, req):
        ''' Goto the aruco marker '''
        rospy.loginfo('Going to aruco marker')
        timeOut = req.timeOut

        new_sp = TwistStamped()
        while self.UAV_state.mode != "OFFBOARD" :
            rospy.sleep(0.1)
            self.set_mode(0, 'OFFBOARD')
            # Publish something to activate the offboard mode
            self.cmd_vel_pub.publish(new_sp)
        
        if not mavros.command.arming(True) :
            mavros.command.arming(True)
            
        ts = rospy.Time.now()

        xPID = PID(.25, 0.05, 0.01, output_limits=(-.5, 0.5), setpoint=0.0)
        yPID = PID(.25, 0.05, 0.01, output_limits=(-.5, 0.5), setpoint=0.0)
        zPID = PID(.2, 0.0, 0.05, output_limits=(-0.5, 0.5), setpoint=self.markerHeight)
        yawPID = PID(.2, 0.0, 0.0, output_limits=(-1.0, 1.0), setpoint=0.0)
        
        while np.linalg.norm(self.markerPos[0:3] - np.array([0.0, 0.0, -self.markerHeight])) > 1.0 and \
                (rospy.Time.now() - ts < rospy.Duration(timeOut)):
                
            new_sp = TwistStamped()
            new_sp.twist.linear.x = xPID(-self.markerPos[0])
            new_sp.twist.linear.y = yPID(-self.markerPos[1])
            new_sp.twist.linear.z = zPID(-self.markerPos[2])
            new_sp.twist.angular.z = yawPID(self.markerPos[3])

            print(np.linalg.norm(self.markerPos[0:3] - np.array([0.0, 0.0, -self.markerHeight])))

            self.cmd_vel_pub.publish(new_sp)
        
        self.set_mode(0, 'AUTO.LOITER')

        resp = False
        if (np.linalg.norm(self.markerPos[0:3] - np.array([0.0, 0.0, self.markerHeight])) < 0.5):
            resp = True

        return goto_arucoResponse(resp)
    
    def LandAruco(self, req):
        ''' Land on the aruco marker '''
        pass

###################################################################################################
if __name__ == "__main__":
    ANC = ArucoNavigationController()
    
    
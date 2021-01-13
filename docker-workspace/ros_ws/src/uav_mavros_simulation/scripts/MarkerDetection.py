#! /usr/bin/env python2

import rospy
import mavros
import cv2 as cv
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
from nav_msgs.msg import Odometry
from mavros_msgs.msg import PositionTarget as PT
from std_msgs.msg import Float32
from tf import transformations as tr
import mavros_msgs.msg
from mavros import setpoint as SP
from simple_pid import PID

class MarkerDetector:
    """ 
        Subscribe to the camera feed and detect the aruco marker in the scene
    """
    def __init__(self):
        
        # Init node
        rospy.init_node('marker_detector')
        mavros.set_namespace('mavros')

        # Setup subscribers
        ## Image
        video_topic = "iris_fpv_cam/usb_cam/image_raw"
        image_subscriber = rospy.Subscriber(video_topic, Image, self.image_callback)
        self.bridge = CvBridge()

        ## Drone pose
        # /mavros/local_position/pose
        local_position_sub = rospy.Subscriber(mavros.get_topic('local_position', 'pose'),
             SP.PoseStamped, self._local_position_callback)

        # Set up publishers
        self.aruco_marker_pos_pub = rospy.Publisher('/aruco_marker_pos', PT, queue_size=10)
        self.aruco_marker_img_pub = rospy.Publisher('/aruco_marker_img', Image, queue_size=10)
       
        # Initialize variables
        self.frame = np.zeros((240, 320, 3), np.uint8)
        self.pos = [0.0] * 4
        self.markerPos = [0.0] * 4

        ## camera intristic parameters
        self.K = np.array([277.191356, 0.0, 160.5, 0.0, 277.191356, 120.5, 0.0, 0.0, 1.0]).reshape(3,3)
        self.distCoeffs = np.array([0.0] * 5)

        #Load the dictionary that was used to generate the markers.
        self.dictionary = cv.aruco.Dictionary_get(cv.aruco.DICT_6X6_250)
        # Initialize the detector parameters using default values
        self.parameters =  cv.aruco.DetectorParameters_create()
        
        # Setup rate
        self.rate = rospy.Rate(30)
        self.rate.sleep()

    def _local_position_callback(self, topic):
        # Position data
        self.pos[0] = topic.pose.position.x
        self.pos[1] = topic.pose.position.y
        self.pos[2] = topic.pose.position.z

         # Orientation data
        (r, p, y) = tr.euler_from_quaternion([topic.pose.orientation.x, topic.pose.orientation.y, topic.pose.orientation.z, topic.pose.orientation.w])
        self.pos[3] = y
        
    def image_callback(self, data):
        """
            Save the image data everytime a new frame comes up
        """
        try:
            self.frame = self.bridge.imgmsg_to_cv2(data, "bgr8")
        except CvBridgeError as e:
            print(e)

    def Aruco_marker_detector(self):
        """ Use the build in python library to detect the aruco marker and its coordinates """
        img = self.frame.copy() 
        
        # Detect the markers in the image
        markerCorners, markerIds, rejectedCandidates = cv.aruco.detectMarkers(img, self.dictionary, parameters=self.parameters)
        # Get the transformation matrix to the marker
        if markerCorners:

            markerSize = 2.0
            axisLength = 3.0

            rvecs, tvecs, _ = cv.aruco.estimatePoseSingleMarkers( markerCorners, markerSize, self.K, self.distCoeffs)
            
            # Draw the axis on the marker
            frame_out = cv.aruco.drawAxis( img, self.K, self.distCoeffs, rvecs, tvecs, axisLength)
            
            rotMat = tr.euler_matrix(np.pi / 2.0, 0, 0)
            rotMat = rotMat[0:3, 0:3]
            tvecs = np.matmul(rotMat, tvecs[0][0].T)
            rotMat, _ = cv.Rodrigues(rvecs)
            eul = tr.euler_from_matrix(rotMat)

            yaw_angle = self.pos[3] - eul[2] 

            # Publish the position of the marker
            marker_pos = PT()
            marker_pos.position.x = tvecs[0]
            marker_pos.position.y = - tvecs[2]
            marker_pos.position.z = tvecs[1]
            marker_pos.yaw = eul[2]  * np.pi / 180.0
            self.aruco_marker_pos_pub.publish(marker_pos)

            # Publish the image with the detected marker
            self.aruco_marker_img_pub.publish(self.bridge.cv2_to_imgmsg(frame_out, "bgr8"))  

###################################################################################################
if __name__ == "__main__":
    MD = MarkerDetector()  
    while not rospy.is_shutdown():
            MD.Aruco_marker_detector()



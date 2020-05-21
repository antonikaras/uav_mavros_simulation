#! /usr/bin/env python2

# ROS libraries
import rospy
import rosbag
from mavlink_msgs.msg import mavlink_lora_pos as ml_pos
import numpy as np
import utm
import sys
import matplotlib.pyplot as plt


class SimplifyTrack():

    def __init__(self, bag):
        ''' 
            Read the gnss data from the rosbag, convert them to UTM, remove the outliers,
            simplify the track, convert them back to gnss and export them as a route plan
            for the uav
        '''
        # Initialize the node
        rospy.init_node('simplify_track')

        # Initialize position data
        self.gnss_data = []
        self.utm_data = []
        self.outliers = 0

        # Initialize the speed data
        self.Speed = []
        self.avgSpeed = 0
        self.varSpeed = 0

        # Play the rosbag and save the position data
        self.PlayBag(bag)

        # Remove the outliers
        self.SpeedComputation()
        print(self.avgSpeed, self.varSpeed)
        self.RemoveOutliers()

        self.PlotData(self.utm_data)

    
    def PlayBag(self, bag):
        ''' Play the rosbag @bag'''

        Bag = rosbag.Bag(bag)
        for topic, msg, t in Bag.read_messages(topics=['/mavlink_pos']):
            # Read the gnss data
            self.gnss_data.append([msg.lat, msg.lon, msg.alt, msg.relative_alt, msg.time_usec / 1.0e6])
            
            # Convert the gnss data to UTM
            x1, y1, z1, u = utm.from_latlon(msg.lat, msg.lon)
            self.utm_data.append([x1, y1, z1, u, msg.time_usec / 1.0e6])
    
##### Outlier removal #####
    def SpeedComputation(self):
        ''' Compute the speed using the utm coordinates '''
        # Initialize the speed data
        self.Speed = []
        self.avgSpeed = 0
        self.varSpeed = 0

        for i in range(1, len(self.utm_data)):

            utm_cur = np.array(self.utm_data[i][0:2])
            utm_prev = np.array(self.utm_data[i - 1][0:2])

            dt = self.utm_data[i][4] - self.utm_data[i - 1][4]
            dx = utm_cur[0] - utm_prev[0]
            dy = utm_cur[1] - utm_prev[1]

            sp = 0
            if (dt > 0):
                sp = np.sqrt(dx * dx + dy * dy) / dt 
            #print(sp, dt, dx, dy)
            self.Speed.append(sp)
        
        self.avgSpeed = np.mean(self.Speed)
        self.varSpeed = np.var(self.Speed)
    
    # Remove the outliers
    def RemoveOutliers(self):
        ''' Remove the outliers '''
        # Compute the mean and variance of the speed to remove outliers
        self.SpeedComputation()

        # Save the length before
        ln_bef = len(self.utm_data)
        i = 1
        while (i < len(self.utm_data)):
            
            # Current speed
            utm_cur = np.array(self.utm_data[i][0:2])
            utm_prev = np.array(self.utm_data[i - 1][0:2])
            
            dt = self.utm_data[i][4] - self.utm_data[i - 1][4]
            dx = utm_cur[0] - utm_prev[0]
            dy = utm_cur[1] - utm_prev[1]

            sp = 0
            if (dt > 0):
                sp = np.sqrt(dx * dx + dy * dy) / dt 
            
            if (abs(sp - self.avgSpeed) > 2 * self.varSpeed):
                self.gnss_data.pop(i)
                self.utm_data.pop(i)
                i -= 1 
            
            i += 1

        # If data has been removed recompute the avgSpeed and varSpeed
        if (ln_bef - len(self.utm_data) > 0):
            self.outliers += ln_bef - len(self.utm_data)
            self.RemoveOutliers()

##### Plot the data #####
    def PlotData(self, data = []):
        ''' Plot the data ''' 
        if (data == []):
            lat = [i[0] for i in self.gnss_data]
            lon = [i[1] for i in self.gnss_data]
        else:
            lat = [i[0] for i in data]
            lon = [i[1] for i in data]

        plt.plot(lon, lat)
        plt.axis('equal')
        plt.show()

###################################################################################################
if __name__ == '__main__':
    if len(sys.argv) < 2:
        print('Usage: SimplifyTrack.py rosbag')
    else:
        ST = SimplifyTrack(sys.argv[1])
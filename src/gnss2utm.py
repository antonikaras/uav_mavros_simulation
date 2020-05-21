#!/usr/bin/env python2

import utm
import matplotlib.pyplot as plt
import numpy as np
from statistics import mean, variance

class OutlierRemoval():

    def __init__(self, gnss_data, utm_data):

        self.GNSSdata = gnss_data
        self.UTMdata = utm_data
        self.outliers = 0

    def PlotData(self, data = []):
        ''' Plot the data ''' 
        if (data == []):
            lat = [i[0] for i in self.GNSSdata]
            lon = [i[1] for i in self.GNSSdata]
        else:
            lat = [i[0] for i in data]
            lon = [i[1] for i in data]

        plt.plot(lon, lat)
        plt.axis('equal')
        plt.show()

    def SpeedComputation(self):
        ''' Compute the speed using the utm coordinates '''
        # Initialize the speed data
        self.Speed = []
        self.avgSpeed = 0
        self.varSpeed = 0

        for i in range(1, len(self.UTMdata)):

            utm_cur = np.array(self.UTMdata[i][0:2])
            utm_prev = np.array(self.UTMdata[i - 1][0:2])

            dt = self.UTMdata[i][4] - self.GNSSdata[i - 1][4]
            dx = utm_cur[0] - utm_prev[0]
            dy = utm_cur[1] - utm_prev[1]

            sp = 0
            if (dt > 0):
                sp = np.sqrt(dx * dx + dy * dy) / dt 
            #print(sp, dt, dx, dy)
            self.Speed.append(sp)
        
        self.avgSpeed = mean(self.Speed)
        self.varSpeed = variance(self.Speed)
    
    # Remove the outliers
    def RemoveOutliers(self):
        ''' Remove the outliers '''
        # Compute the mean and variance of the speed to remove outliers
        self.SpeedComputation()

        # Save the length before
        ln_bef = len(self.UTMdata)
        i = 1
        while (i < len(self.UTMdata)):
            
            # Current speed
            utm_cur = np.array(self.UTMdata[i][0:2])
            utm_prev = np.array(self.UTMdata[i - 1][0:2])
            
            dt = self.GNSSdata[i][4] - self.GNSSdata[i - 1][4]
            dx = utm_cur[0] - utm_prev[0]
            dy = utm_cur[1] - utm_prev[1]

            sp = 0
            if (dt > 0):
                sp = np.sqrt(dx * dx + dy * dy) / dt 
            
            if (abs(sp - self.avgSpeed) > 2 * self.varSpeed):
                self.GNSSdata.pop(i)
                self.UTMdata.pop(i)
                i -= 1 
            
            i += 1

        # If data has been removed recompute the avgSpeed and varSpeed
        if (ln_bef - len(self.UTMdata) > 0):
            self.outliers += ln_bef - len(self.UTMdata)
            self.RemoveOutliers()

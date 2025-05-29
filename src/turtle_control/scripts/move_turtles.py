#!/usr/bin/env python3
import rospy
from geometry_msgs.msg import Twist

def mover_tortugas():
    rospy.init_node('mover_tortugas', anonymous=True)

    pub1 = rospy.Publisher('/turtle1/cmd_vel', Twist, queue_size=10)
    pub2 = rospy.Publisher('/turtle2/cmd_vel', Twist, queue_size=10)
    rate = rospy.Rate(2)  # 2 Hz

    cmd1 = Twist()
    cmd1.linear.x = 1.0    # turtle1: avanza
    cmd1.angular.z = 0.5   # turtle1: gira ligeramente

    cmd2 = Twist()
    cmd2.linear.x = 0.5    # turtle2: avanza más lento
    cmd2.angular.z = -2.0  # turtle2: gira en sentido contrario

    while not rospy.is_shutdown():
        pub1.publish(cmd1)
        pub2.publish(cmd2)
        rate.sleep()

if __name__ == '__main__':
    try:
        mover_tortugas()
    except rospy.ROSInterruptException:
        pass
#!/bin/bash

# @file: borealisWatcher.sh
# @author: Brendan Hogan
# @version: 1.0.0
# @update: 2018-09-30

# Version history:

# Current:

# ver 1.0.0
# 2018-09-30
# Initial build. Modified from 'isadoraWatcher.sh'


# Description:

# This script launches a QLab workspace, then runs a shell watcher loop.
# It will check every 10 seconds that the process named 'QLab' exists. 
# If it does not, the script will re-open the target workspace and continue 
# the loop.

# Modified from 'isadoraWatcher.sh', which is itself modified from the work
# of Jim Bell for "Generativity" at Suyama Space, 2015.

# -----------------------------------------------------------------------------

# Print some information to the terminal explaining how this works:
clear
sleep 0.5
echo "------------------------------------------------------------------------"
echo " BOREALIS WATCHER                                                       "
echo " Launch a QLab workspace and verify that QLab exists every 10 seconds.  "
echo " Relaunch the workspace if QLab crashes.                                "
echo "                                                                        "
echo " Sleeping for 10 seconds. Allowing other boot processes to complete.    "
echo "------------------------------------------------------------------------"
sleep 10
echo ""
echo "------------------------------------------------------------------------"
echo " Launching QLab workspace.                                              "
echo " Beginning WATCHER loop.                                                "
echo "------------------------------------------------------------------------"
echo ""
sleep 2

# Define target file path as appropriate.
/usr/bin/open /Users/brendanhogan/Desktop/someQlabWorkspace.qlab4			

# Verify that the workspace file launches.
until [ 0 = 1 ]

# OPTIONAL: Define reboot and shutdown procedures.
# If using timed reboot or halt procedures, make this script executable 
# with chmod u+x.
# sudo shutdown -r 11:30 		# Reboot the machine at 11:30AM
# sudo shutdown -r 17:30 		# Reboot the machine at 5:30PM			
# sudo shutdown -h 23:00 		# Shutdown (halt) the machine at 11:00PM			

# WATCHER main loop:
do
     /usr/bin/killall -0 QLab	# Identify application by process name.
    if [ $? = 0 ]															
    then
    echo "QLab is active. Checking again in 10 seconds..."				
    else
    echo ""
	echo "" 
	echo "$(date): Error: Process cannot be found - restarting QLab."
	echo ""
	echo ""								
    /usr/bin/open /Users/brendanhogan/Desktop/someQlabWorkspace.qlab4		
    fi
    sleep 10								
done

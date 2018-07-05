#!/bin/bash

# @file: izzyWatcher.sh
# @author: Brendan Hogan
# @version: 1.3.0
# @update: 2018-07-05

# Version history:

# Current:

# ver 1.3.0
# 2018-07-05
# REMOVE piped output function; Update formatting; add header for clarity

# Previous:

# ver 1.2.1
# 2018-05-12
# Add piped output function for troubleshooting

# ver 1.2.0
# 2018-05-12
# Add shutdown commands for reboot and halt behavior. 

# ver 1.1.1
# 2018-05-11
# Add time/date stamp and whitespace to false return in WATCHER loop.

# ver 1.1.0
# 2018-05-08
# Add header block with description of script behavior

# ver 1.0.0
# 2018-05-01
# Initial build

# Description:

# This script launches an Isadora patch, then runs a shell watcher loop.
# It will check every 10 seconds that the process named 'Isadora' exists. 
# If it does not, the script will re-open the target patch and continue the loop.

# Print some information to the terminal explaining how this works:
clear
echo "----------------------------------------------------------------------------------"
echo " ISADORA WATCHER                                                                  "
echo " Launch an Isadora patch and verify that process exists every 10 seconds.         " 						
echo " Restart Isadora if it crashes.                                                   " 
echo "                                                                                  "
echo " Sleeping for 10 seconds. Allowing other boot processes to complete.              "
echo "----------------------------------------------------------------------------------"
sleep 10
echo ""
echo "----------------------------------------------------------------------------------"
echo " Launching Isadora patch.                                                         "												
echo " Beginning WATCHER loop.                                                          "	
echo "----------------------------------------------------------------------------------"
echo ""
sleep 2

# Define target file path as appropriate.
/usr/bin/open /Users/brendanhogan/Desktop/izzyTestForAutomation.izz			

# Verify that the patch file launches.
until [ 0 = 1 ]

# Define reboot and shutdown procedures.
# If using timed reboot or halt procedures, make this script executable with chmod u+x.
sudo shutdown -r 11:30 		# Reboot the machine at 11:30AM
sudo shutdown -r 17:30 		# Reboot the machine at 5:30PM			
sudo shutdown -h 23:00 		# Shutdown (halt) the machine at 11:00PM			

# WATCHER main loop:
do
     /usr/bin/killall -0 Isadora	# Identify application by process name.
    if [ $? = 0 ]															
    then
    echo "Isadora is active. Checking again in 10 seconds..."															
    else
    echo ""
	echo "" 
	echo "$(date): Error: Process cannot be found - restarting Isadora."
	echo ""
	echo ""								
    /usr/bin/open /Users/brendanhogan/Desktop/izzyTestForAutomation.izz		
    fi
    sleep 10								
done

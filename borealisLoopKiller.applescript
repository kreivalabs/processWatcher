-- @file: borealisLoopKillerNotated.applescript
-- @author: Brendan Hogan
-- @version: 1.0.0
-- @update: 2018-09-30

-- Version history:

-- Current:
-- 2018-09-30
-- ver. 1.0.0 : Initial build. Modified from 'izzyLoopKiller.applescript'

-- A script to emulate a SIGINT command ('Ctrl+C') in the Terminal, killing the 
-- QLab watcher shell script, then quitting Terminal.app, and finally 
-- quitting QLab.app in prepapartion for a machine reboot/shutdown.

-- created for A.J. Epstein for the Borealis Festival. Seattle, WA. 2018.

try
	tell application "Terminal"
		activate -- bring Terminal to front
		delay 1
		tell application "System Events" -- script user interface behavior
			keystroke "c" using {control down} -- send the SIGINT command
			delay 2
			tell application "Terminal"
				quit
				delay 1
				tell application "QLab" -- replace name in quotes with 
				-- another app name to repurpose this script for other 
				-- applications
					quit
				end tell
			end tell
		end tell
	end tell
end try

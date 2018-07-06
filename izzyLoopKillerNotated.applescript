-- @file: izzyLoopKillerNotated.applescript
-- @author: Brendan Hogan
-- @version: 1.1.1
-- @update: 2018-07-05

-- Version history:

-- Current:
-- 2018-07-05
-- ver. 1.1.1 : update line widths and formatting

-- Previous:
-- 2018-07-05
-- ver. 1.1.0 : update formatting and add header for clarity

-- 2018-05-06
-- ver. 1.0.0 : initial build

-- A script to emulate a BREAK command ('Ctrl+C') in the Terminal, killing the 
-- Isadora keep alive shell script, then quit Terminal.app, and finally 
-- quit Isadora.app in prepapartion for a machine reboot/shutdown.

-- created for Fernanda D'Agostino, May 2018. May be modified for future 
-- proejects running shell scripts by replacing the application name

try
	tell application "Terminal"
		activate -- bring Terminal to front
		delay 1
		tell application "System Events" -- script user interface behavior
			keystroke "c" using {control down} -- send the Unix BREAK command
			delay 2
			tell application "Terminal"
				quit
				delay 1
				tell application "Isadora" -- replace name in quotes with 
				-- another app name to repurpose this script for other 
				-- applications
					quit
				end tell
			end tell
		end tell
	end tell
end try

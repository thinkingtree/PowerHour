#!/bin/sh

#  NextSong.scpt
#  NextSong
#
#  Created by Justin Schumacher on 6/27/12.
#  Copyright (c) 2012 SweetSpot Diabetes Care, Inc. All rights reserved.

tell application "System Events"
	set MyList to (name of every process)
end tell
if (MyList contains "Spotify") is true then
	tell application "Spotify" to activate
	tell application "System Events"
		tell process "Spotify"
			key code 124 using command down
		end tell
	end tell
end if
if (MyList contains "iTunes") is true then
	tell application "iTunes" to activate
	tell application "System Events"
		tell process "iTunes"
			key code 124 using command down
		end tell
	end tell
end if
tell application "PowerHour" to activate
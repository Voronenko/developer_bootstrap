#!/bin/sh
# Author : Tejas Barot
# Website :- www.tejasbarot.com
# Facebook :- https://www.facebook.com/tejasbarot.official
# Facebook Page :- https://www.facebook.com/AllLinuxUsersBlog
#
# For Errors and Discussion :- http://linuxforums.tejasbarot.com
#
# BUG: Do not rename this script to teamviewer or teamviewerd
#
# teamviewerd service will start teamviewerd daemon for teamviewer8.x
### BEGIN INIT INFO
# Provides:             teamviewerd
# Required-Start:       $syslog
# Required-Stop:        $syslog
# Default-Start:        2 3 4 5
# Default-Stop:         0 1 6
# Short-Description:    TeamViewer Daemon
### END INIT INFO

#if [ `id -u` = 0 ] ; then
#	echo "Good to Go..." > /dev/null 2>&1 
#else
#	echo "You need to be root to continue..."
#	exit 1
#fi
TM8=/opt/teamviewer8/tv_bin/teamviewerd
INITSCRIPT="$(basename "$0")"
case "$1" in
	start)
	PD1=`pgrep teamviewerd`
	pgrep "teamviewerd" > /dev/null
	rval=$?
	if [ $rval -eq 0 ] ; then
		echo "teamviewerd is already running..."
	else
		echo "Starting teamviewerd..."
		$TM8 && logger -i "teamvewerd started..."
	fi
	;;
	stop)
	PD1=`pgrep teamviewerd`
	pgrep "teamviewerd" > /dev/null 2>&1
	rval1=$?
	if [ $rval1 -eq 0 ] ; then
		echo "Stopping teamviewerd..."
		logger -i "Stopping teamviewerd..."
		kill $PD1
	else
		echo "teamviewerd is not running..."
	fi
	;;
	restart)
		$0 stop
		$0 start
	;;
	status)
	pgrep "teamviewerd" > /dev/null
	rval2=$?
	if [ $rval2 = 0 ] ; then
		echo "teamviewerd is running..."
	else
		echo "teamviewerd is not running..."
	fi
	;;
	*)
	echo "Usage: $0 {start|stop|restart|status}"
	exit 1
	;;
esac

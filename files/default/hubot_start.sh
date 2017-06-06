#!/bin/sh
# chkconfig:   - 90 10
# description:  hubot

SERVICE=hubot

start() {
    cd /home/rocketchat/hubot
    sudo -u rocketchat ./bin/hubot -a rocketchat &
    echo "service $SERVICE [start]"
}
stop() {
    pkill node
    echo "service $SERVICE [stop]"
}
status() {
   PID=`pgrep node | wc -l`
   if [ $PID -eq 0 ]; then
       echo "$SERVICE stop"
   else
       echo "running $SERVICE ..."
   fi
}

case $1 in
start)
       start
       ;;
stop)
       stop
       ;;
status)
       status
       ;;
restart)
       stop
       start
       ;;
*)
       echo "Usage: $SERVICE [start|stop|restart|status]"
       ;;
esac
exit 0

#!/bin/sh /etc/rc.common
# Copyright (C) 2016 


START=60
STOP=60

APP_NAME="aria2c"
APP_DIR="/usr/bin"
CONFIG_DIR="/etc/aria2c"


#init(){
#   /etc/init.d/$APP_NAME.sh enable >/dev/null
#}

#init

start()
{    
    touch /etc/aria2c/aria2.session
    $APP_DIR/aria2c --conf-path=$CONFIG_DIR/aria2c.conf -D   
}

stop()
{
    ps | grep "aria2c" | grep -v 'grep' | awk '{print $1}' |xargs kill -9
}

restart()
{
    stop
    sleep 3
    start
}
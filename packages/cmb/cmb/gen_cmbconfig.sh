#!/bin/sh

shell=$1

safe=`echo ${shell} | sed -e "s#\/#\\\/#"`

cat cmbconfig.in | sed -e "s#\@SHELL\@#${safe}#" > cmbconfig
chmod +x cmbconfig


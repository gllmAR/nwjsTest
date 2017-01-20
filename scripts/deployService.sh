#!/bin/bash
THISSCRIPT=(${0##*/})
echo $THISSCRIPT
echo ">>>> STARTING" $THISSCRIPT "on" $HOSTNAME ">>>>"

BASEDIR=$(dirname "$0")

cd "$BASEDIR"
cd ../services

SERVICESDIR=$('pwd') 
#echo $SERVICESDIR

for f in *; do
	#echo $f
	#echo $SERVICESDIR/$f

	if [ -f /etc/systemd/system/$f ] 
	then
        	echo  $THISSCRIPT "on" $HOSTNAME" : "  $f " founded, removing it"
		sudo systemctl stop $f
		sudo systemctl disable $f
	fi
	echo  $THISSCRIPT "on" $HOSTNAME" : ln services from" `pwd` " to /etc/systemd/system";
	sudo ln -s $SERVICESDIR/$f  /etc/systemd/system/

    # do some stuff here with "$f"
    # remember to quote it or spaces may misbehave
done


#echo  $THISSCRIPT "on" $HOSTNAME" : ln services from" `pwd` " to /etc/systemd/system";
#sudo ln -s *  /etc/systemd/system/ ;

echo  $THISSCRIPT "on" $HOSTNAME"  : daemon-reload";
sudo systemctl daemon-reload ;

echo ">>>> FINISH" $THISSCRIPT "on" $HOSTNAME ">>>>"


if [ -z "$1" ]; then
	echo "syntax : sudo ./channel-hop.sh <interface>"
	echo "sample : sudo ./channel-hop.sh mon0"
	exit 1
fi

INTERFACE="$1"
ch=1
while true; do
	echo "sudo iwconfig $INTERFACE channel $ch"
	sudo iwconfig $INTERFACE channel $ch
	ch=$(((ch+6)%13))
	if [ $ch -eq 0 ] ; then
		ch=$(((ch+6)%13))
	fi
	sleep 1
done

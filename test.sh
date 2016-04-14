#!/bin/bash

cd /home/yolo/google_street_view/GoogleStreetViewDataset
#cd /media/yolo/Backup_128/GoogleStreetViewDataset
lon_init=43.082587
lon_max=43.085898
lon="lon:"
lat="lat:"
lat_increment=0.0002 
lon_increment=0.0001 

while [[ "$lon_init" < "$lon_max" ]];
do
	lat_init=-77.681265
	lat_max=-77.672337
	test_name="$lon$lon_init$lat$lat_init"
	echo $test_name
	while [[ "$lat_init" > "$lat_max" ]];
	do 
		#cd /home/yolo/google_street_view/GoogleStreetViewDataset
		for file in *.jpg
		do
			value=$( echo $file | grep -oP "[-+]?([0-9]*\.[0-9]+|[0-9]+)" )
			set -- $value
			var1=$(echo "$1 == $lon_init"|bc)
			var2=$(echo "$2 == $lat_init"|bc)
			if [[ "$var1" == 1 && "$var2" == 1 ]]; then
				cd /home/yolo/google_street_view/GoogleStreetViewDataset/newFolder
				mkdir $test_name
				mv $file $test_name
				echo $test_name;
			else
				echo "fail";
				true;
			fi
			#echo "works";
			echo "works";
		done
		lat_init=$(echo "$lat_init + $lat_increment"|bc)
		test_name="$lon$lon_init$lat$lat_init"
		echo $test_name
	done
	lon_init=$(echo "$lon_init + $lon_increment"|bc)
done

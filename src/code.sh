#! /bin/bash

setup(){
	echo 514 > /sys/class/gpio/export
	echo out > /sys/class/gpio/gpio514/direction
	echo 0 > /sys/class/gpio/gpio514/value
	echo 515 > /sys/class/gpio/export
	echo out > /sys/class/gpio/gpio515/direction
	echo 0 > /sys/class/gpio/gpio515/value
	echo 516 > /sys/class/gpio/export
	echo out > /sys/class/gpio/gpio516/direction
	echo 0 > /sys/class/gpio/gpio516/value
	echo 529 > /sys/class/gpio/export
	echo out > /sys/class/gpio/gpio529/direction
	echo 0 > /sys/class/gpio/gpio529/value
}

lessonstart(){
	echo 1 > /sys/class/gpio/gpio529/value
	sleep 1
	echo 0 > /sys/class/gpio/gpio529/value
	for i in {1..10}; do
		echo 1 > /sys/class/gpio/gpio516/value
		sleep 1
		echo 0 > /sys/class/gpio/gpio516/value
		sleep 1
	done
}	

tenminleft(){
	for i in {1..10}; do
		echo 1 > /sys/class/gpio/gpio515/value
		sleep 1
		echo 0 > /sys/class/gpio/gpio515/value
		sleep 1
	done
}

fiveminleft(){
	for i in {1..10}; do
		echo 1 > /sys/class/gpio/gpio514/value
		sleep 1
		echo 0 > /sys/class/gpio/gpio514/value
		sleep 1
	done
}

lessonend(){
	echo 1 > /sys/class/gpio/gpio529/value
	sleep 1
	echo 0 > /sys/class/gpio/gpio529/value
	echo 1 > /sys/class/gpio/gpio529/value
	sleep 1
	echo 0 > /sys/class/gpio/gpio529/value
	echo 1 > /sys/class/gpio/gpio529/value
	sleep 1
	echo 0 > /sys/class/gpio/gpio529/value
	
	echo 1 > /sys/class/gpio/gpio514/value
	sleep 10
	echo 0 > /sys/class/gpio/gpio514/value
}

reset_all() {
	for gpio in 514 515 516 529; do 
		echo 0 > /sys/class/gpio/gpio${gpio}/value
	done
}



# start

if test -f /home/${SUDO_USER}/Dokumente/schulstundentimer/src/belegung_ok; then
	true
else
	echo "belegung erstellt" > /home/${SUDO_USER}/Dokumente/schulstundentimer/src/belegung_ok
	setup
fi

while true; do
day=$(date +%u)
time_now=$(date +%H:%M)

reset_all 
if (($day == 5 ));then
	
	if [[ "$time_now"  == "09:20" ]] || [[  "$time_now"  == "11:05" ]] || [[ "$time_now"  == "12:50" ]]; then
		tenminleft
	fi

	if [[ "$time_now"  == "09:25" ]] || [[  "$time_now"  == "11:10" ]] || [[ "$time_now"  == "12:55" ]]; then
		fiveminleft
	fi

	if [[ "$time_now"  == "09:30" ]] || [[  "$time_now"  == "11:15" ]] || [[ "$time_now"  == "13:00" ]]; then
		
		lessonend
	fi

	if [[ "$time_now"  == "08:00" ]] || [[  "$time_now"  == "09:45" ]] || [[ "$time_now"  == "11:30" ]]; then
		lessonstart
	fi
fi


if (($day >= 1 && $day <= 4  ));then
 
	if [[ "$time_now"  == "09:20" ]] || [[  "$time_now"  == "11:05" ]] || [[ "$time_now"  == "12:00" ]] || [[  "$time_now"  == "14:15" ]] || [[  "$time_now"  == "15:10" ]]; then
		tenminleft
	fi

	if [[ "$time_now"  == "09:25" ]] || [[  "$time_now"  == "11:10" ]] || [[ "$time_now"  == "12:05" ]] || [[  "$time_now"  == "14:20" ]] || [[  "$time_now"  == "15:15" ]]; then
		fiveminleft
	fi

	if [[ "$time_now"  == "09:30" ]] || [[  "$time_now"  == "11:15" ]] || [[ "$time_now"  == "12:10" ]] || [[  "$time_now"  == "14:25" ]] || [[  "$time_now"  == "15:20" ]]; then
		lessonend
	fi

	if [[ "$time_now"  == "08:00" ]] || [[  "$time_now"  == "09:45" ]] || [[ "$time_now"  == "11:25" ]] || [[  "$time_now"  == "12:55" ]] || [[  "$time_now"  == "14:35" ]]; then
		lessonstart
	fi
fi
sleep 60
done

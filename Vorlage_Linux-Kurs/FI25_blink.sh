#!/bin/bash

reset_all() {
	for gpio in 585 586 589 594; do 
		echo 0 > /sys/class/gpio/gpio${gpio}/value
	done
}
while true; do
day=$(date +%u)
time_now=$(date +%H:%M)

reset_all 
if (($day == 5 ));then
	
	if [[ "$time_now"  == "09:20" ]] || [[  "$time_now"  == "11:05" ]] || [[ "$time_now"  == "12:50" ]]; then
		for i in {1..10}; do
			echo 1 > /sys/class/gpio/gpio586/value
			sleep 1
			echo 0 > /sys/class/gpio/gpio586/value
			sleep 1
		done
	fi

	if [[ "$time_now"  == "09:25" ]] || [[  "$time_now"  == "11:10" ]] || [[ "$time_now"  == "12:55" ]]; then
		for i in {1..10}; do
			echo 1 > /sys/class/gpio/gpio585/value
			sleep 1
			echo 0 > /sys/class/gpio/gpio585/value
			sleep 1
		done
	fi

	if [[ "$time_now"  == "09:30" ]] || [[  "$time_now"  == "11:15" ]] || [[ "$time_now"  == "13:00" ]]; then
		
			echo 1 > /sys/class/gpio/gpio594/value
			sleep 1
			echo 0 > /sys/class/gpio/gpio594/value
			echo 1 > /sys/class/gpio/gpio594/value
			sleep 1
			echo 0 > /sys/class/gpio/gpio594/value
			echo 1 > /sys/class/gpio/gpio594/value
			sleep 1
			echo 0 > /sys/class/gpio/gpio594/value

			echo 1 > /sys/class/gpio/gpio585/value
			sleep 10
			echo 0 > /sys/class/gpio/gpio585/value
	fi

	if [[ "$time_now"  == "08:00" ]] || [[  "$time_now"  == "09:45" ]] || [[ "$time_now"  == "11:30" ]]; then
			echo 1 > /sys/class/gpio/gpio594/value
			sleep 1
			echo 0 > /sys/class/gpio/gpio594/value
		for i in {1..10}; do
			echo 1 > /sys/class/gpio/gpio589/value
			sleep 1
			echo 0 > /sys/class/gpio/gpio589/value
			sleep 1
		done
	fi
fi


if (($day >= 1 && $day <= 4  ));then
 
	if [[ "$time_now"  == "09:20" ]] || [[  "$time_now"  == "11:05" ]] || [[ "$time_now"  == "12:00" ]] || [[  "$time_now"  == "14:15" ]] || [[  "$time_now"  == "15:10" ]]; then
		for i in {1..10}; do
			echo 1 > /sys/class/gpio/gpio586/value
			sleep 1
			echo 0 > /sys/class/gpio/gpio586/value
			sleep 1
		done
	fi

	if [[ "$time_now"  == "09:25" ]] || [[  "$time_now"  == "11:10" ]] || [[ "$time_now"  == "12:05" ]] || [[  "$time_now"  == "14:20" ]] || [[  "$time_now"  == "15:15" ]]; then
		for i in {1..10}; do
			echo 1 > /sys/class/gpio/gpio585/value
			sleep 1
			echo 0 > /sys/class/gpio/gpio585/value
			sleep 1
		done
	fi

	if [[ "$time_now"  == "09:30" ]] || [[  "$time_now"  == "11:15" ]] || [[ "$time_now"  == "12:10" ]] || [[  "$time_now"  == "14:25" ]] || [[  "$time_now"  == "15:20" ]]; then
		
			echo 1 > /sys/class/gpio/gpio594/value
			sleep 1
			echo 0 > /sys/class/gpio/gpio594/value
			echo 1 > /sys/class/gpio/gpio594/value
			sleep 1
			echo 0 > /sys/class/gpio/gpio594/value
			echo 1 > /sys/class/gpio/gpio594/value
			sleep 1
			echo 0 > /sys/class/gpio/gpio594/value

			echo 1 > /sys/class/gpio/gpio585/value
			sleep 10
			echo 0 > /sys/class/gpio/gpio585/value
	fi

	if [[ "$time_now"  == "08:00" ]] || [[  "$time_now"  == "09:45" ]] || [[ "$time_now"  == "11:25" ]] || [[  "$time_now"  == "12:55" ]] || [[  "$time_now"  == "14:35" ]]; then
			echo 1 > /sys/class/gpio/gpio594/value
			sleep 1
			echo 0 > /sys/class/gpio/gpio594/value
		for i in {1..10}; do
			echo 1 > /sys/class/gpio/gpio589/value
			sleep 1
			echo 0 > /sys/class/gpio/gpio589/value
			sleep 1
		done
	fi
fi
sleep 60
done

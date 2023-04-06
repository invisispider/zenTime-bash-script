#!/usr/bin/bash

# run this to make temporary alias:
# alias zt="~/zenTime.sh"

idx=0
while [ $idx -lt 30 ]; do
	clear
	((idx++))
	echo "zenTime"
	echo "     by"
	echo "         ~Stein Unlimited~"
	echo ""
	
	echo "ROMAN TIME:  "
	echo `date`
	echo ""

	# DISPLAY THE CURRENT zenTime BY Stein Unlimited

	seconds=`date +%S | bc`
	minutes=`date +%M`

	day_of_year=`date +%j`
	zw_of_year="$(( 10#$day_of_year / 5 + 1 ))"
	echo "zenDate:"
	echo -n "1"	
	echo -n `date +%Y`
	echo -n ' '
	# echo -n "zHabit: "
	echo -n `expr $day_of_year / 45 + 1`
	echo -n "/"
	case `expr $day_of_year / 45 + 1` in 
		1) echo -n "Struggles ";;
		2) echo -n "Flowers ";;
		3) echo -n "Elders ";;
		4) echo -n "Memorial ";;
		5) echo -n "Freedom ";;
		6) echo -n "Harvest ";;
		7) echo -n "Hallows ";;
		8) echo -n "Fest ";;
		9) echo -n "Newzen ";;
		*) echo -n "Error! ";;
	esac
	
	# echo -n "zWeek: "
	# expr $zw_of_year % 9 
	# echo -n "Day of zWeek: "
	# echo -n `expr $day_of_year % 5`
	
	# echo -n "Day of zHabit: "
	echo -n `expr $day_of_year % 45`

	if [ $day_of_year -gt 360 ]; then
		day_of_year=0
	fi

	case `expr $day_of_year % 5` in 
		1) echo " Sun";;
		2) echo " Tues";;
		3) echo " Thurs";;
		4) echo " Fri";;
		5) echo " Sat";;
		*) echo " Newzen";;
		esac


	twenty_four_hour=`date +%H`

	roman=$(($twenty_four_hour))

	if [ $roman -lt 6 ]; then 
		roman=$( expr $roman + 18 )
	elif [ $roman -ge 6 ]; then 
		roman=$( expr $roman - 6 )
	fi
	# echo -n "Adjusted for start of day:"
	# echo $roman
	
	echo ""

	#after adjustment, I give the value back for use later.
	twenty_four_hour=$(($roman))

	roman="$(( $roman * 10000 ))" 
	rom_mod="$(( $roman % 10000 ))"

	# echo -n "twenty four hour: "
	# echo $twenty_four_hour

	ho_as_mi="$(( $twenty_four_hour * 60 ))"
	# echo -n "hour as minutes: "
	# echo $ho_as_mi

	mi_of_da="$(( 10#$minutes + $ho_as_mi ))"
	# echo -n "minutes of day: "
	# echo $mi_of_da

	mi_as_se="$(( $mi_of_da * 60 ))"
	# echo -n "minutes of day as seconds: "
	# echo $mi_as_se

	se_of_da="$(( $mi_as_se + $seconds ))"
	# echo -n "instant of day: "
	# echo $se_of_da

	# time is 23h:45m:11s
	# *60   1380m+45m:11s
	# *60       1425m:11s
	# 85500s+11s  885511s

	# redo:
	# time is 23h:45m:11s
	# convert hour
	# -6      17h:45m:11s
	# *60 +     1065m:11s
	# *60 +        63911s

	zenInstant="$(( $se_of_da % 80 ))"
	# echo -n "zInstant: "
	# echo $zenInstant

	mo_of_da="$(( $se_of_da / 80 ))"
	# echo -n "moment of day: "
	# echo $mo_of_da

	zenMoment="$(( $mo_of_da % 10 ))"
	# echo -n "zMoment: "
	# echo $zenMoment

	wh_of_da="$(( $se_of_da / 800 ))"
	# echo -n "while of day: "
	# echo $wh_of_da

	zenWhile="$(( $wh_of_da % 10 ))"
	# echo -n "zWhile: "
	# echo $zenWhile

	zse_of_da="$(( $mo_of_da / 100 ))"
	# echo -n "session of day: "

	# there is no zeroeth Session
	zenSession="$(( $zse_of_da + 1 ))"
	#echo -n "zSession: "
	# echo `expr $zenSession`

	echo "zenTime: "
	case `expr $zenSession` in 
		1) echo -n "Dawn ";;
		2) echo -n "Breakfast ";;
		3) echo -n "Morning ";;
		4) echo -n "Lunch ";;
		5) echo -n "Afternoon ";;
		6) echo -n "Dinner ";;
		7) echo -n "Evening ";;
		8) echo -n "Night ";;
		9) echo -n "Midnight ";;
		10) echo -n "Dead ";;
		*) echo -n "~zen~ ";;
	esac

	# SM:WI
	echo -n "$zenSession"
	echo -n "."
	echo -n "$zenWhile"
	echo -n "$zenMoment"
	echo -n "\`"
	# display instant-moments as instants / while
	in_of_wh="$(( $se_of_da % 80 ))"  
	echo "$in_of_wh"

	# echo "Place script in home folder."
	# echo "After first run, type zt from shell to run. Alias lasts length of shell session."

	sleep 1 

done



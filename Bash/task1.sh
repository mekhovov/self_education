#!/bin/bash
#*********************************#
#             task1               #
#          author: amek           #
#         april 14, 2008          #
#                                 #
#      Base-Course. Task  1.      #
#*********************************#

#************************************************************************************************************************#
# 1.	In UNIX, create shell script that resets environment: copies hosparam files and database. The shell script should:
# 
# Copy database file /A/ASCII/3.11.6/db.311604/ to $UDIR/db/.
# Parameters passed through command line:
# -	1 = “/A/ASCII”
# -	2 = “3.11.6.0.4” (contains release of the product);
# Parameters defined inside script:
# -	a = “db.”  
# -	b = “$UDIR/db/”
# 
# Copy all appropriate HOSPARAM files 
# We have to execute command like:
# cp A+x1+B+x2  x3
# where
# A , B – some constants
# x1,x2,x3 – some variable parts
# A = “/A/hosparams/leonard/dict”
# B =  “hosparams/ACM”
# 
#  -----------------------------------------------
#  |    x1	  |        x2	       |      x3       |
#  |----------|------------------|---------------|
#  |  "lab"  	|  "Hosparam.txt"	 |  $LABPARAM    |
#  |  "mic"  	|  "Hosparam.txt"	 |  $MICPARAM    |
#  |  "bb1"  	|  "BBparam.txt"	 |  $BBPARAM     |
#  |  "path" 	|  "Rparam.txt"	   |  $RPARAM      |
#  |  "ar"   	|  "Hosparam.txt"	 |  $ARPARAM     |
#  |  "wld"  	|  "Wldparam.txt"	 |  $WLDPARAM    |
#  |  "qc"   	|  "Hosparam.txt"	 |  $QCPARAM     |
#  |  "micqc"	|  "Hosparam.txt"	 |  $MICQCPARAM  |
#  |  "don"	  |  "DONparam.txt"	 |  $DONPARAM    |
#  -----------------------------------------------
#
# Example of command for first set of values:
# cp "/A/hosparams/leonard/dict/lib/hosparams/ACM /Baseparam.txt" "$HOSPARAM"
# Additional constrains: 
# a.	Script must check that both paths (for source and destination) exist;
# b.	All above command must not be executed but echoed to screen.
#************************************************************************************************************************#

E_WRONGARGS=65
E_DIRNOTEXISTS=66
ERROR_MSG_DIR="ERROR: Directory not exists: "
ERROR_MSG_HELP="ERROR: Parameters needed. Read Help: -h"
MSG_HELP="HELP: 
Authors name: amek
TODO: How to use script..."

# --- Task 1.1 ---

UDIR=$HOME
to="$UDIR/db/"
a="db."

[ "$1" = "-h" ] && echo "$MSG_HELP" && exit 0

[ -z "$1" -o -z "$2" ] && echo \# "$ERROR_MSG_HELP" && exit $E_WRONGARGS

from=` awk -v x="$1" -v y="$2" -v a="$a" 'BEGIN {
split(y, N, ".");
print x "/" N[1] "." N[2] "." N[3] "/" a N[1] N[2] N[3] N[4] N[5];
}' /dev/null` 
echo $from

# Mogno oboytis` bez AWK, naprimer vot tak:
#x=".*.*"
#z=$2
#from=${1}/${z%$x}/${a}`echo $2|tr -d '.'`      
#no hotelos` razobratsya s AWK i ispol`zovat` ego :)

if [ ! -d "$from" ]
			then
				echo \# "$ERROR_MSG_DIR"$from 
				exit $E_DIRNOTEXISTS
			else 
				if [ ! -d "$to" ]
					then
						echo \# "$ERROR_MSG_DIR"$to
						exit $E_DIRNOTEXIST
					else
						echo cp \-Rf \""$from"\" \""$to"\" 
				fi
		fi

# --- Task 1.2 ---

A="/A/hosparams/leonard/dict"  
#A="./1/3"
B="hosparams/ACM"
x1=( lab mic bb1 path ar wld qc mic don )
x2=( Hosparam.txt Hosparam.txt BBparam.txt Rparam.txt Hosparam.txt Wldparam.txt Hosparam.txt Hosparam.txt DONparam.txt )
x3=( \$LABPARAM \$MICPARAM \$BBPARAM \$RPARAM \$ARPARAM \$WLDPARAM \$QCPARAM \$MICQCPARAM \$DONPARAM )
i=0
#LABPARAM=./1/
#MICPARAM=$HOME
#DONPARAM=./1/3
#WLDPARAM=./3

for dir in ${x3[*]}
	do
		to=`eval echo $dir`
			
		if [ ! -d "$to" ]
			then
				echo \# "ERROR: Variable \""$dir"\" not defined." 
			else 
				from="$A"/${x1[$i]}/"$B"/${x2[$i]}
						
				if [ ! -f "$from" ]
					then
						echo \# "ERROR: File: \""$from"\" not exists." 
					else
						echo cp \""$from"\" \""$dir"\" 
				fi
		fi
		let i=i+1
done

exit 0



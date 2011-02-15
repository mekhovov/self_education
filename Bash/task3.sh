#!/bin/bash
#*********************************#
#             task3               #
#          author: amek           #
#         april 14, 2008          #
#                                 #
#      Base-Course. Task  3.      #
#*********************************#

#************************************************************************************************************************#
# 3.	Create script for working with *.rep and *.res files. 
# Your script has to:
# 	-	find all non-empty *.res files which permit write not by owner or group 
# 	-	print list of *.rep files such as NAME_OF_REP_FILE = NAME_OF_REs_FILE (in generated list of *.res files).
# 	-	if *.rep file has no *.res equivalent, script has to generate message.
# There are some demands to script:
# 	1. Parameters
# 	-	have to be like as: your_command [path_to_res_folder] [path_to_rep_folder] 
# 	-	"-h" key	: script generates help information
# 					- author’s name
# 					- how to use script
# 				- "-h" must be only first parameter, in that case help will be generated
# 	2. Output information form
# 	[list of *.rep files which satisfy the conditions]
# 	[list of *.rep files which have not *.res equivalent]
# 	3. General questions
# 	-	Pay attention the following some situations:
# 		- no parameters in command-line
# 		- not enough parameters in command-line
# 		- rep or res folder path not exists.
# 
# For example we have:
# 
# /nethome/artk/artkk/Reports>ls -l .                                             
# total 0                                                                         
# -rwxr--r--   1 artk     artk              0 Oct 27 17:17 xy1.rep                
# -rwxr--r--   1 artk     artk              0 Oct 27 17:17 xy2.rep                
# -rwxr--r--   1 artk     artk              0 Oct 27 17:18 xy3.rep                
# 
# and
# 
# /nethome/artk/artkk/Results>ls -l .                                             
# total 32                                                                        
# -rwxr--r--   1 artk     artk              6 Oct 27 17:27 xy1.res                
# -rwxr--r--   1 artk     artk              0 Oct 27 17:21 xy2.res                
# -rwxrw-rw-   1 artk     artk              6 Oct 27 17:27 xy3.res                
# -rwxr--r--   1 artk     artk              0 Oct 27 17:22 xy4.res                
# -rwxrw-rw-   1 artk     artk              4 Oct 27 17:27 xy5.res                
# -rwxr--r--   1 artk     artk              0 Oct 27 17:27 xy6.res                
# -rwxr--r--   1 artk     artk              8 Oct 27 17:27 xy7.res                
# 
# and then we have:
# 
# /nethome/artk/artkk>./reps ./Results ./Reports                                  
# xy3.rep                                                                         
# Not found file xy5.rep    
#************************************************************************************************************************#

E_WRONGARGS=65
E_DIRNOTEXISTS=66
ERROR_MSG_HELP="ERROR: Parameters needed. Read Help: -h"
ERROR_MSG_DIR="ERROR: Directory not exists: "
ERROR_MSG_FILE="ERROR: Files not found: "
MSG_HELP="HELP: 
Authors name: amek
TODO: How to use script..."

[ "$1" = "-h" ] && echo "$MSG_HELP" && exit 0

[ -z "$1" -o -z "$2" ] && echo "$ERROR_MSG_HELP" && exit $E_WRONGARGS

if ! [ -d "$1" ] 
	then 
		echo "$ERROR_MSG_DIR"$1 
		exit $E_DIRNOTEXISTS
fi

if ! [ -d "$2" ] 
	then 
		echo "$ERROR_MSG_DIR"$2 
		exit $E_DIRNOTEXISTS
fi

aRes=`ls "$2"*.res -l 2>/dev/null | awk -v s="$2" '{if($1 ~ /........w/ && $5 > 0) {n=match($0, /\//)-1; sub(s,""); l=length($0); print substr($0,n,l-n-2)}}'`

aRep=`ls "$1"*.rep -l 2>/dev/null | awk -v s="$1" '{n=match($0, /\//)-1; sub(s,""); l=length($0); print substr($0,n,l-n-2)}'`

if [ -z "$aRes" ]
	then 
		echo "$ERROR_MSG_FILE $2*.res"
		exit $E_WRONGARGS
fi

if [ -z "$aRep" ]
	then 
		echo "$ERROR_MSG_FILE $1*.rep"
		exit $E_WRONGARGS
fi

i=1
h=""
for x in $aRes
	do
		a[$i]="$h"\ "$x"
		h="${a[$i]}"
		if echo "$x" | grep -q "\.$"
			then
				a[$i]=${a[$i]%.}
				let i=i+1
				h=""
		fi
done
i=1
h=""
for x in $aRep
	do
		b[$i]="$h"\ "$x"
		h="${b[$i]}"
		if echo "$x" | grep -q "\.$"
			then
				b[$i]=${b[$i]%.}
				let i=i+1
				h=""
		fi
done

n1=${#a[@]}
n2=${#b[@]}
i=0 j=0

while [ $i -lt $n1 ]
	do
		let i=i+1
		j=0
		while [ $j -lt $n2 ]
			do
				let j=j+1
				if [ "${a[$i]}" = "${b[$j]}" ]
					then
						echo "${a[$i]}"".rep"
						continue 2			
				fi
			done
		echo "Not found file: ""${a[$i]}"".rep"
	done

exit 0




	

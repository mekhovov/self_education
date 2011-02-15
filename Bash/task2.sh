#!/bin/bash
#*********************************#
#             task2               #
#          author: amek           #
#         april 14, 2008          #
#                                 #
#      Base-Course. Task  2.      #
#*********************************#

#************************************************************************************************************************#
# 2.	Create template for UNIX shell scripts. Your script has to generate the list of {file option} pairs in case of receiving lists of files and options as command parameters.
# In other case script has to generate the specific information.
# There are some demands to template:
# 	1. Parameters
# 	-	have to be like as : your_command [options] [--] [files]
# 		[options]	- list of options : opt1,opt2,...,optN;
# 		[--]		- separator;
# 		[files]		- list of files : fl1,fl2,...,flM.
# 	-	"-h" key	: script generates help information
# 					- autor's name
# 					- how to use template
# 				- "-h" must be only first parameter,in that case help will be generated,
# 				  but in other case "-h" key is usual option parameter.  
# 	-	"-v" key	: script generates results in non-standard form.
# 				- "-v" may be situated in any position from options list parameters
# 				- script understands "-v" as key only for the first time. 
# 	2. Output information form
# 	-	Standard form
# 			fl1 opt1
# 			fl1 opt2
# 			........
# 			fl1 optN
# 			fl2 opt1
# 			fl2 opt2
# 			........
# 			fl2 optN
# 			........
# 			........
# 			flM opt1
# 			flM opt2
# 			........
# 			flM optN
# 
# 	-	Non-standard form
#                         Options are 	 : .../ Message: "No options"
#                         Files are 	 : .../ Message: "No files"
#                         Combinations are: {Standard form}/ Message: "No combinations"
# 	3. General questions
# 	-	Pay attention the following some situations:
# 		- no parameters in command-line
# 		- not enough parameters in command-line
# 		- other situations
#************************************************************************************************************************#

E_WRONGARGS=65
ERROR_MSG_HELP="ERROR: Parameters needed. Read Help: -h"
MSG_HELP="HELP: 
Authors name: amek
TODO: How to use script..."
i=0 bNoCombinations=0 bNonStandartForm=0 bFileParam=0 bSeparator=0 bParam=0
bNoCombinationsParam=0 bNoCombinationsFile=0

[ -z "$1" ] && echo "$ERROR_MSG_HELP" && exit $E_WRONGARGS

[ "$1" = "-h" ]	&& echo "$MSG_HELP" && exit 0

for param in $*
	do
		[ "$param" = "--" ] && bSeparator=1 && break
	done
	
for param in $*
	do
		[ "$param" = "-v" -a "$bNonStandartForm" = 0 -a "$bFileParam" = 0 ] && bNonStandartForm=1 && continue
				
		[ "$param" = "--" -a "$bFileParam" = 0 ] && bFileParam=1 && i=0 && continue	
		
		if echo "$param" | grep -q "^-"; then bParam=1; else bParam=0; fi
		
		if [ "$bFileParam" = 0 ]
			then
				if [ "$bParam" = 0  -a  "$bSeparator" = 0 ]
					then
						bFileParam=1 
						i=0 
						b[$i]=$param
						let i=i+1		
						continue
				fi
				a[$i]=$param
				let i=i+1
				continue
		fi
		
		if [ "$bParam" = 1  -a  "$bSeparator" = 0 ]
					then
						echo "ERROR: Wrong files parameters. "
						exit $E_WRONGARGS					
		fi
			
		b[$i]=$param
		let i=i+1
	done
	
[ -z "${a[0]}" ] && bNoCombinationsParam=1
[ -z "${b[0]}" ] && bNoCombinationsFile=1
	
if [ $bNonStandartForm = 1 ]
	then
		if [ "$bNoCombinationsParam" = 1 ] 
			then
				echo "Options are 	 : No options"
			else
				echo "Options are 	 : ""${a[*]}"
		fi
		if [ "$bNoCombinationsFile" = 1 ] 
			then
				echo "Files are  	 : No files"
			else
				echo "Files are  	 : ""${b[*]}"
		fi
		if [ "$bNoCombinationsParam" = 1 -o  "$bNoCombinationsFile" = 1 ] 
			then
				echo "Combinations are : No Combinations"
				exit $E_WRONGARGS
			else
				echo "Combinations are : "
		fi 
fi

if [ "$bNoCombinationsParam" = 0 -a  "$bNoCombinationsFile" = 0 ] 
	then
		for i in ${b[*]}
			do
				for j in ${a[*]}
					do
						echo "$i"\ "$j"
					done
			done
	else
		echo "$ERROR_MSG_HELP" 
		exit $E_WRONGARGS
fi

exit 0

	

	

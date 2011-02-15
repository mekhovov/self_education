[ ] //****************************************************************************************************
[ ] //* Version: $RCSfile: Functions.t,v $$Revision: 1.1 $$Date: 2008/03/05 14:08:32Z $
[ ] //*
[ ] //* Author: Mekhovov Alexander
[ ] //*
[ ] //* Global variables: none
[ ] //* Description: Functions (Task 2. Common code creation, day 5-7 ob Base Course)
[ ] //*					
[ ] //* Included: functions: 
[ ] //*				StrLength
[ ] //*				StrFirstAsc
[ ] //*				StrDoubleString
[ ] //*				AncillaryFunction1
[ ] //*				AncillaryFunction2
[ ] //*				ExecFunction
[ ] //*				NextStr
[ ] //*				MyCreateWinclassInstance
[ ] //****************************************************************************************************
[ ] 
[ ] use "doctor.inc"
[ ] 
[+] //******************************************************************************
    //** Function: INTEGER StrLength (STRING sStr)
	[ ] // Author:  amek
	[ ] // Description: takes STRING and returns its length
	[ ] // Arguments: STRING sStr - will be returned length of this string
	[ ] // Return codes: INTEGER - length of string
	[ ] // Generated exceptions: none
	[ ] //****************************************************************************
[+] INTEGER StrLength (STRING sStr)
	[ ] INTEGER iCount = 0
	[ ] while (sStr[++iCount] !=  "")
	[ ] return --iCount
	[ ] 
[ ] 
[+] //******************************************************************************
    //** Function: INTEGER StrFirstAsc (STRING sStr)
	[ ] // Author:  amek
	[ ] // Description: takes STRING and returns the code of the first symbol
	[ ] // Arguments: STRING sStr - ASCII-code of first symbol of this string will be returned
	[ ] // Return codes: INTEGER - ASCII-code of first symbol
	[ ] // Generated exceptions: none
	[ ] //****************************************************************************
[+] INTEGER StrFirstAsc (STRING sStr)
	[ ] return [INT] sStr[1]
[ ] 
[+] //******************************************************************************
    //** Function: STRING StrDoubleString (inout STRING sStr)
	[ ] // Author:  amek
	[ ] // Description: has inout parameters STRING and as a result returns a double STRING.
	[ ] // Arguments: inout STRING sStr - of this string will be returned double string
	[ ] // Return codes: STRING - double string
	[ ] // Generated exceptions: none
	[ ] //****************************************************************************
[+] STRING StrDoubleString (inout STRING sStr)
	[ ] sStr += sStr
	[ ] return sStr
[ ] 
[+] //******************************************************************************
    //** Function: void AncillaryFunction1 (STRING sFunction, STRING sArgs)
	[ ] // Author:  amek
	[ ] // Description: Ancillary function for function ExecFunction. Printing Summ of symbols of the strings
	[ ] // Arguments: STRING sStr1, STRING sStr2, STRING sStr3 - For this string printing summ of symbols
	[ ] // Return codes: none
	[ ] // Generated exceptions: none
	[ ] //****************************************************************************
[+] void AncillaryFunction1 (STRING sStr1, STRING sStr2, STRING sStr3)
	[ ] print("Summ of symbols of the strings `{sStr1},{sStr2},{sStr3}` = {StrLength(sStr1) + StrLength(sStr2) + StrLength(sStr3)}")
[ ] 
[+] //******************************************************************************
    //** Function: INTEGER AncillaryFunction2 (STRING sFunction, STRING sArgs)
	[ ] // Author:  amek
	[ ] // Description: Ancillary function for function ExecFunction. Printing Summ of symbols of the strings
	[ ] // Arguments: STRING sStr1, STRING sStr2, STRING sStr3 - For this string printing summ of symbols
	[ ] // Return codes: INTEGER - Summ of symbols of the strings
	[ ] // Generated exceptions: none
	[ ] //****************************************************************************
[+] INTEGER AncillaryFunction2 (STRING sStr1, STRING sStr2, STRING sStr3)
	[ ] INTEGER iSumSymbols = StrLength(sStr1) + StrLength(sStr2) + StrLength(sStr3)
	[ ] print("Summ of symbols of the strings `{sStr1},{sStr2},{sStr3}` = ")
	[ ] return iSumSymbols
[ ] 
[+] //******************************************************************************
    //** Function: void ExecFunction (STRING sFunction, STRING sArgs)
	[ ] // Author:  amek
	[ ] // Description: takes two STRING and call the function of this name and list of arguments
	[ ] // Arguments: STRING sFunction, STRING sArgs - name of function and list of arguments
	[ ] // Return codes: none
	[ ] // Generated exceptions: none
	[ ] //****************************************************************************
[+] void ExecFunction (STRING sFunction, STRING sArgs)
	[ ] LIST OF STRING lsArgList
	[ ] INTEGER iNumberOfArg = 1
	[+] while (GetField (sArgs, ",", iNumberOfArg) != "")
		[ ] ListAppend (lsArgList, GetField (sArgs, ",", iNumberOfArg++))
	[+] do 
		[ ] iNumberOfArg = ArgListCall(sFunction, lsArgList)
		[ ] print ("Function with return value ")
		[ ] print (iNumberOfArg)
	[+] except 
		[ ] print ("Function without return value ")
		[ ] ArgListCall(sFunction, lsArgList)
[ ] 
[+] //******************************************************************************
    //** Function: STRING NextStr (in STRING sStr)
	[ ] // Author:  amek
	[ ] // Description: Find next String (e.g. "A" -> "B", ..., "Z" -> "AA" -> "AB", ..., "AZ" -> "BA",...,"ZZ" -> "AAA",...)
	[ ] // Arguments: in STRING sStr - find next for this string
	[ ] // Return codes: STRING - next string
	[ ] // Generated exceptions: none
	[ ] //****************************************************************************
[+] STRING NextStr (in STRING sStr)
	[ ] STRING sStrResult = UPPER(sStr)
	[ ] INTEGER i = StrLength(sStrResult)
	[+] while (i>0)
		[+] if (sStrResult[i] != "Z")
			[ ] sStrResult[i] = chr(asc(sStrResult[i]) + 1)
			[ ] break
		[+] else
			[ ] sStrResult = Stuff (sStrResult, i, i == 1 ? 0 : 1, "A")
		[ ] i--
	[ ]  return sStrResult
[ ] 
[+] //******************************************************************************
    //** Function: WINDOW MyCreateWinclassInstance (in WINDOW f_wParent NULL, in STRING f_sTag, in STRING f_sAsWinclass optional)
	[ ] // Author:  amek
	[ ] // Description: Creates winclass instance with specified parent and class
	[ ] //	Arguments:	in WINDOW f_wParent NULL - parent of window. If NULL - no parent.
	[ ] //				in STRING f_sTag - tag of window
	[ ] //				in STRING f_sAsWinclass optional - as winclass. If omitted then winclass will be winclass of last part in the tag
	[ ] // Return codes: WINDOW - created window
	[ ] // Generated exceptions: none
	[ ] //****************************************************************************
[+] WINDOW MyCreateWinclassInstance (WINDOW f_wParent NULL, STRING f_sTag, STRING f_sAsWinclass optional)
	[ ] STRING sTypeOfWin
	[+] if (f_sAsWinclass == NULL)
		[ ] f_sAsWinclass = SubStr(f_sTag, (StrPos("[",f_sTag,TRUE) + 1), ((StrPos("]",f_sTag,TRUE) - 1) - StrPos("[",f_sTag,TRUE)))
	[+] if (f_wParent != NULL)
		[ ] return f_wParent.@(f_sAsWinclass)(f_sTag)
	[+] else
		[ ] return @(f_sAsWinclass)(f_sTag)
[ ] 
[ ] 
[+] main()
	[ ] 
	[ ] // Tests
	[ ] 
	[ ] STRING sString = "Hello"
	[ ] STRING sNextString = "ZZZZYZ"
	[ ] print (NextStr ("ZZZZYZ"))
	[ ] 
	[ ] print("----------- StrLength Function --------------------")
	[ ] Print ("Length of `{sString}` =  {StrLength (sString)}")
	[ ] 
	[ ] print("----------- StrFirstAsc Function ------------------")
	[ ] Print ("Code of the first symbol `{sString}` =  {StrFirstAsc (sString)}")
	[ ] 
	[ ] print("----------- StrDoubleString Function --------------")
	[ ] Print ("Double string of `{sString}` =  {StrDoubleString (sString)}")
	[ ] 
	[ ] print("----------- ExecFunction Function ------------------")
	[ ] Print ("Call  `AncillaryFunction1` Function with `one,two,three` Arguments:")
	[ ] ExecFunction ("AncillaryFunction1", "one,two,three")
	[ ] Print ("Call  `AncillaryFunction2` Function with `one,two,three` Arguments:")
	[ ] ExecFunction ("AncillaryFunction2", "one,two,three")
	[ ] 
	[ ] print("----------- NextStr Function ----------------------")
	[ ] Print ("Next string for  `{sNextString}` is : {NextStr(sNextString)}")
	[ ] 
	[ ] print("----------- MyCreateWinclassInstance Function -----")
	[ ] WINDOW w = MyCreateWinclassInstance (wDoctor, "[DialogBox]$59648/[TextField]Code:")
	[ ] print("Tag of the created Window: {w.GetTag()}")
	[ ] 

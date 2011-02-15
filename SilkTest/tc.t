[ ] //***********************************
[ ] // Window: ARSetup - add Doctor
[ ] //
[ ] // Task 2.3: Create .t file, include it into your project, and fill all fields of the 
[ ] // recognized window by random values (include frame of the window with the ”use” statement).
[ ] //***********************************
[ ] 
[ ] use "Doctor.inc"
[ ] 
[+] appstate apsOpenNewDoctorWindow () basedon none
	[+] if(GetTestcaseState() == TCS_ENTERING)
		[ ] wARSetup.SetActive()
		[ ] wARSetup.File.New.Doctors.Pick ()
[ ] 
[+] testcase FillAllFild () appstate apsOpenNewDoctorWindow
	[ ] 
	[ ] //TODO: add variables declaration here
	[ ] 
	[ ] wDoctor.edtCode.SetTextWithVerify(5) 
	[ ] wDoctor.edtDoctorSecondID.SetTextWithVerify(15)
	[ ] wDoctor.edtDoctorThirdID.SetTextWithVerify(15)
	[ ] wDoctor.cbActive.click ()
	[ ] wDoctor.edtNPI.SetIntWithVerify(10) 
	[ ] wDoctor.edtUPIN.SetIntWithVerify(11)
	[ ] wDoctor.edtTitle.SetTextWithVerify(14)
	[ ] wDoctor.edtLastName.SetTextWithVerify(35)
	[ ] wDoctor.edtFirstName.SetTextWithVerify(27)
	[ ] wDoctor.edtMiddleName.SetTextWithVerify(27)
	[ ] wDoctor.edtSuffix.SetTextWithVerify(11)
	[ ] wDoctor.edtSS1.SetIntWithVerify(9)		
	[ ] wDoctor.lstType.SetCurItemByPos(RandInt(1,wDoctor.lstType.iCount))
	[ ] wDoctor.edtSpecialty.TypeKeys("<F2>")
	[ ] wF2Search.lstQuaeryLimit.iValue = wF2Search.lstQuaeryLimit.iItemCount
	[ ] wF2Search.btnSearch.Click()
	[ ] wSearch.GridSearch.CellDoubleClick(RandInt(1,wSearch.GridSearch.iRowCount),1)
	[ ] wDoctor.edtMedSrvCode.SetTextWithVerify(5)
	[ ] wDoctor.edtLicence.SetIntWithVerify(11)
	[ ] wDoctor.edtStreet1.SetTextWithVerify(23)
	[ ] wDoctor.edtStreet2.SetTextWithVerify(23)
	[ ] wDoctor.edtCity.SetTextWithVerify(39)
	[ ] wDoctor.lstState.SetCurItemByPos(RandInt(1,wDoctor.lstState.iCount))
	[ ] wDoctor.edtZip1.SetIntWithVerify(9)		
	[ ] wDoctor.edtCountry.SetTextWithVerify(23)
	[ ] wDoctor.edtPhone1.SetText(RandStr("X(3) + 9(7)"))	//Пока без проверки
	[ ] wDoctor.edtExt1.SetIntWithVerify(11)
	[ ] wDoctor.edtPhone2.SetText(RandStr("X(3) + 9(7)"))	//Пока без проверки
	[ ] wDoctor.edtExt2.SetIntWithVerify(11)
	[ ] wDoctor.edtPager.SetText(RandStr("X(3) + 9(7)"))	//Пока без проверки
	[ ] wDoctor.edtModem.SetText(RandStr("X(3) + 9(7)"))	//Пока без проверки
	[ ] wDoctor.edtFax.SetText(RandStr("X(3) + 9(7)"))		//Пока без проверки
	[ ] wDoctor.edtTerritory.SetTextWithVerify(15)
	[ ] wDoctor.edtContact.SetTextWithVerify(47)
	[ ] wDoctor.edtRegion.SetTextWithVerify(15)
	[ ] wDoctor.edtEMail.SetTextWithVerify(47)
	[ ] wDoctor.edtCounty.SetTextWithVerify(15)
	[ ] 
	[ ] wDoctor.gridProviderNumbers.CellClick(1,1)
	[ ] wDoctor.gridProviderNumbers.TypeKeys("<F2>")
	[ ] wF2Search.lstQuaeryLimit.iValue = wF2Search.lstQuaeryLimit.iItemCount
	[ ] wF2Search.btnSearch.Click()
	[ ] wSearch.GridSearch.CellDoubleClick(RandInt(1,wSearch.GridSearch.iMaxRec),1)
	[ ] wDoctor.gridProviderNumbers.TypeKeys("<Enter>")
	[ ] wDoctor.gridProviderNumbers.TypeKeys(RandStr("X(5)") + "<Enter>" )		//Пока без проверки
	[ ] wDoctor.gridProviderNumbers.TypeKeys("<F2>")
	[ ] wF2Search.lstQuaeryLimit.iValue = wF2Search.lstQuaeryLimit.iItemCount
	[ ] wF2Search.btnSearch.Click()
	[ ] wSearch.GridSearch.CellDoubleClick(RandInt(1,wSearch.GridSearch.iMaxRec),1)
	[ ] wDoctor.gridProviderNumbers.TypeKeys("<Enter>")
	[ ] wDoctor.gridProviderNumbers.TypeKeys("<F2>")
	[ ] wF2Search.lstQuaeryLimit.iValue = wF2Search.lstQuaeryLimit.iItemCount
	[ ] wF2Search.btnSearch.Click()
	[ ] wSearch.GridSearch.CellDoubleClick(RandInt(1,wSearch.GridSearch.iMaxRec),1)
	[ ] wDoctor.gridProviderNumbers.TypeKeys("<Enter>")
	[ ] wDoctor.gridProviderNumbers.TypeKeys("<F2>")
	[ ] wF2Search.lstQuaeryLimit.iValue = wF2Search.lstQuaeryLimit.iItemCount
	[ ] wF2Search.btnSearch.Click()
	[ ] wSearch.GridSearch.CellDoubleClick(RandInt(1,wSearch.GridSearch.iMaxRec),1)
	[ ] wSearch.btnOK.Click()		
	[ ] wDoctor.gridProviderNumbers.CellClick(1,5)
	[ ] wDoctor.gridProviderNumbers.TypeKeys("<Enter>")
	[ ] wDoctor.gridProviderNumbers.TypeKeys("<F2>")
	[ ] wF2Search.lstQuaeryLimit.iValue = wF2Search.lstQuaeryLimit.iItemCount
	[ ] wF2Search.btnSearch.Click()
	[ ] wSearch.GridSearch.CellDoubleClick(RandInt(1,wSearch.GridSearch.iMaxRec),1)
	[ ] wDoctor.gridProviderNumbers.TypeKeys("<Enter>")
	[ ] wDoctor.gridProviderNumbers.TypeKeys("< >")
	[ ] 
	[ ] 
[ ] 
[+] main ()
	[ ] 
	[ ] FillAllFild ()
	[ ] 
[ ] 

<!-- #include file="adovbs.inc" -->

<%

'strCategoryLogoURL = SERVER.MAPPATH("../images")

FUNCTION DisconnectionRecordset(aryFields,aryValues,RecordsetSession)

'**************************************
'This function creates a disconnected recordset as well as
'adds a new record to an existing recordset. To pass the 
'disconnected recordset page to page you must use the session
'object. You must pass your field names and values in an array
'in order for this function to operate properly.
'**************************************
 
IF isObject(RecordsetSession) THEN 
   ' check to see if we have a recordset created
	SET oRs = RecordsetSession ' if we do add the values
	 
	IF oRs.Recordcount > 0 THEN
		oRs.movefirst
	END IF

	IF NOT oRs.EOF THEN'Checking For EOF
		oRs.movelast
		iSeed = oRs("id") + 1 
		oRs.addnew
		oRs("id") = iSeed 
		response.write "Next=" & oRs("id")
	ELSE
		SET oRs = server.CreateObject("adodb.recordset") 
		' Create a new custom recordset
		oRs.fields.append "id",adInteger,4 
		FOR x = 0 TO Ubound(aryFields)-1
			 oRs.fields.append aryFields(x),adVarChar, 255
		NEXT
		oRs.open
		oRs.addnew 
		oRs("id") = 1 
		response.write "After=" & oRs("id")
	END IF
	
Else
	SET oRs = Server.CreateObject("ADODB.Recordset") 
	' Create a new custom recordset
	oRs.fields.append "id",adInteger,5
	FOR x = 0 TO Ubound(aryFields)-1
		oRs.fields.append aryFields(x),adVarChar, 255
	NEXT
	oRs.open
	oRs.addnew 
	response.write "First=" & oRs("id")
	oRs("id") = 1 
	response.write "First=" & oRs("id")
END IF

FOR y = 0 TO Ubound(aryfields)-1
	oRs(aryFields(y)) = aryValues(y)
	response.write  aryfields(y)  & "=" & oRs(y)& "<br>"
NEXT


oRs.update
SET DisconnectionRecordset = oRs


END FUNCTION


FUNCTION  ModifyDeleteRecords(iRsID,iAction,vFieldtoModify,vNewValue,RecordsetSession)
	SET oRs = RecordsetSession
	oRs.movefirst
	response.write "ASas" & iRsID
	oRs.find ("id = "  & iRsID )
	response.write vNewValue

	' Pass -1 for deletion
	' Pass  1 for updation

	IF iAction > 0 THEN
		oRs("Qty") = Cint(vNewValue)
	ELSE
		oRs.delete
	END IF
END FUNCTION	

' Paging Function start	 
'***********************

Function GetHitCountAndPageLinks(sHref, nTotalRecords, nRecordsPerPage, intPageCount, currentPage, sQueryString)
	Dim sReturnValue

	sReturnValue = vbCrLf _
		& "<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 width=""100%"">" & vbCrLf _
		& "<TR>" & vbCrLf _
		& "<TD ALIGN=CENTER><b>" & DisplayHitCount(nTotalRecords, nRecordsPerPage, intPageCount, currentPage) & "</b><br></TD>" & vbCrLf _
		& "</TR>" & vbCrLf

	If intPageCount > 1 Then
		sReturnValue = sReturnValue & "<TR>" & vbCrLf _
			& "<TD>" & vbCrLf _
			& DisplayPageLinks(sHref, sQueryString, intPageCount, currentPage) & vbCrLf _
			& "</TD>" & vbCrLf _
			& "</TR>" & vbCrLf
	End If

	sReturnValue = sReturnValue & "</TABLE>" & vbCrLf

	GetHitCountAndPageLinks = sReturnValue
End Function

Function DisplayHitCount(nTotalRecords, nRecordsPerPage, intPageCount, currentPage)
	Dim sReturnValue

	If nTotalRecords = 0 Then
		sReturnValue = "No Results Found."
	Elseif nTotalRecords = 1 then
		sReturnValue = "1 Record Found."
	Else
		Dim nLowestDisplayed, nHighestDisplayed
		Call GetHighAndLowRecordsDisplayed(nTotalRecords, nRecordsPerPage, intPageCount, currentPage, nLowestDisplayed, nHighestDisplayed)

		If nLowestDisplayed = nHighestDisplayed Then
			sReturnValue = nTotalRecords & " Records Found. Showing Result " & nLowestDisplayed & "."
		Else
			sReturnValue = nTotalRecords & " Records Found. Showing Results " & nLowestDisplayed & " to " & nHighestDisplayed & "."
		End If
	End If

	DisplayHitCount = sReturnValue
End Function


Sub GetHighAndLowRecordsDisplayed(nTotalRecords, nRecordsPerPage, intPageCount, currentPage, nLowestDisplayed, nHighestDisplayed)
	nLowestDisplayed = currentPage * nRecordsPerPage + 1

	If currentPage >= intPageCount - 1 and currentPage = intPageCount - 1 Then		' The last page is displayed
		' The highest record displayed is the last record
		nHighestDisplayed = nTotalRecords
	Else
		nHighestDisplayed = (currentPage + 1) * nRecordsPerPage
	End If
End Sub


Function DisplayPageLinks(sHref, sQueryString, intPageCount, currentPage)
	If intPageCount = 1 Then
		DisplayPageLinks = ""
		Exit Function
	End If

	Dim sReturnValue

	sReturnValue = "<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=1 WIDTH=""100%"">" & VbCrLf _
		& VbCrLf _
		& "<TR VALIGN=BOTTOM>" & VbCrLf _
		& "<TD WIDTH=""25%"" NOWRAP>" & VbCrLf

	If currentPage > 0 Then
		sReturnValue = sReturnValue & "<FONT COLOR=""#666666""><A HREF=""" & sHref & "?page=" & currentPage - 1 & sQueryString & """>&lt;&lt; Previous</A>&nbsp;&nbsp;&nbsp;</FONT><BR>" & VbCrLf
	else
		sReturnValue = sReturnValue & "&nbsp;"	
	End If

	sReturnValue = sReturnValue & "</TD>" & VbCrLf _
		& "<TD ALIGN=CENTER VALIGN=MIDDLE NOWRAP>" & VbCrLf _
		& "<FONT COLOR=""#666666"">" & VbCrLf

	Dim nLowPageLink, nHighPageLink, i

	' Make initial high/low calculations
	nLowPageLink = currentPage - 3
	nHighPageLink = currentPage + 3

	' If low is less than zero, increase both values
	If nLowPageLink < 0 Then
		nHighPageLink = nHighPageLink - nLowPageLink
		nLowPageLink = 0
	End If

	' If high is greater than total pages, decrease both values
	If nHighPageLink > intPageCount - 1 Then
		nLowPageLink = nLowPageLink - (nHighPageLink - intPageCount)
		nHighPageLink = intPageCount - 1
	End If

	' Ensure that the low value is not negative
	If nLowPageLink < 0 Then nLowPageLink = 0

	If nLowPageLink <> 0 Then
		' Display a link to the first page
		sReturnValue = sReturnValue & " <A HREF=""" & sHref & "?page=0" & sQueryString & """>First</A> ... " & VbCrLf
	End If
			
	For i = nLowPageLink To nHighPageLink
		If i = currentPage Then
			sReturnValue = sReturnValue & "<B>&nbsp;" & i + 1 & "&nbsp;</B>" & VbCrLf
		Else
			sReturnValue = sReturnValue & "&nbsp;<A HREF=""" & sHref & "?page=" & i & sQueryString & """>" & i + 1 & "</A>&nbsp;" & VbCrLf
		End If
	Next

	If nHighPageLink <> intPageCount - 1 Then
		' Display a link to the last page
		sReturnValue = sReturnValue & " ... <A HREF=""" & sHref & "?page=" & intPageCount - 1 & sQueryString &  """>Last</A> " & VbCrLf
	End If

	sReturnValue = sReturnValue & "</FONT>" & VbCrLf _
		& "</TD>" & VbCrLf _
		& "<TD ALIGN=RIGHT WIDTH=""25%"" NOWRAP>" & VbCrLf

	If currentPage < intPageCount - 1 Then
		sReturnValue = sReturnValue & "&nbsp;&nbsp;&nbsp;<A HREF=""" & sHref & "?page=" & currentPage + 1 & sQueryString & """>Next &gt;&gt;</A><BR>" & VbCrLf
	else
		sReturnValue = sReturnValue & "&nbsp;"	
	End If

	sReturnValue = sReturnValue & "</TD>" & VbCrLf _
		& "</TR>" & VbCrLf _
		& VbCrLf _
		& "</TABLE>" & VbCrLf

	DisplayPageLinks = sReturnValue
End Function

' Paging Function End 
'*********************

' UPLOADING FUNCTION START
' ************************
	
	FUNCTION UploadImage(strConnection,strType,strPath)
		strUploadPath = strPath
		SET objRS = SERVER.CREATEOBJECT("ADODB.RECORDSET")
		Set Upload = Server.CreateObject("Persits.Upload")
		intSaved = Upload.Save(strUploadPath)
		strAction = Upload.Form("txtAction")

		IF strType = "Category" THEN
			txtProdID = Upload.Form("txtProdID")
			strImage= ""
			strLogo = "" 

			IF intSaved > 0 THEN 
				strLogo = Upload.Files("Prod_Image").Extractfilename
			END IF

			strProductName = Upload.Form("Prod_Name")
			strSQL = "SELECT * FROM ni_category Where categoryid =" & txtProdID
			objRS.OPEN strSQL,objcon,3,2
			
			SET res    = Server.CreateObject("ADODB.Recordset")	

			IF strAction = "Add" THEN
				objRS.ADDNEW
					
				st="select max(categoryid) as maxid from ni_category"
				res.open st,objcon
				IF res("maxid")<>"" THEN
					maxid=res("maxid")+1
					
				ELSE
					maxid=1
				END IF
				res.close
				objRS("categoryid") = maxid

			END IF
		
				objRS("categoryname") =  strProductName
				objRS("categorydesc") =  Upload.Form("Prod_Desc")

				IF intSaved  > 0 THEN
					objRS("imagepic") = strLogo
				END IF
												
				objRS.UPDATE
				objRS.close
				Set objRS = Nothing

		END IF

		IF strType = "CategoryImage" THEN
			txtProdID = Upload.Form("txtProdID")
			strImage= Upload.Form("txttype")
			
			IF intSaved  > 0 THEN
				strImagename = 	Upload.Files("txtImage").Extractfilename
			END IF

			strSQL = "SELECT * FROM ni_category Where categoryid =" & txtProdID
			objRS.OPEN strSQL,objcon,3,2

			IF NOT objRS.EOF THEN

				IF strImage = "Image" THEN
					objRS("imagepic") = strImagename
				END IF
				
				objRS.UPDATE
			END IF
	
		END IF
	
		UploadImage = true
	

	END FUNCTION


' UPLOADING FUNCTION END
' **********************



' Getting Category / Sub Category Name Start
' ******************************************

FUNCTION GetCategoryName(icatID,strType)
	SET	objCat = SERVER.CREATEOBJECT("ADODB.RECORDSET")
	
	IF lcase(strType) = "category" THEN
		strSQL = "SELECT * FROM ni_category Where categoryid="&icatID
		strField = "categoryname"
	END IF

	objCat.OPEN strSQL,objcon
	IF NOT objCat.EOF THEN
		GetCategoryName = objCat(strField)
	ELSE
		GetCategoryName = ""
	END IF



END FUNCTION

' Getting Category / Sub Category Name End
' ******************************************

' Function to Format Currency
' **************************
 FUNCTION fCurrency(cAmt)
	IF cAmt = "" THEN
		fCurrency = FORMATCURRENCY("0",2)
	ELSE
		fCurrency = FORMATCURRENCY(cAmt,2)
	END IF
		
 END FUNCTION

'********************************	
' Function to add/edit records	*
'********************************

FUNCTION addtoRS(byRef rs,sField)
	FOR EACH QueryName IN REQUEST.FORM
		FOR EACH fieldname IN rs.Fields
			IF LCASE(fieldname.name) <> LCASE(sField) THEN
				
				IF LCASE(fieldname.name) = LCASE(QueryName) THEN
					
					'RESPONSE.WRITE fieldname.type &" fieldname.type :<BR> " 
					'RESPONSE.WRITE fieldname.name &" fieldname.name :<BR> " 
										
					select case fieldname.type 
						case 3,20,6,14,5,131,4,2,16,139
							IF ISNUMERIC(REQUEST(fieldname.name)) THEN
								rs(fieldname.name) = REQUEST(fieldname.name)
							END IF	
						CASE 11
							IF CBOOL(REQUEST(QueryName)) OR NOT 			CBOOL(REQUEST(fieldname.name)) THEN
								rs(fieldname.name) = REQUEST(QueryName)
							END IF
						CASE 7,133,134,135
							IF ISDATE(REQUEST(fieldname.name)) THEN
								rs(fieldname.name) = REQUEST(fieldname.name)
							END IF
						CASE ELSE
							IF fieldname.Attributes = "0x20" AND 	REQUEST(fieldname.name) = "" THEN
								rs(fieldname.name) = Null
							ELSEIF request(fieldname.name) = "" THEN
								rs(fieldname.name) = vbcrlf
							ELSE 
								rs(fieldname.name) = REQUEST(fieldname.name)
							END IF
					END SELECT
				END IF 
			END IF
		NEXT
	NEXT
END FUNCTION

FUNCTION UPDATEFORM(sStep,sTable,sField,ChckID,objcon)
	
	SET objRs = SERVER.CREATEOBJECT("ADODB.RECORDSET")
	objRs.OPEN "SELECT * FROM " &sTable,objcon,3,2

	SELECT CASE sStep 
		CASE "Add" ' ADD NEW
			objRs.AddNew()
			call addtoRS(objRs,sField)
			objRs.Update()
			objRs.Requery
		CASE "Edit" ' UPDATE
			objRs.Find sField &" = " & ChckID
			call addtoRS(objRs,sField)
			objRs.Update()
			objRs.Requery
		CASE "Delete" ' DELETE
			objRs.Find sField &" = " & ChckID
			IF NOT objRs.EOF THEN
				objRs.delete
				objRs.Requery
			END IF
	END SELECT
	objRs.CLOSE
	SET objRs = NOTHING
END FUNCTION

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''formatTxt Function is for displaying values in a formatted way
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
FUNCTION formatTxt( ByVal theText )
    theText = Replace( theText, "<p>", vbCRLF&vbCRLF)
    theText = Replace( theText, "<br>", vbCRLF)
    formatTxt = theText
END FUNCTION

FUNCTION FixQuotes(thetext)
		strtext = thetext
		strtext = REPLACE(strtext,"''","'")
		strtext = REPLACE(strtext, vbCrlf&vbCrlf ,"<P>")
		strtext = REPLACE(strtext, vbCrlf ,"<BR>")
		FixQuotes = strtext
END FUNCTION

Function PageBottomMenu(BM1, BM2, BM3, BM4, BM5, BM6, BM7, BM8, BM9, BM10, BM11, BM12, BM13)

    Dim s, i
    Dim bMenu(14)

    bMenu(1) = BM1
    bMenu(2) = BM2
    bMenu(3) = BM3
    bMenu(4) = BM4
    bMenu(5) = BM5
    bMenu(6) = BM6
    bMenu(7) = BM7
    bMenu(8) = BM8
    bMenu(9) = BM9
    bMenu(10) = BM10
    bMenu(11) = BM11
    bMenu(12) = BM12
    bMenu(13) = BM13
	

    s = vbCrLf & _
        "<tr>" & vbCrLf & _
        "  <td>" & vbCrLf & _
	"<TABLE Align=center Width=""100%"" Border=0 Cellspacing=10 Cellpadding=0>" & vbCrLf & _
	"  <TR VAlign=""top"">" & vbCrLf & _
	"    <TD>" & vbCrLf & _
	"      <HR>" & vbCrLf & _
	"      <B><FONT Size=""1"">"

    For i = 1 to 13
	Select Case UCase(bMenu(i))
	    Case "HOME"
		s = s & "<A HRef=""" & strPathBase & "index.asp""><FONT Size=""1"">Home</FONT></A>"
	    Case "RT"
		s = s & "<A HRef=""" & strPathBase & "home/RaffleTicket/index.asp""><FONT Size=""1"">Raffle Ticket</FONT></A>"
	    Case "NM"
		s = s & "<A HRef=""" & strPathBase & "home/NumberMachine/index.asp""><FONT Size=""1"">Number Machine</FONT></A>"
		Case "NMPRO"
		s = s & "<A HRef=""" & strPathBase & "home/NumberMachinePro/index.asp""><FONT Size=""1"">Number Machine Pro</FOND></A>"
	    Case "HS"
		s = s & "<A HRef=""" & strPathBase & "home/HandStamps/index.asp""><FONT Size=""1"">Hand Stamps</FONT></A>"
	    Case "MAP"
		s = s & "<A HRef=""" & strPathBase & "home/SiteMap.asp""><FONT Size=""1"">Site Map</FONT></A>"
	    Case "ABOUTUS"
		s = s & "<A HRef=""" & strPathBase & "home/AboutUs/AboutUs.asp""><FONT Size=""1"">About Us</FONT></A>"
	    Case "NMHOME"
		s = s & "<A HRef=""index.asp""><FONT Size=""1"">About Number Machine</FONT></A>"
	    Case "NMPROHOME"
		s = s & "<A HRef=""index.asp""><FONT Size=""1"">About Number Machine Pro</FONT></A>"
	    Case "NMSAMPLE"
		s = s & "<A HRef=""nmSample1.asp""><FONT Size=""1"">Sample Formats</FONT></A>"
	    Case "NMPRODEMO"
		s = s & "<A HRef=""nmproDemo.asp""><FONT Size=""1"">Free Demo</FONT></A>"
	    Case "NMFAQ"
		s = s & "<A HRef=""nmFAQ.asp""><FONT Size=""1"">FAQs</FONT></A>"
	    Case "NMTEST"
		s = s & "<A HRef=""nmTest.asp""><FONT Size=""1"">Testimonials</FONT></A>"
	    Case "RTHOME"
		s = s & "<A HRef=""index.asp""><FONT Size=""1"">About Raffle Ticket</FONT></A>"
	    Case "RTDEMO"
		s = s & "<A HRef=""rtDemo.asp""><FONT Size=""1"">Free Demo</FONT></A>"
	    Case "RTUPDATE"
		s = s & "<A HRef=""rtDemo.asp""><FONT Size=""1"">Free Update</FONT></A>"
	    Case "RTFAQ"
		s = s & "<A HRef=""rtFAQ.asp""><FONT Size=""1"">FAQs</FONT></A>"
	    Case "RTPAPER"
		s = s & "<A HRef=""" & strPathBase & "home/RaffleTicket/ni-rtPaper.asp""><FONT Size=""1"">Perforated Paper</FONT></A>"
	    Case "RTPER"
		s = s & "<A HRef=""rtPerPages.asp""><FONT Size=""1"">Personal Pages</FONT></A>"
	    Case "RTSAMPLE"
		s = s & "<a href=""javascript:window.open('rtSample1.asp'," & _
		"'','scrollbars=yes,fullscreen=no,resizable=yes, " & _
		"height=500,width=725,left=25,top=25');void(0)""><FONT Size=""1"">How to Operate</FONT></A>"
	    Case "RTTEST"
		s = s & "<A HRef=""rtTest.asp""><FONT Size=""1"">Testimonials</FONT></A>"
		Case "HELPPAGES"
		s = s & "<A HRef=""http://hosted.comm100.com/KnowledgeBase/Default.aspx?SiteId=63916"" target=""_new""><FONT Size=""1"">Help Pages</FONT></A>"
	    Case "CONTACTUS"
		s = s & "<A HRef=""" & strPathBase & "home/RaffleTicket/rtContactUs.asp""><FONT Size=""1"">Contact Us</FONT></A>"	
		Case "PAPERPRINTING"
		s = s & "<A HRef=""rtPaper_Printing.asp""<FONT Size=""1"">Paper Printing</FONT></A>"	
		Case "NMPROTIPS"
		s = s & "<A HRef=""nmproTips.asp""><FONT Size=""1"">Printing Tips</FONT></A>"

		
				
	End Select

	If bMenu(i+1) <> "" then
	    s = s & " | "
	End If
	s = s & vbCrLf
    Next

    s = s & "</FONT></B></TD>" & vbCrLf & "</TR>" & vbCrLf & "</TABLE>" & vbCrLf & _
        "</td></tr><tr><td>"


    s = s & "<TABLE Width=""100%"" Border=0 Cellspacing=10 Cellpadding=0> <TR>" & vbCrLf & _
	"<TD><IMG SRC=""" & strPathImages & "icon_mastercard.gif"" Border=0 Alt=""Master Card""></TD>" & vbCrLf & _
	"<TD><IMG SRC=""" & strPathImages & "icon_visa.gif"" Border=0 Alt=""VISA""></TD>" & vbCrLf & _
	"<TD><IMG SRC=""" & strPathImages & "icon_amex.gif"" Border=0 Alt=""American Express""></TD>" & vbCrLf & _
	"<TD><IMG SRC=""" & strPathImages & "icon_discover.gif"" Border=0 Alt=""Discover""></TD>" & vbCrLf & _
	"<TD><IMG SRC=""" & strPathImages & "icon_paypal.gif"" Border=0 Alt=""PayPal""></TD>" & vbCrLf & _
	"</TR></TABLE></td></tr>" & vbCrLf 

    PageBottomMenu = s

End Function

Function PageLeftMenu(BM1, BM2, BM3, BM4, BM5, BM6, BM7, BM8)

    Dim s, i, pre
    Dim bMenu(9)

    bMenu(1) = BM1
    bMenu(2) = BM2
    bMenu(3) = BM3
    bMenu(4) = BM4
    bMenu(5) = BM5
    bMenu(6) = BM6
    bMenu(7) = BM7
    bMenu(8) = BM8

    pre = "<a href='" & strPathBase

    s = "<tr>" & _
          "<td align='center'><br><br>" & _
            "<table width='215' border='0'>"


    For i = 1 to 8
        if bMenu(i) <> "" then

            s = s & "<tr>" & _
                "<td width='35'>" & _
                  "&nbsp;" & _
                "</td>" & _
                "<td width='180' align='center'>"

	    Select Case UCase(bMenu(i))
	    Case "HOME"
		s = s & pre & "index.asp' class='button_sidemenu'>Number-it Home</a>"
	    Case "RT"
		s = s & pre & "home/RaffleTicket/index.asp' class='button_sidemenu'>Raffle Ticket</a>"
	    Case "NM"
		s = s & pre & "home/NumberMachine/index.asp' class='button_sidemenu'>Number Machine</a>"
	    Case "MAP"
		s = s & pre & "home/SiteMap.asp' class='button_sidemenu'>Site Map</a>"
	    Case "ABOUTUS"
		s = s & pre & "home/AboutUs/AboutUs.asp' class='button_sidemenu'>About Us</a>"
	    Case "NMHOME"
		s = s & pre & "index.asp' class='button_sidemenu'>About Number Machine</a>"
	    Case "NMPRODEMO"
		s = s & pre & "home/NumberMachinePro/nmproDemo.asp' class='button_sidemenu'>Free Demo</a>"	    
		Case "NMSAMPLE"
		s = s & pre & "home/NumberMachine/nmSample1.asp' class='button_sidemenu'>Sample Formats></a>"
	    Case "NMFAQ"
		s = s & pre & "home/NumberMachine/nmFAQ.asp' class='button_sidemenu'>FAQs</a>"
	    Case "NMTEST"
		s = s & pre & "home/NumberMachine/nmTest.asp' class='button_sidemenu'>Testimonials</a>"
	    Case "RTHOME"
		s = s & pre & "home/RaffleTicket/index.asp' class='button_sidemenu'>About Raffle Ticket</a>"
	    Case "RTDEMO"
		s = s & pre & "home/RaffleTicket/rtDemo.asp' class='button_sidemenu'>Free Demo</a>"
	    Case "RTUPDATE"
		s = s & pre & "home/RaffleTicket/rtUpdate.asp' class='button_sidemenu'>Free Update</a>"
	    Case "RTFAQ"
		s = s & pre & "home/RaffleTicket/rtFAQ.asp' class='button_sidemenu'>FAQs</a>"
	    Case "RTPAPER"
		s = s & pre & "home/RaffleTicket/rtPaper.asp' class='button_sidemenu'>Perforated Paper</a>"
	    Case "RTPER"
		s = s & pre & "home/RaffleTicket/rtPerPages.asp' class='button_sidemenu'>Personal Pages</a>"
	    Case "RTSAMPLE"
		s = s & "<a href=""javascript:window.open('rtSample1.asp'," & _
		"'','scrollbars=yes,fullscreen=no,resizable=yes, " & _
		"height=500,width=725,left=25,top=25');void(0)"" class='button_sidemenu'>How to Operate</a>"
	    Case "RTTEST"
		s = s & pre & "home/RaffleTicket/rtTest.asp' class='button_sidemenu'>Testimonials</a>"
            End Select

                s = s & "</td></tr>"
        End If

    Next

    s = s & "<tr>" & _
        "<td width='35'>" & _
          "&nbsp;" & _
        "</td>" & _
        "<td width='180' align='center'><br>"
    s = s & pre & "index.asp' class='button_sidemenu'>Number-it Home</a>"
    s = s & "</td></tr>"

    s = s & "</table></td></tr>" & vbCrLf

    PageLeftMenu = s

End Function

FUNCTION strAlphabetLine(newPage, fltName)

    For I = 1 to 26
	strAlphabetLine = strAlphabetLine & _
	    "<a href='" & _
	    newPage & _
	    ".asp?" & _
	    fltName & _
	    "=" & _
	    chr(I+64) & _
	    "'><FONT Size=""1"">" & _
	    chr(I+64) & _
	    "</FONT></a> "
    Next
	strAlphabetLine = strAlphabetLine & _
	    "<a href='" & _
	    newPage & _
	    ".asp?" & _
	    fltName & _
	    "=All'><FONT Size=""1"">All</FONT></a>"

END FUNCTION

FUNCTION iif(boolEval, trueStr, falseStr)

    if boolEval then
	iif = trueStr
    else 
	iif = falseStr
    end if

END FUNCTION

FUNCTION GetItem(ItemID)

    If ItemID<1 then
	GetItem = ""
    Else
	set rst = server.createObject("ADODB.Recordset")
	SQL="SELECT * FROM ni_Items WHERE [ItemID] = " & ItemID
	rst.open SQL,objcon,2,3
	If not rst.eof Then
	    GetItem = rst("Description")
	Else
	    GetItem = ""
	End If
	rst.close
	set rst=nothing
    End If

END FUNCTION

FUNCTION GetItemID(Desc)

    If Desc = "" then
	GetItemID = 0
    Else
	set rst = server.createObject("ADODB.Recordset")
	SQL="SELECT * FROM ni_Items WHERE [Description] = '" & Desc & "'"
	rst.open SQL,objcon,2,3
	If not rst.eof Then
	    GetItemID = cInt(rst("ItemID"))
	Else
	    GetItemID = 0
	End If
	rst.close
	set rst=nothing
    End If

END FUNCTION

    function showCurrency(amount)
        if Session("Symbol") = "" then
            Session("Symbol") = "USD"
        end if
        if Session("Symbol") = "USD" then
            a1 = fix(amount)
            a2 = fix(((amount - a1) + .0005) * 100)
            if Len(a2) = 1 then
                a2 = "0" & a2
            end if
            showCurrency = "<font size=2><sup>$</sup></font>" & _
                "<font size=4>" & a1 & "</font>" & _
                "<font size=2><sup>" & a2 & "</sup></font>"
        else
            a = Amount * cSng(Session("Bid"))
            a1 = fix(a)
            a2 = fix(((a - a1) + .0005) * 100)
            if Len(a2) = 1 then
                a2 = "0" & a2
            end if
            if a1 > 399 then
                a2 = ""
            end if
            showCurrency = "<font size=2><sup>" & Session("Symbol") & " </sup></font>" & _
                "<font size=4>" & a1 & "</font>" & _
                "<font size=2><sup>" & a2 & "</sup></font> " & PopUpHelp(12)
        end if
    end function


    FUNCTION fixAps( ByVal theString )
        fixAps = Replace( theString, "'", "''" )
    END FUNCTION

%>

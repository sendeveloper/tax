<%
	
     Session.Timeout = 60

	' Declare The Variables
	' **********************
	Public oWin
	Dim strPathImages
	Dim strPathIncludes
	Dim strPathCart
	Dim strPathBase
	Dim strPathBO
        Dim strPathHA
        Dim strPathZ2T
        Dim strPathEmail
	Dim strTitleColor
        Dim iRecordperpage
        Dim strAdminEmail
        Dim strAdminFromEmail
	Dim BlueArrows
	Dim bMenu(10)

	' Set The Variables
	' **********************
	strPathImages		= "http://www.number-it.com/home/images/"
	strPathIncludes		= "http://www.number-it.com/home/includes/"
	strPathCart		= "http://www.ewebcart.com/cgi-bin/cart.pl?merchant=3233"
	strPathBase		= "http://www.number-it.com/"
	strPathBO		= "http://www.number-it.com/home/backoffice/"
        strPathHA		= "http://www.number-it.com/home/backoffice/ha/ha/"
        strPathZ2T		= "http://www.number-it.com/home/backoffice/Zip2Tax/"
        strPathEmail		= "http://www.number-it.com/home/backoffice/Email/"
	strTitleColor		= "#204050"
	iRecordperpage		= "20"
	strAdminEmail 		= "Service@Number-It.com"
	strAdminFromEmail 	= "Service@Number-It.com"
	BlueArrows 		= "<b><font color='#3399FF'>&raquo;</font></b>"




    'Keyword Tracking
    '----------------
    Session("RequestSource")=""
    if request("s")<>"" then
        Session("RequestSource") = Request("s")
    end if
    if request("Source")<>"" then
        Session("RequestSource") = Request("Source")
    end if

    Session("RequestKeyword")=""
    if request("c")<>"" then
        Session("RequestKeyword") = Request("c")
    end if
    if request("k")<>"" then
        Session("RequestKeyword") = Request("k")
    end if
    if request("Keyword")<>"" then
        Session("RequestKeyword") = Request("Keyword")
    end if  

%>

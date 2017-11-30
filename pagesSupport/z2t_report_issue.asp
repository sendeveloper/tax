<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->
<%
    Session("activePage") = "Support"
    Session("currentPage") = "z2t_report_issues.asp"
%>

<html>
<head>
    <title>Report An Issue - Zip2Tax</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="description" content="Contact Zip2Tax to report an issue or a bug within our site.">
    <!-- #include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->	
	    <!--#include virtual="/Website/Includes/BodyParts/newHeading.asp"-->

    <style type="text/css">
      label
      {
        font-size: 1.25em;   
      }
      input
      {
        font-size: 1.25em;   
      }
      textarea
      {
        width: 25em;
        height: 12em;
        resize: none;
      }
    </style>
</head>
<body onload="resizeTo(700,750);" style="background: #FFF !important">
    <div id="content" class="NoPrint">
        <div class="post">
            <h1 class="title">
                Report An Issue</h1>
            <div class="entry">
                <div>
                    <img src="/Website/Images/office_workers.jpg" alt="Office Workers"></div>
                <form method="post" action="z2t_Email_Issue_Send.asp" name="frm">
                <div style="width: 550px; height: 400px; margin-top: 10px; font-size: 12px;">
                    <div style="width: 10em; float: left"><label for="txtName">
                        Name:&nbsp;</label></div>
                    <input type="text" id="txtName" name="Name" value="" style="float: left"><br><br>
                    <div style="width: 10em; float: left">
                            <label for="txtEmail">
                        E-mail:&nbsp;</label></div>
                    <input type="text" id="txtEmail" value="" name="Email"><br><br>
                    <div style="width: 10em; float: left"><label for="txtCC">
                        CC:&nbsp;</label></div>
                    <input type="text" id="txtCC" name="Copy" value=""><br><br>
                    <div style="width: 10em; float: left"><label for="txtSubject">
                        Subject:&nbsp;</label></div>
                    <select id="selSubject" name="selSubject" style="width: 10em">
                        <option value="Error Message">Error Message</option>
                        <option value="Account">Account</option>
                        <option value="Rate">Rate</option>
                        <option value="Address">Address</option>
                        <option value="Jurisdiction">Jurisdiction</option>
                        <option value="Map">Map</option>
                        <option value="Other">Other</option>
                    </select>&nbsp;-&nbsp;<input type="text" id="txtSubject" name="Subject" value=""><br><br>
                    <div style="width: 10em; float: left"><label for="txtName">
                        Details:&nbsp;</label></div>
                    <textarea id="txtBody" name="Body" rows="1" cols="1"></textarea>
                    <br>
                    <br>
					<div style="padding-left: 220px; padding-right:50px">
                    <a class="redButton s11" href="javascript:document.frm.submit();">&nbsp;&nbsp;&nbsp;&nbsp;Send&nbsp;&nbsp;&nbsp;&nbsp;</a>&nbsp;&nbsp;<a href="javascript:window.close();" class="redButton s11">&nbsp;&nbsp;Cancel&nbsp;&nbsp;</a>
					</div>
                </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>

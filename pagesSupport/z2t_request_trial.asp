<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<!--#include virtual="/Website/includes/Config.asp"-->
<!--#include virtual="/Website/includes/Connection.asp"-->
<%
    Session("activePage") = "Support"
    Session("currentPage") = "z2t_request_trial.asp"
%>
<html>
<head>
    <title>Request A Free Trial - Zip2Tax</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="description" content="Request a free trial account today.">
    <!--#include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->
				<script language="javascript" src="/Website/includes/Javascript/z2t_functions.js" type="text/javascript"></script>

    <!--[if lt IE 8]>
    <link href="/includes/ie.css" rel="stylesheet" type="text/css">
<![endif]-->
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
      .red
      {
        color: Red;   
      }
    </style>
    <script type="text/javascript">
        function onSubmit() {
            var form = document.frm;
            if (form.Name.value == '' || form.Email.value == '' || form.Phone.value == '') {
                alert('You must fill in the required form variables, marked with a red star.');
            }
            else {
                form.submit();
            }
        }
    </script>
</head>
<body onload="resizeTo(700,900);" style="background: #FFF !important">
    <div id="content" class="NoPrint">
        <div class="post">
            <h1 class="title">
                Request A Free Trial</h1>
            <div class="entry">
                <div>
                    <img src="/Website/images/office_workers.jpg" alt="Office Workers"></div>
                <form method="post" action="z2t_send_request.asp" name="frm">
                  <label name="valid" style="color: Red; width: 20em; margin: 0 auto;">&nbsp;</label>
                <div style="width: 650px; height: 400px; margin-top: 10px; font-size: 10px; font-family: Arial; font-weight: bold">
                    <div style="width: 11em; float: left; text-align: right"><label for="txtName">
                        Name:&nbsp;</label></div>
                    <input type="text" id="txtName" name="Name" value="" style="float: left">&nbsp;<span class="red">*</span><br>
                    <br>
                    <div style="width: 11em; float: left; text-align: right"><label for="txtCompany">
                        Company Name:&nbsp;</label></div>
                    <input type="text" id="txtCompany" value="" name="Company"><br><br>
                    <div style="width: 11em; float: left; text-align: right"><label for="txtEmail">
                        E-mail:&nbsp;</label></div>
                    <input type="text" id="txtEmail" value="" name="Email">&nbsp;<span class="red">*</span><br><br>
                    <div style="width: 11em; float: left; text-align: right"><label for="txtEmail">
                        Phone Number:&nbsp;</label></div>
                    <input type="text" id="txtPhone" value="" name="Phone">&nbsp;<span class="red">*</span><br><br>
                    <div style="width: 11em; float: left; text-align: right"><label for="txtCC">
                        CC:&nbsp;</label></div>
                    <input type="text" id="txtCC" name="Copy" value=""><br><br>
                    <div style="width: 11em; float: left; text-align: right"><label for="rdoSubject">
                        Request:&nbsp;</label></div>
                    <div style="width: 13em; float: left; margin-left: .5em">Online Lookup<br>
                      <input id="rdoSubject" name="rdoSubject" value="Request Online Lookup ZIP Code Free Trial" type="radio">&nbsp;ZIP Code<br>
                      <input id="rdoSubject2" name="rdoSubject2" value="Request Online Lookup ZIP+4 Free Trial" type="radio">&nbsp;ZIP+4<br>
                      <input id="rdoSubject3" name="rdoSubject3" value="Request Online Lookup Spot-On&trade; Free Trial" type="radio">&nbsp;Spot-On&trade;<br>
                    </div>
                    <div style="width: 13em; float: left; margin-left: .5em">Database Interface<br>
                      <input id="rdoSubject4" name="rdoSubject4" value="Request Database Interface ZIP Code Free Trial" type="radio">&nbsp;ZIP Code<br>
                      <input id="rdoSubject5" name="rdoSubject5" value="Request Database Interface ZIP+4 Free Trial" type="radio">&nbsp;ZIP+4<br>
                      <input id="rdoSubject6" name="rdoSubject6" value="Request Database Interface Spot-On&trade; Free Trial" type="radio">&nbsp;Spot-On&trade;<br>
                    </div><div style="clear: both">&nbsp;</div>
                    <div style="width: 11em; float: left; text-align: right"><label for="txtName">Notes:&nbsp;</label></div>
                    <textarea id="txtBody" name="Body" rows="1" cols="1"></textarea>
                    <br>
                    <div style="width: 11em; float: left; text-align: right">&nbsp;</div><em><span class="red">* Required</span></em>
                    <br>
                    <br>
                    <a class="redButton w80" href="javascript:onSubmit();">Send</a>&nbsp;<a href="javascript:window.close();" class="redButton w80">Cancel</a>
                </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
<%
Function iif(condition, consequent, alternative)
    If condition Then iif=consequent Else iif=alternative
End Function
%>
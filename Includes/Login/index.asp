<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Home"
    Session("currentPage") = "index.asp"
%>

<html>
  <head>
    <title>Zip2Tax - Sales And Use Tax Rates For Commerce</title>
    <meta name="description" content="Sales Tax Solutions for business. The Zip2Tax Sales Tax Calculator Instantly Provides Sales And Use Tax Rates For Every Jurisdiction in the U.S. and Canada.">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="alexaVerifyID" content="ZrGRzT40DhWTOZrbyPZtTdBQQSI">
    <!--#include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->
    
    <script language="javascript" src="/Website/Includes/Javascript/page_home.js" type="text/javascript"></script>
     <script language="javascript" src="/Website/Includes/Javascript/z2t_Ajax.js" type="text/javascript"></script>
    
    <!--Start Optimizely $10 Gift Card A/B Experiment code only on Index.asp on Production Philly03 and Casper06-->
    <script type="text/javascript" src="//cdn.optimizely.com/js/1923140174.js"></script>
    <!--End Optimizely $10 Gift Code-->
<Script type="text/javascript" language="javascript">
// Free Trial Ajax Calls


function ftLogin(){
	//Part 1: Validate fields
	ftusernameval = document.getElementById('ftUsername').value;
	ftpasswordval = document.getElementById('ftPassword').value;
	if (ftusernameval.length < 1 || ftpasswordval.length <1)
	{
		alert('Invalid username or password');
		document.getElementById('ftUsername').focus();
		return false;
	}
	else
	{

		PostStr="lName="+ftusernameval+"&pass="+ftpasswordval;	
		
		url="website/Includes/login/login.asp?"+PostStr;
		document.frm.Action = url;
		document.frm.submit();
		//doAJAXCall(url,'GET',PostStr,ResponseSaved);
		
		
	}
	
}
function ResponseSaved(oXML){
	var response=oXML.response;
	alert (response);
}
//   Free Trial Login End
</script>    
  </head>
  
  <body>
      <!--#include virtual="/Website/Includes/BodyParts/BodyContent.inc"-->
      
    <div id="divMain">
      
      <div id="divPageTop">
        <!-- #include virtual="/Website/Includes/bodyParts/page_top.asp"-->
      </div><!-- divPageTop -->

      <div id="divPageMiddle">
        <div id="divPageLeft">
          <!-- #include virtual="/Website/pagesHome/Home/page_home_left_sidebar.asp" -->
        </div><!-- divPageLeft -->

        <div id="divPageCenter">
          <!-- #include virtual="/Website/pagesHome/Home/page_home_content.asp" -->
        </div><!-- divPageCenter -->

        <div id="divPageRight">
          <!-- #include virtual="/Website/pagesHome/Home/page_home_right_sidebar.asp" -->
        </div><!-- divPageRight -->
      </div><!-- divPageMiddle -->

      <div id="divPageBottom">
        <!-- #include virtual="/Website/Includes/bodyParts/footer.asp"-->
      </div><!-- divPageBottom -->
      
    </div><!-- main -->
	
    <img src="<%=pathImages%>red-arrow.png" id="MovingImage1" name="MovingImage1" onClick="clickImage();" alt="50 Free Lookups; 10/day" class="NoPrint">       
  </body>
</html>

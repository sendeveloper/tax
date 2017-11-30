<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Privacy"
    Session("currentPage") = "z2t_500_error_create.asp"
%>

<html>
<head>
    <title>500 Error Create - Zip2Tax</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="description" content="Learn more about zip2tax's refund policy and how we protect your information.">
	<!-- #include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->	
    <script language="javascript" src="/Website/Includes/Javascript/z2t_functions.js" type="text/javascript"></script>
	<script language="javascript" src="/Website/pagesExtra/RefundPolicy/page_refund_policy.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">
      var userName = '<%=Session("UserName")%>'
    </script>

	<style type="text/css">
	   
	   li.blankspace {
	     list-style-type: none;
		 margin-top: 2em;
	    }

	</style>
	
  </head>
  
  <body>
    <div id="divMain">
      
      <div id="divPageTop">
        <!-- #include virtual="/Website/Includes/bodyParts/page_top.asp"-->
      </div><!-- divPageTop -->
      

      <div id="divPageMiddle">
        <div id="divPageLeft">
          <!--#include virtual="/Website/pagesExtra/Errors/500/page_500_error_left_sidebar.asp" -->
        </div><!-- divPageLeft -->

        <div id="divPageCenter">
          <!-- #include virtual="/Website/pagesExtra/Errors/500/page_500_error_create_content.asp" -->
        </div><!-- divPageCenter -->

        <div id="divPageRight">
          <!--#include virtual="/Website/pagesExtra/Errors/500/page_500_error_right_sidebar.asp" -->
        </div><!-- divPageRight -->
      </div><!-- divPageMiddle -->

      
      <div id="divPageBottom">
        <!-- #include virtual="/Website/Includes/bodyParts/footer.asp"-->
      </div><!-- divPageBottom -->
      
    </div><!-- main -->
  </body>
</html>



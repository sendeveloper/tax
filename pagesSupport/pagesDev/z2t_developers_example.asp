<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Developers"
    Session("currentPage") = "developers/z2t_developers_example.asp"
    Session("devPage") = Request.QueryString("language")
%>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<!-- #include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->
    <meta name="robots" content="index,follow">	

    <!--#include virtual="/Website/Includes/BodyParts/newHeading.asp"-->

  </head>

  <body>
    <div id="divMain">


	  
      <div id="divPageMiddle">
        <div id="divPageLeft">
          <!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/page_developers_example_left_sidebar.asp"-->
        </div><!-- divPageLeft -->
		
        <div id="divPageCenter">
          <!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/page_developers_example_content.asp"-->
        </div><!-- divPageCenter -->
		
        <div id="divPageRight">
          <!--#include virtual="/Website/pagesSupport/Developers/Dev_Example/page_developers_example_right_sidebar.asp"-->
        </div><!-- divPageRight -->
      </div><!-- divPageMiddle -->

	  
      <div id="divPageBottom">
        <!--#include virtual="/Website/Includes/bodyParts/footer.asp"-->
      </div><!-- divPageBottom -->

    </div><!-- main -->
  </body>
</html>



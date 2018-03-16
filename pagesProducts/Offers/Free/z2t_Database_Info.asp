<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Services"
    Session("currentPage") = "z2t_Database_Info.asp"
	Session("ServicesURL") = "Free"
%>

<html>
  <head>
    <title>Database Interface Info - Zip2Tax</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="description" content="Explaination of subscription levels to help you match the right service to your needs - ZIP, ZIP+4, or Spot-On&trade;.">
	<!--#include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->	
     <meta name="robots" content="noindex,follow">
	
	<style>
	
		.redButton1
		{
		width: 120px;
		display: inline-block; 
		white-space: nowrap;
		font-weight: bold;
			font-family: "Trebuchet MS",Arial,Helvetica,sans-serif;
			color: #FFFFFF;
			line-height: 1em;
			text-align: center;
			vertical-align: middle;
			text-decoration: none;
		padding: 2px 4px;
		border: 2px solid;  /* remove to make yui action work again */
		border-color: #C0C0C0 #444444 #444444 #C0C0C0;   /* remove to make yui action work again */
			border-radius: 10px;
			-moz-border-radius: 10px;
			-webkit-border-radius: 10px;
			background-clip: border-box;
			background: #910707; /* Old browsers */
			/* IE9 SVG, needs conditional override of 'filter' to 'none' */
			/*background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI2ZlZmNlYSIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjU2JSIgc3RvcC1jb2xvcj0iI2ZmZmZhYSIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiNmZmZmZmYiIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);*/
			background: -moz-linear-gradient(top, #ED2828, #910707); /* FF3.6+ */
			background: -webkit-gradient(linear, left top, left bottom, color-stop(#ED2828), color-stop(#910707)); /* Chrome,Safari4+ */
			background: -webkit-linear-gradient(top, #ED2828, #910707); /* Chrome10+,Safari5.1+ */
			background: -o-linear-gradient(top, #ED2828, #910707); /* Opera 11.10+ */
			background: -ms-linear-gradient(top,  #ED2828, #910707); /* IE10+ */
			background: linear-gradient(to bottom, #ED2828, #910707); /* W3C */
			/*filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#910707', endColorstr='#ED2828',GradientType=0 );*/ /* IE6-8 */
		}
	
		.redButton1.s11
		{
			
			font-size: 11px;
		}
		
		.redButton1:hover {
		background: #731317;
		color: #C0C0C0;
		}
		
		.redButton.s20
	{
		font-size: 20px;
		border-radius: 30px;
        -moz-border-radius: 30px;
        -webkit-border-radius: 30px;
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
          <!--#include virtual="/Website/pagesProducts/Offers/Free/DatabaseInfo/page_database_info_left_sidebar.asp" -->
        </div><!-- divPageLeft -->
		
        <div id="divPageCenter">
          <!--#include virtual="/Website/pagesProducts/Offers/Free/DatabaseInfo/page_database_info_content.asp" -->
        </div><!-- divPageCenter -->
		
        <div id="divPageRight">
          <!--#include virtual="/Website/pagesProducts/Offers/Free/DatabaseInfo/page_database_info_right_sidebar.asp" -->
        </div><!-- divPageRight -->
      </div><!-- divPageMiddle -->

	  
      <div id="divPageBottom">
        <!-- #include virtual="/Website/Includes/bodyParts/footer.asp"-->
      </div><!-- divPageBottom -->

    </div><!-- main -->
  </body>
</html>



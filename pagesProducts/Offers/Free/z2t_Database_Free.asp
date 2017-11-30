<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "DatabaseFree"
    Session("currentPage") = "z2t_Database_Free.asp"
	Session("ServicesURL") = "Free"
%>

<html>
  <head>
    <title>Database Free Trial - Zip2Tax</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="description" content="Get your Database trial free for 30 days.  Get instant up-to-date sales tax rates for the locations
	you need, when you need them.">
    <!-- #include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->	
        <meta name="robots" content="noindex,follow">
    <script language="javascript" src="/Website/Includes/Javascript/z2t_UserTrackingPost.js" type="text/javascript"></script>
	<script language="javascript" src="/Website/pagesProducts/Offers/Free/DatabaseFree/page_database_free.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">
    var userName = '<%=Session("UserName")%>';
    var ProductID = 0;
    var TaxType = '';
    var TableFormat = '';
</script>

<style type="text/css">
	
.redButton.s50
	{
		font-size: 50px;
		border-radius: 30px;
        -moz-border-radius: 30px;
        -webkit-border-radius: 30px;
		vertical-align: middle;
	}

.redButton.s35
	{
		font-size: 35px;
		border-radius: 30px;
        -moz-border-radius: 30px;
        -webkit-border-radius: 30px;
	}
	
.redButton.s20
	{
		font-size: 20px;
		border-radius: 30px;
        -moz-border-radius: 30px;
        -webkit-border-radius: 30px;
	}
	
.divPageCenter
	{
        display: inline-block;
        white-space: normal;
	    overflow: visible;
        vertical-align: top;
	    width: 895px;
	}

.content
    {
		display: inline-block;
        float: left;
        width: 895px;
		vertical-align: top;
		padding-left: 20px;
		overflow: visible;
    }

.contentright
    {
        float: left;
        width: 775px;
		vertical-align: top;
		text-align: right;
    }

.leftside
	{
		display: inline-block;
		width: 400px;
		vertical-align: middle;
		padding-left: 0px;
	}

.rightside
	{
		display:inline-block;
		width: 450px;
		vertical-align: top;
	}

.rightsidetop
	{
		width: 445px;
		vertical-align: top;
	}

.rightsidebottom
	{
		width: 390px;
		padding-left: 45px;
		vertical-align: top;
	}
	
.checkmark
	{
		display: inline-block;
		width: 50px;
		vertical-align: top;
	}

p   
	{
		margin: 0px;
		padding: 0px;
	}

.fontsize1
	{
		font-size: 18px;
		margin: 0px;
		padding: 0px;
	}

.fontsize2
	{
		font-size: 10px;
	}

.fontsize3
	{
		font-size: 30px;
	}

.fontsize4
	{
		font-size: 20px;
		margin: 0px;
		padding: 0px;
	}
	
.fontsize5
	{
		font-size: 16px;
		margin: 0px;
		padding: 0px;
	}
	
.firstword1
	{
		color: red !important;
		font-weight: bold;
		font-size: 18px;
	}

	
	
	
</style>

  </head>

  <body>
    <div id="divMain">

      <div id="divPageTop">
        <!--#include virtual="/Website/Includes/bodyParts/page_top.asp"-->
      </div><!-- divPageTop -->

	  
      
        <div id="divPageLeft">
          <!--#include virtual="/Website/pagesProducts/Offers/Free/DatabaseFree/page_database_free_left_sidebar.asp" -->
        </div><!-- divPageLeft -->
		
        <div class="divPageCenter">
          <!--#include virtual="/Website/pagesProducts/Offers/Free/DatabaseFree/page_database_free_content.asp" -->
        </div><!-- divPageCenter -->
		
 
      <div id="divPageBottom">
        <!--#include virtual="/Website/Includes/bodyParts/footer.asp"-->
      </div><!-- divPageBottom -->

    </div><!-- main -->
   
  </body>
</html>

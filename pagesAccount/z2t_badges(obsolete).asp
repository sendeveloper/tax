<!doctype html>
<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->
<!--#include virtual="/Website/Includes/z2t_userSubscriptions.asp"-->
<%
    Session("activePage") = "Badges"
    Session("acctPage") = "Downloadable Badges"
    Session("currentPage") = "z2t_badges.asp"
%>

<%  '17 Jan 2017 - Humair - Commented line below in order to move this page under support tab and allow open access to it
    'If Session("z2t_loggedin") = "" Then Server.Transfer("/index.asp")   
%>

<html>
  <head>
    <title>Account Badges - Zip2Tax</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="description" content="Post a Zip2Tax badge on your web site to assure customers they are getting accurate tax rates.">
	<!-- #include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->	
    <script language="javascript" src="/Website/Includes/Javascript/z2t_functions.js" type="text/javascript"></script>
	<script language="javascript" src="/Website/pagesAccount/Badges/page_badges.js" type="text/javascript"></script>
	
<!--    <link href="/Website/Includes/css/z2t_screen-no.css" rel="stylesheet" type="text/css" media="screen"> -->

<!--[if IE]>
    <link href="/Website/Includes/css/z2t_screen_ie.css" rel"stylesheet" type="text/css" media="screen">
<![endif]-->
<script type="text/javascript">
    window.fCopyToClipboard = function (rSource) {
        rSource.select();
        if (window.clipboardData) {
            var r = clipboardData.setData('Text', rSource.value);
            return 1;
        }
        else {
            return 0;
        }
    }

    function ShowCode(text, textarea, linkid) {
        var txt, link;
        txt = document.getElementById(textarea);
        txt.style.display = 'block';
        txt.value = text;
    }

    function showOptions(id, taid) {
        var div = document.getElementById(id);
        var textareaid = document.getElementById(taid);
        if (div.style.display === 'none') {
            div.style.display = 'block';
        }
        else {
            div.style.display = 'none';
            textareaid.value = '';
            textareaid.style.display = 'none';
        }
    }

</script>
<style type="text/css">
    .codebox
    {
        width: 55%;
        border: 1px solid Black;
        overflow-y: scroll;
        height: 8em;
        resize: none;
        float: right;
    }

    ul li
    {
        list-style-type: none;
    }

    div.preview
    {
        width: 28em;
        height: 15em;
        background-color: White;
        border: 1px solid Black;
    }

    div.topbox
    {
        height: 12em;
        text-align: center;
    }

    div.lowerbox
    {
        width: 100%;
    }
</style>

  </head>

  <body>
    <div id="divMain">

      <div id="divPageTop">
        <!--#include virtual="/Website/Includes/bodyParts/page_top.asp"-->
      </div><!-- divPageTop -->

	  
      <div id="divPageMiddle">
        <div id="divPageLeft">
          <!--#include virtual="/Website/pagesAccount/Badges/page_badges_left_sidebar.asp" -->
       </div><!-- divPageLeft -->
	   
        <div id="divPageCenter">
           <!--#include virtual="/Website/pagesAccount/Badges/page_badges_content.asp"-->
        </div><!-- divPageCenter -->
		
        <div id="divPageRight">
          <!--#include virtual="/Website/pagesAccount/Badges/page_badges_right_sidebar.asp" -->
        </div><!-- divPageRight -->
      </div><!-- divPageMiddle -->
      
	  
      <div id="divPageBottom">
        <!--#include virtual="/Website/Includes/bodyParts/footer.asp"-->
      </div><!-- divPageBottom -->
      
    </div><!-- main -->
  </body>
</html>

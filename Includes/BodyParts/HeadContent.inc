<!-- Start of HeadContent.inc -->
	<!--#include virtual="/website/Includes/BodyParts/PageTitles.asp"-->
	
	<meta content="text/html;charset=utf-8" http-equiv="Content-Type">
	
<%
	If PageTitle <> "" Then
		Response.write "<title>" & PageTitle & "</title>" & vbCrLf
	End If
	
	If PageKeyword <> "" Then
		Response.write "	<meta name='keywords' content='" & PageKeyword & "'>" & vbCrLf
	End If
	
	If PageDescription <> "" Then
		Response.write "	<meta name='description' content='" & PageDescription & "'>" & vbCrLf
	End If
%>
	
    <%=RobotInstruction%>
    <meta name="msvalidate.01" content="7522215D17685F929393A5441F8425A3" />	
    <meta name="verify-v1" content="q0BWCUmQlxYKPjY3G4LpF0lihwZNVwzrEDOWMV4BjpQ=">
    <meta name="alexaVerifyID" content="ZrGRzT40DhWTOZrbyPZtTdBQQSI">
	<meta name="google-site-verification" content="HAu4zuX5WCR_KP-XjBoc7hPWToTXnljC1H9qfIOM6u8" />

<%
	If Request("currentPagePath") > "" Then
		Session("currentPagePath") = Request("currentPagePath")
	End If
%>

<!--#include virtual="/Website/Includes/Login/logout.asp"-->
<!--#include virtual="/Website/Includes/Login/login.asp"-->

<%
	'If login redirects, you won't be here
	If Request.ServerVariables("URL") <> "/Website/pagesExtra/z2t_404_error.asp" Then
		Session("currentPagePath") = Request.ServerVariables("URL")
	End If
	
	
%>

            <script type="text/javascript">
                var pathBase = '<%=pathBase%>';
                var currentPage = '<%=Session("currentPage")%>';
                var currentPagePath = pathBase.replace(/\/$/,'') + '<%=Session("currentPagePath")%>';
                var errorMessage = '<%=Session("LoginErrorUrgent")%>';  
                var NewUser = '<%=Session("NewUser")%>';
    	        var PageKeyWords = '<%=PageKeyWords%>';
                var userName = '<%=Session("UserName")%>';
            </script>

            <!--CSS-->
                <noscript id="deferred-styles">
                    <link rel="stylesheet" type="text/css" href="/Website/Includes/CSS/z2t_screen.css"/>
                </noscript>
                <link type="text/css" href="/Website/Includes/CSS/z2t_print.css" rel="stylesheet" media="print">

            <!--[if lt IE 8]>
            	<link href="/Website/includes/css/z2t_screen_ie_lt8.css" rel="stylesheet" type="text/css">
            <![endif]-->

            <!--[if gt IE 8]>
            	<link href="/Website/includes/css/z2t_screen_ie.css" rel="stylesheet" type="text/css">
            <![endif]-->

            <!--[if IE 8]>
            	<link href="/Website/includes/css/z2t_screen_ie.css" rel="stylesheet" type="text/css">
            <![endif]-->

            <!--Google Analytics-->
            <script type="text/javascript">
              (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
              (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
              m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
              })(window,document,'script','/js/analytics.js','ga');

              ga('create', 'UA-8941943-2', 'auto', {'allowLinker': true});
              ga('require', 'linker');
              ga('linker:autoLink', ['ewebcart.com'] );
              ga('send', 'pageview');
            </script>

            <!-- Place this render call where appropriate -->
            <script type="text/javascript">
                var loadDeferredStyles = function() {
                    var addStylesNode = document.getElementById("deferred-styles");
                    var replacement = document.createElement("div");
                    replacement.innerHTML = addStylesNode.textContent;
                    document.body.appendChild(replacement)
                    addStylesNode.parentElement.removeChild(addStylesNode);
                };
                var raf = requestAnimationFrame || mozRequestAnimationFrame ||
                  webkitRequestAnimationFrame || msRequestAnimationFrame;
                if (raf) raf(function() { window.setTimeout(loadDeferredStyles, 0); });
                else window.addEventListener('load', loadDeferredStyles);
                // google
                (function() {
                    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
                    po.src = '/js/plusone.js';
                    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);})();
            </script>
            <script src='/js/jquery.min.js'></script>
        <!-- End of HeadContent.inc -->
	

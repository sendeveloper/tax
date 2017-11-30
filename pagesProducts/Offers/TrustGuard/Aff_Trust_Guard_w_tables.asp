<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Services"
    Session("currentPage") = "z2t_services_free.asp"
	Session("ServicesURL") = "Free"
%>

<html>
  <head>
    <title>Zip2Tax Affiliate | Trust Guard</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="description" content="Free Trial Services Offer.">
	<!-- #include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->	
    <script language="javascript" src="/Website/Includes/Javascript/z2t_functions.js" type="text/javascript"></script>
    <script language="javascript" src="/Website/Includes/Javascript/z2t_UserTrackingPost.js" type="text/javascript"></script>
	<script language="javascript" src="/Website/pagesProducts/Offers/TrustGuard/AffTrustGuard/page_aff_trust_guard.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">
    var userName = '<%=Session("UserName")%>';
    var ProductID = 0;
    var TaxType = '';
    var TableFormat = '';
</script>

  </head>

  <body>
    <div id="divMain">

      <div id="divPageTop">
        <!--#include virtual="/Website/Includes/bodyParts/page_top.asp"-->
      </div><!-- divPageTop -->

	  
      <div id="divPageMiddle">
        <div id="divPageLeft">
          <!--#include virtual="/Website/pagesProducts/Offers/TrustGuard/AffTrustGuard/page_aff_trust_guard_left_sidebar.asp"-->
        </div><!-- divPageLeft -->
		
        <div id="divPageCenter">
          <!--#include virtual="/Website/pagesProducts/Offers/TrustGuard/AffTrustGuard/page_aff_trust_guard_content_w_tables.asp" -->
        </div><!-- divPageCenter -->
		
        <div id="divPageRight">
          <!--#include virtual="/Website/pagesProducts/Offers/TrustGuard/AffTrustGuard/page_aff_trust_guard_right_sidebar.asp"-->
        </div><!-- divPageRight -->
      </div><!-- divPageMiddle -->

	  
      <div id="divPageBottom">
        <!--#include virtual="/Website/Includes/bodyParts/footer.asp"-->
      </div><!-- divPageBottom -->

    </div><!-- main -->
    
    
  </body>
</html>

<!doctype html>

<!--#include virtual="/website/includes/Config.asp"-->
<!--#include virtual="/website/includes/Connection.asp"-->

<%
    Session("activePage") = "customer_commitment"
    Session("currentPage") = "z2t_customer_commitment.asp"
%>

<html>
    <head>
        <!--#include virtual="/Website/Includes/BodyParts/HeadingCommonContent.asp"-->
	   <script language="javascript" src="/Website/Includes/Javascript/page_customer_commitment.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container-fluid" style="padding: 0px;">
            <!--#include virtual="/Website/Includes/BodyParts/Heading.asp"-->
            <!--#include virtual="/Website/Includes/BodyParts/HeadingMenuBar.asp"-->
          
            <div class="mainBody">
                <div class="clearfix"></div>
                <div class="container"> 
            		<!-- #include virtual="/Website/pagesHome/CustomerCommitment/page_customer_commitment_content.asp" -->
                    <!-- #include virtual="/Website/pagesHome/CustomerCommitment/page_customer_commitment_right_sidebar.asp" -->
                </div>
            </div>
            <!--#include virtual="/Website/Includes/BodyParts/Footer.asp"-->
            <!--#include virtual="/Website/Includes/BodyParts/FooterCommonContent.asp"-->   
        </div>
    </body>
</html>


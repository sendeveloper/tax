<!--#include virtual="/Website/Includes/Config.asp"-->
<!--I'm not sure why there is a separate Commection-api.asp? but using it for now-->
<!--#include virtual="/Website/Includes/Connection-api.asp"-->
<!--I'm not sure why there is a separate logout-no.asp? but using it for now-->
<!--#include virtual="/Website/Includes/Login/logout-no.asp"-->
<!--#include virtual="/Website/Includes/Login/login.asp"-->
<!--It turns out userSubscriptions.asp is a shared file so it should be indide includes but keeping it where it is for now-->>
<!--#include virtual="/Website/pagesTaxRates/LookupZipCode/z2t_userSubscriptions.asp"-->

<%
    Response.buffer = True

    Session("activePage") = "Lookup"
    Session("currentPage") = mid(Request.ServerVariables("URL"), 2, cint(len(Request.ServerVariables("URL"))) - 1) ' Remove preceding /
%>

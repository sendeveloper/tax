<%
  ' ----- config.asp specifically for dev on Capser09 -----
  ' In this file are settings that are specific to the location of this website.
  ' All other files throughout the Zip2Tax website are identical except for this one.
 

  ' Humair: 12May2016, Made the code generic to make it common accross all website, before that links were hard coded and were causing problem especailly for west, east and live site
Dim protocol:  protocol = "http://" 
If lcase(request.ServerVariables("HTTPS"))<> "off" Then 
   protocol = "https://" 
End If

 ' ----- Path strings -----
  Dim pathBase:       pathBase       = protocol & Request.ServerVariables("server_name") & "/"
  Dim pathWebsite:    pathWebsite    = pathBase & "Website/"
  Dim pathImages:     pathImages     = pathBase & "Website/Images/"
  Dim pathIncludes:   pathIncludes   = pathBase & "Website/Includes/"
  Dim pathBodyParts:  pathBodyParts  = pathBase & "Website/Includes/BodyParts/"
  Dim pathBodyPages:  pathBodyPages  = pathBase & "Website/Includes/BodyPages/"
  Dim pathJavaScript: pathJavaScript = pathBase & "Website/Includes/JavaScript/"
  Dim pathLookupAPI
  

	pathLookupAPI = Replace(Lcase(pathBase),"http://www.","https://") 'IF http://www.zip2tax.com then API path will have HTTPS and WWW will be removed.
	pathLookupAPI = Replace(Lcase(pathBase),"https://www.","https://") 'IF already https, then just remove www. from it
    pathLookupAPI  = Replace(pathLookupAPI,"zip2tax","api.zip2tax")  ' In second step we will replace zip2tax with api.zip2tax.com
	pathLookupAPI  = Replace(pathLookupAPI,"dev.api","casper09-api.zip2tax")  ' In second step we will replace zip2tax with api.zip2tax.com
	'So after above two steps , new live UR will be https://api.zip2tax.com/
	'While other links will become: e.g http://dev.zip2tax.com --> http://dev.api.zip2tax.com   
									   'http://frank02.zip2tax.com  --> http://frank02.api.zip2tax.com
			pathLookupAPI = "http://frank02-api.zip2tax.com/"						   
'	response.write pathLookupAPI & "<br>"
  
  ' ----- Robot Instructions -----
  ' Only follow on Philly03 production, no other sites regardless if production or not
  ' RobotInstruction = "<meta name='robots' content='index,follow'>"
  ' All others do not follow
  Dim RobotInstruction
  RobotInstruction = "<meta name='robots' content='noindex,nofollow'>"

  ' ----- Credit Card Processing -----
  ' This variable chooses between our Live or our Development credit card processing sites
  ' Its being used in : \Website\Includes\OnlineInvoice\boOrderView.asp Line 846
  ' and On footer of each page: \Website\Includes\BodyParts\footer.asp
  
  Dim CreditCardProcessing
  CreditCardProcessing = "CCTest"
  Dim CyberSourceBasePath
  CyberSourceBasePath = pathBase 
  ' added this variable for philly03, as on philly03 php is not installed, so we have to call west.zip2tax.com for this purpose
  
  
  ' ----- Connection Strings -----
  Dim connStrPublic
  Dim connStrHAProd
  Dim connStrBackoffice
  Dim connStrRequestVariables
  
  ' ----- Identify Environment -----
  Dim strWebService, strDatabase
  strWebService = "Casper09"
  strDatabase = "Casper09"
  
  '------ Server Port Comes Here -----------'
  'For Dev its Casper09, which is 7943
  Dim strPort
  strPort = ",7943;"

  
  ' Dev
  'connStrPublic = "Provider=SQLOLEDB;Data Source=66.119.50.229,7943;Initial Catalog=z2t_WebPublic;UID=z2t_WebUser;PWD=WebUser_z2t;Application Name=Z2T_V2.5;" 'Casper09
  connStrPublic = "Provider=SQLOLEDB;Data Source=66.119.50.229,7943;Initial Catalog=z2t_WebPublic;UID=davewj2o;PWD=get2it;Application Name=Z2T_V2.5;" 'Casper09

  ' Staging
  'connStrPublic = "Provider=SQLOLEDB;Data Source=10.88.49.22;Initial Catalog=z2t_WebPublic;UID=z2t_WebUser;PWD=WebUser_z2t;Application Name=Z2T_V2.5;" 'Philly05

  ' West
  'connStrPublic = "Provider=SQLOLEDB;Data Source=127.0.0.1;Initial Catalog=z2t_WebPublic;UID=z2t_WebUser;PWD=WebUser_z2t;Application Name=Z2T_V2.5;" 'Casper06

  ' Production
  'connStrPublic = "Provider=SQLOLEDB;Data Source=10.88.49.20;Initial Catalog=z2t_WebPublic;UID=z2t_WebUser;PWD=WebUser_z2t;Application Name=Z2T_V2.5;" 'Philly03

  ' local
  'connStrPublic = "Provider=SQLOLEDB;Data Source=127.0.0.1;Initial Catalog=z2t_WebPublic;UID=z2t_WebUser;PWD=WebUser_z2t;Application Name=Z2T_V2.5;" 'localhost
  
  ' At the moment, Harvest Accounts are in the same database as everything else so these equal
  connStrHAProd = connStrPublic
   

  'Dev & West
  connStrBackoffice = "driver=SQL Server;server=208.88.49.22,8543;uid=davewj2o;pwd=get2it;database=z2t_BackOffice" ' philly05

  'Staging
  'connStrBackoffice = "driver=SQL Server;server=127.0.0.1;uid=davewj2o;pwd=get2it;database=z2t_BackOffice" ' philly05

  'Production
  'connStrBackoffice = "driver=SQL Server;server=10.88.49.22,8543;uid=davewj2o;pwd=get2it;database=z2t_BackOffice" ' philly05



  'Dev   
  connStrRequestVariables = "driver=SQL Server;server=66.119.50.229,7943;uid=davewj2o;pwd=get2it;database=z2t_WebPublic" ' Casper09
  connStrRequestVariables = "driver=SQL Server;server=127.0.0.1,7943;uid=davewj2o;pwd=get2it;database=z2t_WebPublic" ' Casper09
   
  'Staging   
  'connStrRequestVariables = "driver=SQL Server;server=localhost;uid=davewj2o;pwd=get2it;database=z2t_WebPublic" ' Philly05

  'Production & West
  'connStrRequestVariables = "driver=SQL Server;server=127.0.0.1,8343;uid=davewj2o;pwd=get2it;database=z2t_WebPublic" ' Philly03

%>


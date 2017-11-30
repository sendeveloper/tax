<%
  Dim strPath
  Dim strBasePath
  Dim strPathIncludes
  Dim strPathImages
  Dim strPathDates

  strPath = "http://dev.Zip2Tax.com/"
  strBasePath = strPath & "BackOffice/"
  strPathIncludes = strBasePath & "includes/"
  strPathImages = strBasePath & "images/"
  strPathDates = strBasePath & "includes/dates/"

%>

<script language="javascript" type="text/javascript">
    var strBasePath = '<%=strBasePath%>';
    var strPathIncludes = '<%=strPathIncludes%>';
    var strPathImages = '<%=strPathImages%>';
</script>

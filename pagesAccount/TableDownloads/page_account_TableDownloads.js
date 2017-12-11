

    function clickDownload(type, state, clothed, a)
        {
        var URL = "http://download.zip2tax.com/download/download.asp" +
                   "?id=<%=z2tID%>" +
                   "&user=<%=Session("z2t_UserName")%>" +
                   "&type=" + type + //download[i][sales] +
                   "&c=" + clothed +
                   "&state=" + state + //download[i][state] +
                   "&date=" + "<%=Right("0000" & year(viewDate), 4) & "-" & Right("00" & month(viewDate), 2)%>" +
                   "&a=<%=AuthToken%>";
        openPopUp(URL, 800, 600);
        window.location.reload();
        }
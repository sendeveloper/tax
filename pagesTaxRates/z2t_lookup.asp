<!doctype html>
<html>

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<!--#include virtual="/Website/pagesTaxRates/LookupZipCode/z2t_userSubscriptions.asp"-->
<!--#include virtual="/Website/pagesTaxRates/LookupZipCode/sql-dev.asp"-->

<%
    Response.buffer = True

    Session("activePage") = "Lookup"
    Session("currentPage") = mid(Request.ServerVariables("URL"), 2, cint(len(Request.ServerVariables("URL"))) - 1) ' Remove preceding /
%>
<!--#include virtual="/Website/pagesTaxRates/LookupZipCode/classes.asp"-->

  <head>
    <!--#include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->	
    <!--#include virtual="/Website/Includes/BodyParts/newHeading.asp"-->
    <script language="javascript" type="text/javascript">
	$(function(){
	<%if len(request.servervariables("query_string"))>0 then%>
	initialize()
	<%end if%>
		});
        var pathBase = '<%=pathBase%>';
        var currentPage = '<%=Session("currentPage")%>';
        var errorMessage = '<%=Session("LoginErrorUrgent")%>';
        var userName = '<%=Session("UserName")%>';
        var totalrate = '<%=LookupResults.SalesRate%>';

        function altOn(obj, t, b, e)
        {
		/*
            if ( (totalrate != '') && (parseInt(totalrate) > 0) )
            {
                var altScreen = document.getElementById('mouseoverDiv');
                var cursor = getPosition(e);

                //altScreen.style.top = (cursor.y - 20) + 'px';
                if (cursor.x < 700)
                {
                    //altScreen.style.left = (cursor.x + 100) + 'px';
                }
                else
                {
                    //altScreen.style.left = (cursor.x - 400) + 'px';
                }

                //document.getElementById('mouseoverTitle').innerHTML = t;

                b = b.replace(/~/g,"<br>");
                b = b.replace('<TD total','<TD Style="border-top: 1px solid #C0C0C0;"');
                b = b.replace('<TD total','<TD Style="border-top: 1px solid #C0C0C0;"');
                b = b.replace('<TD total','<TD Style="border-top: 1px solid #C0C0C0;"');
                document.getElementById('mouseoverBody').innerHTML = b

                altScreen.style.visibility = 'visible';
            }
			*/
        }

        function altOff()
        {
           // document.getElementById('mouseoverDiv').style.visibility = 'hidden';
        }

        function blurField(f) {
            if (f == 'zip') {
                /*
                   if (zLen == 5)
                       {
                       var URL = '<%=pathBase%>' + currentPage +
                           '?inputZip=' + document.getElementById('inputZip').value;
                       window.document.location = URL;
                       }
                   else if (zLen != 0)
                       {
                       alert('ZIP Code must have 5 numerals');
                       }
                */
            }}


        function clickGetRate() {
			
			 <%
			   If Session("z2t_loggedin") <> "True"  Then
			 %>
			 		 div_show(1);
			 <%
			 Else 
			 %>
            var zLen = document.getElementById('inputZip').value.length
            if (zLen == 5) {
                var URL = '<%=pathBase%>' + currentPage + '?inputZip=' + document.getElementById('inputZip').value;
                window.document.location = URL;}
            else if (zLen != 0) {
                alert('ZIP Code must have 5 numerals');}
				
				<%End If%>
				}


        function clickGetTax(f) {
			
			
			 <%
			   If Session("z2t_loggedin") <> "True"  Then
			 %>
			 		 div_show(1);
			 <%
			 Else 
			 %>
            //   if ((f == 'amt') || (f == 'useTax')) {
            if (f == 'calc') {
                if ((document.getElementById('inputAmt').value.length > 0) && (document.getElementById('inputAmt').value !== 'Enter Dollar Amount')) {
                    if ('<%=LookupResults.BreakoutHTML%>' === '') {
                        alert('To calculate the tax, first you must enter a ZIP code.')}
                    else {
                        getTax(f);
                        document.getElementById('inputAmt').value = 'Enter Dollar Amount';}}}
			<%End If%>
			}

        function focusField(f)
        {
            foc=f;
        }

        function formLoad()
        {
            //document.getElementById('JavaScriptTest').innerHTML = 'Pass';
            if (errorMessage > '')
            {
                alert(errorMessage);
            }
            //document.getElementById('inputZip').focus();
        }

        function getTax(taxType)
        {
            var amt = RoundUp(Number(document.getElementById('inputAmt').value));
            if(isNaN(amt))
            { amt = 0; }

            if (amt == 0)
            {
                amt = parseFloat(document.getElementById('result_amt').innerHTML);
            }

            if(isNaN(amt))
            { amt = 0; }

            if (amt == 0)
            {
                document.getElementById('result_amt').innerHTML = formatCurrency(0,'');
                document.getElementById('result_tax').innerHTML = formatCurrency(0,'');
                document.getElementById('result_tsale').innerHTML = formatCurrency(0,'');
                //document.getElementById('inputAmt').focus();
                //starting of use tax fields
                if (document.getElementById('use_result_tax') != null) {
                    document.getElementById('use_result_amt').innerHTML = formatCurrency(0, '');
                    document.getElementById('use_result_tax').innerHTML = formatCurrency(0, '');
                    document.getElementById('use_result_tsale').innerHTML = formatCurrency(0, '');
                }
            }
            else
            {
                document.getElementById('result_amt').innerHTML = formatCurrency(amt, '$');

                if (document.getElementById('use_result_tax') != null) {
                    document.getElementById('use_result_amt').innerHTML = formatCurrency(amt, '$');
                }

                data1 = amt;
                var r;
                var use_r;

                //            if (taxType == 'amt') { // Sales tax
                //                r = parseFloat(document.getElementById('result_rate').innerHTML);
                //                document.getElementById('result_taxlable').innerHTML = "<b>Sales&nbsp;Tax:<\/b>";
                //            }
                //            else { // Use Tax
                //                r = parseFloat(document.getElementById('use_rate').innerHTML);
                //                document.getElementById('result_taxlable').innerHTML = "<b>Use&nbsp;Tax:\<b>";
                //            }

                if (taxType == 'calc') { // Calculate Sales and Use Tax
                    r = parseFloat(document.getElementById('result_rate').innerHTML);

                    if (document.getElementById('use_result_tax') != null) {
                        use_r = parseFloat(document.getElementById('use_rate').innerHTML);
                    }

                }
            
                var tot = RoundUp(Number(amt * r) / 100);
                data2 = tot;
                document.getElementById('result_tax').innerHTML = formatCurrency(tot, '');
                tot += RoundUp(Number(amt));
                document.getElementById('result_tsale').innerHTML = formatCurrency(tot, '$');

                if (document.getElementById('use_result_tax') != null) {
                    var use_tot = RoundUp(Number(amt * use_r) / 100);
                    document.getElementById('use_result_tax').innerHTML = formatCurrency(use_tot, '');
                    use_tot += RoundUp(Number(amt));
                    document.getElementById('use_result_tsale').innerHTML = formatCurrency(use_tot, '$');
                }

                document.getElementById('inputAmt').value = '';
                //document.getElementById('inputAmt').focus();
            
            
                //z2t_UserTracking('5', currentPage, data1, data2);

                var state = document.getElementById('result_state').innerHTML;
                if (state == 'FL' && amt > 5000 && r > 6)
                {
                    var remRetail = amt - 5000
                    var msg ='Attention Sales Within Florida!\n\n' +
                      'Counties in FL are authorized to levy surtax. Only the first $5,000 of a single sale of tangible\n' +
                      'personal property is subjected to the sales surtax. Any amounts over $5,000 are taxed at the\n' +
                      'state rate of 6%.\n\n' +
                      'If this case exists for you then the ' + formatCurrency(amt,'$') + ' ' +
                      'sale should be charged a total tax of ' +
                      formatCurrency(RoundUp(RoundUp(Number(r * 5000) + RoundUp(6 * remRetail))/100),'$') + '.';
                    alert(msg);
                }
            }
        }

        function numbersonly(myfield, e, dec)
        {
            var key;
            var keychar;

            if (window.event != null)
            {
                key = window.event.keyCode;
            }
            else if (e != null)
            {
                key = e.which;
            }
            else
            {
                return true;
            }

            keychar = String.fromCharCode(key);

            // Enter key hit
            if (key == 13) {
				
				<%
			   If Session("z2t_loggedin") <> "True"  Then
			 %>
			 		 div_show(1);
			 <%
			 Else 
			 %>
                foc = myfield.id.toString();
                //document.getElementById('inputAmt').focus();
                if (foc == 'inputAmt')
                {
                    //causes getTax() to fire
                    //document.getElementById('inputZip').focus();
                    clickGetTax('calc');
                    myfield.blur();
                }
                else
                {
                    //causes getRate() to fire
                    //document.getElementById('inputAmt').focus();
                    var zLen = document.getElementById('inputZip').value.length
                    if (zLen == 5)
                    {
                        var URL = '<%=pathBase%>' + currentPage +
                            '?inputZip=' + document.getElementById('inputZip').value;
                        window.document.location = URL;
                    }
                    else if (zLen != 0)
                    {
                        alert('Zip Code must have 5 numerals');
                    }
                } 
			<% End IF %>
            }

            // control keys
            if ((key==null) || (key==0) || (key==8) ||
                (key==9) || (key==27) )
                return true;

                // numbers
            else if ((("0123456789").indexOf(keychar) > -1))
                return true;

                // decimal point jump
            else if (dec && (keychar == "."))
            {
                return true;
            }
            else
                return false;
        }

        function RoundUp(num)
        {
            num += .0005
            return Math.round(num*100)/100
        }

        function formatCurrency(num, dsign)
        {
            num = num.toString().replace(/\$|\,/g,'');
            if(isNaN(num))
                num = "0";
            sign = (num == (num = Math.abs(num)));
            num = Math.floor(num*100+0.50000000001);
            cents = num%100;
            num = Math.floor(num/100).toString();
            if(cents<10)
                cents = "0" + cents;
            for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
                num = num.substring(0,num.length-(4*i+3))+','+
                num.substring(num.length-(4*i+3));
            return (((sign)?'':'-') + dsign + num + '.' + cents);
        }

        window.onload=formLoad;
    </script>
    <script type="text/javascript" src="/Website/pagesTaxRates/LookupZipCode/switchcontent.js" ></script>
    <script type="text/javascript" src="/Website/pagesTaxRates/LookupZipCode/switchicon.js"></script>
    <script type="text/javascript" src="/Website/pagesTaxRates/LookupZipCode/map.js"></script>
    <style type="text/css">
	.container-fluid {padding:0 !important}
        /*Default style for SPAN icons. Edit if desired: */

        .iconspan{
        float: right;
        margin: 3px;
        cursor:hand;
        cursor:pointer;
        font-weight: bold;
        }

        /*CSS used to style the examples. Remove if desired: */

        .eg-bar{
        background-color: #FFFFFF;
        font-weight: bold;
        padding: 3px;
        }

        div.eg-bar{
        width: 500px;
        }

        .icongroup1{
        width: 500px;
        }
        
        table#salestax_breakout, table#usetaxbreakout {border: none !important; width: 100% !important;}
		#map_canvas2 { height: 100% }
    </style>
    <script type="text/javascript"
        src="http://maps.googleapis.com/maps/api/js?key=AIzaSyACJstxRGIbX8Mv_I2-a8tOLN0d620APjo&amp;sensor=false">
    </script>
    <script type="text/javascript">
        function initialize() 
        {
            formLoad();
            <% If (LookupResults.zipInput <> "") Then %>
             <% sqlConnectionString = connStrPublic

            Dim rs
            Dim sqlText: sqlText = "SELECT WKT, ZoomLevel, CenterLongitude, CenterLatitude  FROM z2t_WebPublic.dbo.z2t_BoundariesZipCode with(nolock) WHERE ZipCode = '" & LookupResults.zipInput &"'"
            Dim zipBoundaryExistsSqlText: zipBoundaryExistsSqlText = "SELECT Count(Id) as [Found] FROM z2t_WebPublic.dbo.z2t_BoundariesZipCode with(nolock) WHERE ZipCode = '" & LookupResults.zipInput &"'"
            Set rs = Sql(sqlText)
                
            If not rs.eof then %>
            
            var map = new google.maps.Map(document.getElementById("map_canvas2"));
            var wkt = "<%=rs("WKT")%>";

            var wktZoomLevel = parseInt("<%=rs("ZoomLevel")%>");
            var centerLongitude = parseFloat("<%=rs("CenterLongitude")%>");
            var centerLatitude = parseFloat("<%=rs("centerLatitude")%>");
            RenderBoundaries("<%=LookupResults.zipInput%>", map, wkt,wktZoomLevel,centerLongitude , centerLatitude );      
            
            <% End If %>           
           

          <% Else %>
              var triangleCoords = [ new google.maps.LatLng(40.714352, -74.005973) ];
            var myLatLng = new google.maps.LatLng(40.714352, -74.005973); 

            var myOptions = {
                center: myLatLng,
                zoom: 11,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            
            var map = new google.maps.Map(document.getElementById("map_canvas2"),
            myOptions);

            var zip_polygon;

            zip_polygon = new google.maps.Polygon({
                paths: triangleCoords,
                strokeColor: "#FF0000",
                strokeOpacity: 0.8,
                strokeWeight: 2,
                fillColor: "#FF0000",
                fillOpacity: 0.35
            });

            zip_polygon.setMap(map);

            <% End If %>
    
            }
    </script>
	<link href="/Website/Includes/css/z2t_lookup.css" rel="stylesheet" type="text/css">
		<!-- #include virtual="/Website/pagesTaxRates/LookupZipCode/page_lookup_content_new.asp" -->
        <!-- #include virtual="/Website/pagesTaxRates/LookupZipCode/page_lookup_right_sidebar_new.asp" -->
    </div>
	<!-- #include virtual="/Website/Includes/footer_new.asp"-->
  
         
  </body>
</html>

<%
    'Delete lookup result instance
    Set LookupResults = Nothing
%>

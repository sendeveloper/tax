<!-- START LOOKUP BOX -->
<div class="NoPrint">
  <div id="lookupbox" class="box">
    <h2 class="title">Look Up The Tax</h2>
    <div class="content">
      <form method="post" action= "website/pagesTaxRates/z2t_lookup.asp" name="formLookup">
        <table border="0" cellspacing="2" cellpadding="0">
          <tr>
            <td width="50%" align="right">
              ZIP Code: 
            </td>
            <td width="50%" align="left">
              <div id='inputDiv'>
                <INPUT TYPE="text" size="10" NAME="inputZip" ID="inputZip" onKeyPress="return keyPressNumbersOnly(this, event);">
              </div><!-- inputDiv -->
            </td>		 
          </tr>
          

          <tr>
            <td>&nbsp;</td>
            <td align="left">
              <%
			   If Session("z2t_loggedin") = "True"  Then
			 %>
              			
              		<a href="javascript:clickLookup();" class="redButton w80">Lookup</a>
               
                 
                 <% Else %>
                 
                 <a class="redButton w80" href="javascript:div_show(1);" >
                     Lookup
                   </a>
              			
                       <% End If %> 
                
                
				 
              			
            </td>
		  </tr>



        </table>
      </form>
    </div><!-- content -->
  </div><!-- lookupbox -->
</div><!-- NoPrint -->
  

<!-- END LOOKUP BOX -->

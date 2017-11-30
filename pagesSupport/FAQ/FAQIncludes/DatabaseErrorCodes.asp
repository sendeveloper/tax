
	  <!-- START: DATABASE ERROR CODES -->
	  <div class="AccordionPanel">
        <div class="AccordionPanelTab">
          <h3><strong>Database error codes</strong></h3>
        </div><!-- AccordionPanelTab -->
        <div class="AccordionPanelContent">          
          <p><strong>API: XML or JSON responses</strong>
		  <table>
		    <tr>
              <td width="128" align="right" valign="middle">0</td>
			  <td width="50"></td>
              <td width="241" valign="middle">Success</td>
            </tr>
			
			<tr>
              <td width="128" align="right" valign="middle">1</td>
			  <td width="50"></td>
              <td width="241" valign="middle">Incorrect Zipcode</td>
            </tr>
			
			<tr>
              <td width="128" align="right" valign="middle">2</td>
			  <td width="50"></td>
              <td width="241" valign="middle">Incorrect State as per Zipcode provided</td>
            </tr>
			
			<tr>
              <td width="128" align="right" valign="middle">3</td>
			  <td width="50"></td>
              <td width="241" valign="middle">Incorrect City as per Zipcode and State provided </td>
            </tr>
			
			<tr>
              <td width="128" align="right" valign="middle">4</td>
			  <td width="50"></td>
              <td width="400" valign="middle">City Alias used for address correction</td>
            </tr>
			
			<tr>
              <td width="128" align="right" valign="middle">5</td>
			  <td width="50"></td>
              <td width="241" valign="middle">One of the mandatory input is blank </td>
            </tr>
			
			<tr>
              <td width="128" align="right" valign="middle">6</td>
			  <td width="50"></td>
              <td width="241" valign="middle">Address not found </td>
            </tr>
			
			<tr>
              <td width="128" align="right" valign="middle">7</td>
			  <td width="50"></td>
              <td width="241" valign="middle">Expired Account </td>
            </tr>
			
			<tr>
              <td width="128" align="right" valign="middle">8</td>
			  <td width="50"></td>
              <td width="241" valign="middle">Invalid Credentials </td>
            </tr>
			
			<tr>
              <td width="128" align="right" valign="middle">9</td>
			  <td width="50"></td>
              <td width="241" valign="middle">Invalid Zip+4 </td>
            </tr>
            
            			<tr>
              <td width="128" align="right" valign="middle">10</td>
			  <td width="50"></td>
              <td width="241" valign="middle">Address found, but tax jurisdiction boundaries could not be matched </td>
            </tr>
            
            			<tr>
              <td width="128" align="right" valign="middle">55</td>
			  <td width="50"></td>
              <td width="241" valign="middle">Valid sample ZIP codes must fall in the range 90001 - 90999 (ZIP+4 resolution) </td>
            </tr>
            
            			<tr>
              <td width="128" align="right" valign="middle">56</td>
			  <td width="50"></td>
              <td width="241" valign="middle">Valid sample ZIP codes must fall in the range 90001 - 90999 (SpotOn resolution) </td>
            </tr>
            
            			<tr>
              <td width="128" align="right" valign="middle">99</td>
			  <td width="50"></td>
              <td width="241" valign="middle">Invalid ZIP code (Basic) </td>
            </tr>
            
            			<tr>
              <td width="128" align="right" valign="middle">100</td>
			  <td width="50"></td>
              <td width="241" valign="middle"> Invalid ZIP code</td>
            </tr>
            
            			<tr>
              <td width="128" align="right" valign="middle">111</td>
			  <td width="50"></td>
              <td width="241" valign="middle"> Insufficient input to specify a tax jurisdiction (SpotOn resolution) </td>
            </tr>
            
            			<tr>
              <td width="128" align="right" valign="middle">112</td>
			  <td width="50"></td>
              <td width="241" valign="middle"> Insufficient input to specify a tax jurisdiction (ZIP+4 resolution)</td>
            </tr>
            
                       			<tr>
              <td width="128" align="right" valign="middle">113</td>
			  <td width="50"></td>
              <td width="241" valign="middle"> Insufficient input to specify a tax jurisdiction (ZIP Code resolution)</td>
            </tr>
            
                       			<tr>
              <td width="128" align="right" valign="middle">500</td>
			  <td width="50"></td>
              <td width="241" valign="middle"> 	Internal Error</td>
            </tr>
		  </table>        
    <br>
    <hr>
          <p><strong>Passing Request Variable, Quick XML Link:</strong><br>
          In the case of erroneous input, the State and County fields will report "Error", 
		  and the Post_Office_City field will hold the error message.<br>
		  Possible error messages are:<br>
		  "Zip Out Of State"<br>
		  "Invalid Zip"<br>
		  "Invalid Sample Zip"<br>
		  "Unknown Error"</p>
		  
		  <table>
		    <tr>
              <td width="128" align="right" valign="middle">0</td>
			  <td width="50"></td>
              <td width="241" valign="middle">"No Errors"</td>
            </tr>
			
			<tr>
              <td width="128" align="right" valign="middle">1</td>
			  <td width="50"></td>
              <td width="241" valign="middle">"Missing Zip Code"</td>
            </tr>
			
			<tr>
              <td width="128" align="right" valign="middle">2</td>
			  <td width="50"></td>
              <td width="241" valign="middle">"Missing Password"</td>
            </tr>
			
			<tr>
              <td width="128" align="right" valign="middle">3</td>
			  <td width="50"></td>
              <td width="241" valign="middle">"Connection Error"</td>
            </tr>
			
			<tr>
              <td width="128" align="right" valign="middle">4</td>
			  <td width="50"></td>
              <td width="241" valign="middle">"Zip Code Less than 5 Characters"</td>
            </tr>
			
			<tr>
              <td width="128" align="right" valign="middle">5</td>
			  <td width="50"></td>
              <td width="241" valign="middle">"Zip Code Out of Range for Sample"</td>
            </tr>
			
			<tr>
              <td width="128" align="right" valign="middle">6</td>
			  <td width="50"></td>
              <td width="241" valign="middle">"Incorrect Username/Password"</td>
            </tr>
			
			<tr>
              <td width="128" align="right" valign="middle">7</td>
			  <td width="50"></td>
              <td width="241" valign="middle">"Zip Code Not Found"</td>
            </tr>
			
			<tr>
              <td width="128" align="right" valign="middle">8</td>
			  <td width="50"></td>
              <td width="241" valign="middle">"Missing Username"</td>
            </tr>
			
			<tr>
              <td width="128" align="right" valign="middle">99</td>
			  <td width="50"></td>
              <td width="241" valign="middle">"Error Unknown"</td>
            </tr>
		  </table>
			
        </div><!-- AccordionPanelContent -->
      </div><!-- AccordionPanel -->
	  <!-- END: DATABASE ERROR CODES -->	
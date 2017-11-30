
	  <!-- START: WHY DO SEVERAL ZIP CODES HAVE FEWER THAN 5 DIGITS IN THE .CSV FILE? -->
	  <div class="AccordionPanel">
        <div class="AccordionPanelTab">
          <h3><strong>Why do several ZIP codes have fewer than 5 digits in the .CSV file?</strong></h3>
        </div><!-- AccordionPanelTab -->
        <div class="AccordionPanelContent">          
          <p>All U.S. ZIP codes have a minimum of 5 digits and Zip2Tax's .CSV tables do 
		  contain that data. A few ZIP codes start with leading zeros, for example 00824. 
		  Some programs, such as Microsoft Excel, by default hide any leading zeros, 
		  therefore making a ZIP code such as 00824 appear as 824.</p>

		  <p>You can fix this very simply by right-clicking on the ZIP code column. Go to 
		  <strong>Format Cells</strong> and in the <strong>Number</strong> tab choose 
		  <strong>Special</strong>. Then in <strong>Type</strong> select Zip Code. Click 
		  <strong>OK</strong> and now the leading zeros will appear correctly.</p>         
        </div><!-- AccordionPanelContent -->
      </div><!-- AccordionPanel -->
	  <!-- END: WHY DO SEVERAL ZIP CODES HAVE FEWER THAN 5 DIGITS IN THE .CSV FILE? -->	  
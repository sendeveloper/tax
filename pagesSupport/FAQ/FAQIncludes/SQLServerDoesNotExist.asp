
	  <!-- START: SQL SERVER ERROR -->
	  <div class="AccordionPanel">
        <div class="AccordionPanelTab">
          <h3><strong>SQL Server does not exist or access denied error</strong></h3>
        </div><!-- AccordionPanelTab -->
        <div class="AccordionPanelContent">          
          <p>If you are attempting to link to the Zip2Tax database through ASP, and 
		  you receive the error:</p>
		  
		  <p>Error Type:<br>
		  Microsoft OLE DB Provider for ODBC Drivers (0x80004005)<br>
		  [Microsoft][ODBC SQL Server Driver][DBNETLIB]SQL Server does not exist or 
		  access denied.</p>
		 
		  <p>It may be a firewall issue. Make sure you have allowed access to our 
		  site from your server. You can test this by pinging our server 
		  db.Zip2Tax.com through access port 1433.</p>
		  
		  <p>If you have SQL Management Studio, try to connect to db.Zip2Tax.com<br>
		  user: z2t_link<br>
		  pwd: H^2p6~r<br>
		  If you cannot connect to db.Zip2Tax.com, it is likely that you need to 
		  enable outgoung connections to db.Zip2Tax.com:1433 in your server firewall 
		  and incoming connections from db.Zip2Tax.com.</p>         
        </div><!-- AccordionPanelContent -->
      </div><!-- AccordionPanel -->
	  <!-- END: SQL SERVER ERROR -->	
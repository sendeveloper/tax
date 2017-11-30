<div class="col-lg-6 col-md-9 content">
	<h1>
	<span class="glyph glyphicon glyphicon-star redFont" aria-hidden="true"></span>
	Passing Request Variables
	</h1>
	
	<h3>
	<span class="glyph glyphicon glyphicon-star redFont" aria-hidden="true"></span>
	Quick Link
	</h3>	
	<p><span class="firstword">The</span> simpliest form of this method is to click on the link below (use the browser's back button to return to here).<br><br>

	<a href="/Link/Lookup.asp?zip=90210&amp;usr=sample&amp;pwd=password"><span style="font-family: Courier;">http://www.zip2tax.com/Link/Lookup.asp?zip=90210&amp;usr=sample&amp;pwd=password</span></a>
	
	</p>
		  
	<p>Or you can paste this line of code into any browser's URL box.</p>

	<p>You will see that you looked up the data using the request variables.  You may wish to
	try other zip codes to see the results.  Keep in mind that when experimenting with the sample username and password 
	combination you are only allowed zip codes between 90001 and 92999.  When you become a subscriber to our service
	you can use the exact same code only having to replace the username and password with your own.</p>

	<p>This example shows our basic version of tax information giving you the total rate.  You may require our full breakout 
	information which returns all the components (State, County, City and Special District) of the total.
	By clicking the link below you can view this.<br><br>

	<a href="/Link/Lookup_Extended.asp?zip=90210&amp;usr=sample&amp;pwd=password">
	  <span style="font-family: Courier;">http://www.zip2tax.com/Link/Lookup_Extended.asp?zip=90210&amp;usr=sample&amp;pwd=password</span></a>
	</p>
	
	
	<h3>
	<span class="glyph glyphicon glyphicon-star redFont" aria-hidden="true"></span>
	Return the Results to your custom page
	</h3>	

	<p><span class="firstword">Now</span> we want to have the
        results passed back to us in a page we custom designed. At the end of the URL we are going to add a 
        request variable named ret as shown.<br><br>
        
        <a href="/Link/Lookup.asp?zip=90210&amp;usr=sample&amp;pwd=password&amp;ret=/Link/DisplayResults.asp">
          <span style="font-family: Courier;">              
            http://www.zip2tax.com/Link/Lookup.asp?zip=90210&amp;usr=sample&amp;pwd=password&amp;<br>ret=http://www.Zip2Tax.com/Link/DisplayResults.asp</span></a></p>
      
      <p>Instead of displaying the results directly 
        to the browser as in the Quick Link example, the data is being passed
        to a page of your choosing which is displaying the data.  This new page
        should reside on your server and can be written in any language.
        Below are samples using ASP and PHP.</p>
		
      <span class="firstword">Display Request Variable Results Using ASP</span>
      <div class="samplesBox">
        
        This is a separate asp page.&lt;br&gt;&lt;br&gt;<br><br>
        
        Zip_Code: &lt;%=Request("Zip_Code")%&gt;&lt;br&gt;<br>
        Sales_Tax_Rate: &lt;%=Request("Sales_Tax_Rate")%&gt;&lt;br&gt;<br>
        Post_Office_City: &lt;%=Request("Post_Office_City")%&gt;&lt;br&gt;<br>
        County: &lt;%=Request("County")%&gt;&lt;br&gt;<br>
        State: &lt;%=Request("State")%&gt;&lt;br&gt;<br>
        Shipping_Taxable: &lt;%=Request("Shipping_Taxable")%&gt;&lt;br&gt;<br>
        
      </div>
	<div class="clearfix"></div>
      <span class="firstword">Display Request Variable Results Using PHP</span>
      <div class="samplesBox">
        &lt;?php<br><br>
        
        echo(&#39;This is a separate php page.&lt;br&gt;&lt;br&gt;&#39;);<br><br>
        
        echo(&#39;Zip_Code: &#39;);<br>
        echo($_REQUEST[&#39;Zip_Code&#39;].&#39;&lt;br&gt;&#39;);<br><br>
        
        echo(&#39;Sales_Tax_Rate: &#39;);<br>
        echo($_REQUEST[&#39;Sales_Tax_Rate&#39;].&#39;&lt;br&gt;&#39;);<br><br>
        
        echo(&#39;Post_Office_City: &#39;);<br>
        echo($_REQUEST[&#39;Post_Office_City&#39;].&#39;&lt;br&gt;&#39;);<br><br>
        
        echo(&#39;County: &#39;);<br>
        echo($_REQUEST[&#39;County&#39;].&#39;&lt;br&gt;&#39;);<br><br>
        
        echo(&#39;State: &#39;);<br>
        echo($_REQUEST[&#39;State&#39;].&#39;&lt;br&gt;&#39;);<br><br>
        
        echo(&#39;Shipping_Taxable: &#39;);<br>
        echo($_REQUEST[&#39;Shipping_Taxable&#39;].&#39;&lt;br&gt;&#39;);<br><br>
        
        ?&gt;<br>
        
      </div>
	
</div>
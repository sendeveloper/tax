<div class="col-lg-6 col-md-9 content">
	<%=HeadingH1("Table Download | HTTP Request")%>
 <p><span class="firstword">Automatic</span> table downloads can
        be easily developed using our HTTP table download feature
        through <a href="https://tables.Zip2Tax.com/index.asp?usr=sample&amp;pwd=password&amp;id=0">https://tables.Zip2Tax.com</a>.
        Pass in your username and password as request variables in
        the query string.</p>

      <p>For a quick demonstration, point your browser to
        <br><samp style="font-size: 90%; margin-left: 10px;">https://tables.zip2tax.com?usr=<span class="firstword">&lt;USERNAME&gt;</span>&#38;pwd=<span class="firstword">&lt;PASSWORD&gt;</span>&#38;id=<span class="firstword">&lt;ID&gt;</span></samp><br>
        Instead of a web page, you will receive a file to save or
        open.</p>

      <p>This is intended to be non-interactive, so you may use the
        programming language of your choice to make the HTTP request.
        To request the list of table(s) you have purchased (including
        their ID numbers), use an ID of 0.  Successive ID numbers will
        download your corresponding table(s).  These items will be
        sent in .csv format with a heading row.  Various error
        messages may also be returned as strings of plain text.  Lines
        are terminated &lt;CR&gt;&lt;LF&gt;.</p>

      <p>Optionally, if you need to retrieve tables for a previous month,
        append the desired date to the query string like this:
        <br><samp style="font-size: 90%; margin-left: 10px;">&amp;date=<span class="firstword">&lt;YYYY&gt;</span>-<span class="firstword">&lt;MM&gt;</span></samp><br></p>

      <p><em>Note</em>: Opening table files with MS-Excel (using Excel's
        default settings) modifies some versions of the tables in ways
        that will make them incompatible with certain shopping carts.
        You may open the files for your viewing with Excel, but do not
        save the tables from Excel. Instead, choose "Save As" rather
        than the "Open" when downloading the tables.</p>

		<h2>Examples:</h2>
        <ul style="margin-left: 45px; margin-top: 15px; ">
        <li>List my tables:<br>
          <a href="https://tables.zip2tax.com?usr=sample&amp;pwd=password&amp;id=0" style="margin-left: 10px;"><samp style="font-size: 90%;">https://tables.zip2tax.com?usr=sample&amp;pwd=password&amp;id=0</samp></a><br>
          Substitute your login for "sample" and your password for "password".</li>
        <li>Download a table:<br>
          <a href="https://tables.zip2tax.com?usr=sample&amp;pwd=password&amp;id=1" style="margin-left: 10px; margin-top: 15px;"><samp style="font-size: 90%;">https://tables.zip2tax.com?usr=sample&amp;pwd=password&amp;id=1</samp></a><br>
          To download the listed table, substitute the desired table's ID for "1".</li>

        <li>Download a previous month's table:<br>
          For example, to download your July, 2011 table:<br>
          <a href="https://tables.zip2tax.com?usr=sample&amp;pwd=password&amp;date=2013-07&amp;id=1" style="margin-left: 10px; margin-top: 15px;"><samp style="font-size: 90%;">https://tables.zip2tax.com?usr=sample&amp;pwd=password&amp;date=2011-07&amp;id=1</samp></a></li>

        <li>Similarly, to list the tables available from July, 2011:<br>
          <a href="https://tables.zip2tax.com?usr=sample&amp;pwd=password&amp;date=2013-07&amp;id=0" style="margin-left: 10px; margin-top: 15px;"><samp style="font-size: 90%;">https://tables.zip2tax.com?usr=sample&amp;pwd=password&amp;date=2011-07&amp;id=0</samp></a></li>
      </ul>

      <p>This interface is intended for developers to automate the
        download process.  An interactive version is available under
        the "My Account" section of the Zip2Tax website (available
        after you log in).<br>
		<% If Session("z2t_loggedin") > "" Then %>
				<a href="https://www.zip2tax.com/account-table-download">
		<% End If %>
				  "My Accounts/TaxTable Downloads" feature.
		<% If Session("z2t_loggedin") > "" Then %>
				</a>
		<% End If %>
      </p>
</div>
<script text="text/javascript">
$(function(){
	$("button[id^=link_]").click(function(){
		theButton2=$(this);
		$(this).text(function(i, text){
			return text === "Show the Code" ? "Hide the Code" : "Show the Code";
		})
		var theButton = $(this).attr("id");
		var theLayer = theButton.replace("link","content");
		var thehtml = theButton.replace("link","thehtml");
		var theimage = theButton.replace("link","theimage");
		
		$("#"+theLayer).toggle(function(){
			if ($(theButton2).text() === "Show the Code") {;
				$("#" + thehtml).hide();
				$("#" + theimage).hide();
			}
		});
	});
	
	$(".showCodesnippet").click(function(event){
		event.preventDefault();
		var theText = $(this).text();
		var theWidth = theText.split(" x ")[0];
		var theHeight = theText.split(" x ")[1];
		var theImg = $(this).parents("div.row").attr("id").replace("content","img");
		var theImg2 = $(this).parents("div.row").attr("id").replace("content_","");
		var theExt = $(this).parents("div").attr("title");
		var theAlt = $("#" + theImg).attr("alt");
		var theCode="<a href='https://www.zip2tax.com/sales-tax-calculator'><img src='https://badge.zip2tax.com/" + theImg2 + "." + theExt + "' width='" + theWidth + "' height='" + theHeight + "' alt='" + theAlt + "' title='" +theAlt + "' class='img-responsive' /></a>";
		var theLayer2 = $(this).parents("div.row").attr("id").replace("content","thehtml");
		$("#"+theLayer2).show();
		$("#theCode"+theImg2).val(theCode);
		$("#thehtml_"+theImg2).show();
		
	});
	$(".showImagesnippet").click(function(event){
		event.preventDefault();
		var theWidth = $(this).prev().text().split(" x ")[0];
		var theHeight = $(this).prev().text().split(" x ")[1];
		var theImg = $(this).parents("div.row").attr("id").replace("content_","");
		var theExt = $(this).parents("div").attr("title");
		var theCode="<img src='https://badge.zip2tax.com/" + theImg + "." + theExt + "' width='" + theWidth + "' height='" + theHeight + "' class='img-responsive' />";
		
		$("#theimg_"+theImg).empty().append(theCode);
		$("#theimage_"+theImg).show();
	});

});
</script>

<div class="col-md-9 content">
	<%=HeadingH1("Zip2tax downloadable badges")%>
		<div class="clearfix"></div>

		<p>Download any of these badges and announce to the world that you are taking your sales tax compliance seriously. These valuable badges not only help to assure your customers that they are being charged the correct sales tax rate, they also show state auditors that your data is accurate and up to date.</p>
		<p>Just copy the code for the badge you prefer and place it on your web site, shopping cart or blog.</p>
		<%imageStr="Zip2Tax-logo-350"%>
		<div class="row" style="min-height:150px">
			<div class="col-lg-6">
				<img src="/Website/Images/badges/<%=imageStr%>.jpg" alt="Zip2Tax logo badge" id="img_<%=imageStr%>" class="center-block img-responsive">
			</div>
			<div class="col-lg-6">
				<div class="clearfix"></div>
			<button class="btn btn-danger center-block" id="link_<%=imageStr%>">Show the Code</button>
			</div>
		</div>
		<div class="row hiddenContent" id="thehtml_<%=imageStr%>">
			<div class="col-lg-12 text-center">
			<textarea id="theCode<%=imageStr%>" style="width:60%; height:80px;"></textarea>
			<br>
			<small style="color:#f00;">The clipboard object isn't supported by your browser. Press CTRL-C to copy to the clipboard.</small>
			</div>
		</div>
		<div class="row hiddenContent" id="theimage_<%=imageStr%>">
			<div class="col-lg-8 col-lg-offset-2 text-center">
			<div id="theimg_<%=imageStr%>" style="border:1px solid #f00; background:#eee; padding:5px"></div>
			</div>
		</div>
		<div class="row hiddenContent" id="content_<%=imageStr%>">
			<div class="clearfix"></div>
			
			<div class="col-lg-5 col-lg-offset-1" title="jpg">
				<p>
				White Background (.JPG)<br>
				<a href="#" class="showCodesnippet">350 x 90</a> <a href="#" class="showImagesnippet">(preview)</a><br>
				<a href="#" class="showCodesnippet">250 x 64</a> <a href="#" class="showImagesnippet">(preview)</a><br>
				<a href="#" class="showCodesnippet">150 x 38</a> <a href="#" class="showImagesnippet">(preview)</a><br>
				<a href="#" class="showCodesnippet">75 x 19</a> <a href="#" class="showImagesnippet">(preview)</a>
				</p>
			</div>
			<div class="col-lg-5 col-lg-offset-1" title="png">
				<p>Transparent Background (.PNG)<br>
				<a href="#" class="showCodesnippet">350 x 90</a> <a href="#" class="showImagesnippet">(preview)</a><br>
				<a href="#" class="showCodesnippet">250 x 64</a> <a href="#" class="showImagesnippet">(preview)</a><br>
				<a href="#" class="showCodesnippet">150 x 38</a> <a href="#" class="showImagesnippet">(preview)</a><br>
				<a href="#" class="showCodesnippet">75 x 19</a> <a href="#" class="showImagesnippet">(preview)</a>
				</p>
			</div>
		</div>

		<div class="clearfix"></div>

		<%imageStr="Powered-by-Zip2Tax-250"%>
		<div class="row" style="min-height:150px">
			<div class="col-lg-6">
				<img src="/Website/Images/badges/<%=imageStr%>.jpg" alt="Powered by Zip2Tax logo badge" id="img_<%=imageStr%>" class="center-block">
			</div>
			<div class="col-lg-6">
				<div class="clearfix"></div>
			<button class="btn btn-danger center-block" id="link_<%=imageStr%>">Show the Code</button>
			</div>
		</div>
		<div class="row hiddenContent" id="thehtml_<%=imageStr%>">
			<div class="col-lg-12 text-center">
			<textarea id="theCode<%=imageStr%>" style="width:60%; height:80px;"></textarea>
			<br>
			<small style="color:#f00;">The clipboard object isn't supported by your browser. Press CTRL-C to copy to the clipboard.</small>
			</div>
		</div>
		<div class="row hiddenContent" id="theimage_<%=imageStr%>">
			<div class="col-lg-8 col-lg-offset-2 text-center">
			<div id="theimg_<%=imageStr%>" style="border:1px solid #f00; background:#eee; padding:5px"></div>
			</div>
		</div>
		<div class="row hiddenContent" id="content_<%=imageStr%>">
			<div class="clearfix"></div>
			
			<div class="col-lg-5 col-lg-offset-1" title="jpg">
				<p>
				White Background (.JPG)<br>
				<a href="#" class="showCodesnippet">250 x 83</a> <a href="#" class="showImagesnippet">(preview)</a><br>
				<a href="#" class="showCodesnippet">150 x 50</a> <a href="#" class="showImagesnippet">(preview)</a><br>
				<a href="#" class="showCodesnippet">75 x 25</a> <a href="#" class="showImagesnippet">(preview)</a><br>
				</p>
			</div>
			<div class="col-lg-5 col-lg-offset-1" title="png">
				<p>Transparent Background (.PNG)<br>
				<a href="#" class="showCodesnippet">250 x 83</a> <a href="#" class="showImagesnippet">(preview)</a><br>
				<a href="#" class="showCodesnippet">150 x 50</a> <a href="#" class="showImagesnippet">(preview)</a><br>
				<a href="#" class="showCodesnippet">75 x 25</a> <a href="#" class="showImagesnippet">(preview)</a><br>
				</p>
			</div>
		</div>

		<div class="clearfix"></div>

		<%imageStr="sales-tax-rates-certified-by-Zip2Tax-350"%>
		<div class="row" style="min-height:150px">
			<div class="col-lg-6">
				<img src="/Website/Images/badges/<%=imageStr%>.jpg" alt="Sales and use tax rates certified by Zip2Tax.com" id="img_<%=imageStr%>" class="center-block img-responsive">
			</div>
			<div class="col-lg-6">
				<div class="clearfix"></div>
			<button class="btn btn-danger center-block" id="link_<%=imageStr%>">Show the Code</button>
			</div>
		</div>
		<div class="row hiddenContent" id="thehtml_<%=imageStr%>">
			<div class="col-lg-12 text-center">
			<textarea id="theCode<%=imageStr%>" style="width:60%; height:80px;"></textarea>
			<br>
			<small style="color:#f00;">The clipboard object isn\'t supported by your browser. Press CTRL-C to copy to the clipboard.</small>
			</div>
		</div>
		<div class="row hiddenContent" id="theimage_<%=imageStr%>">
			<div class="col-lg-8 col-lg-offset-2 text-center">
			<div id="theimg_<%=imageStr%>" style="border:1px solid #f00; background:#eee; padding:5px"></div>
			</div>
		</div>
		<div class="row hiddenContent" id="content_<%=imageStr%>">
			<div class="clearfix"></div>
			
			<div class="col-lg-5 col-lg-offset-1" title="jpg">
				<p>
				White Background (.JPG)<br>
				<a href="#" class="showCodesnippet">350 x 109</a> <a href="#" class="showImagesnippet">(preview)</a><br>
				<a href="#" class="showCodesnippet">300 x 93</a> <a href="#" class="showImagesnippet">(preview)</a><br>
				<a href="#" class="showCodesnippet">250 x 78</a> <a href="#" class="showImagesnippet">(preview)</a><br>
				<a href="#" class="showCodesnippet">150 x 47</a> <a href="#" class="showImagesnippet">(preview)</a>
				</p>
			</div>
			<div class="col-lg-5 col-lg-offset-1" title="png">
				<p>Transparent Background (.PNG)<br>
				<a href="#" class="showCodesnippet">350 x 109</a> <a href="#" class="showImagesnippet">(preview)</a><br>
				<a href="#" class="showCodesnippet">300 x 93</a> <a href="#" class="showImagesnippet">(preview)</a><br>
				<a href="#" class="showCodesnippet">250 x 78</a> <a href="#" class="showImagesnippet">(preview)</a><br>
				<a href="#" class="showCodesnippet">150 x 47</a> <a href="#" class="showImagesnippet">(preview)</a>
				</p>
			</div>
		</div>

		<div class="clearfix"></div>
		
		<%imageStr="sales-tax-certified-by-Zip2Tax-125"%>
		<div class="row" style="min-height:150px">
			<div class="col-lg-6">
				<img src="/Website/Images/badges/<%=imageStr%>.jpg" alt="Sales and use tax rates certified by Zip2Tax.com" id="img_<%=imageStr%>" class="center-block">
			</div>
			<div class="col-lg-6">
				<div class="clearfix"></div>
			<button class="btn btn-danger center-block" id="link_<%=imageStr%>">Show the Code</button>
			</div>
		</div>
		<div class="row hiddenContent" id="thehtml_<%=imageStr%>">
			<div class="col-lg-12 text-center">
			<textarea id="theCode<%=imageStr%>" style="width:60%; height:80px;"></textarea>
			<br>
			<small style="color:#f00;">The clipboard object isn't supported by your browser. Press CTRL-C to copy to the clipboard.</small>
			</div>
		</div>
		<div class="row hiddenContent" id="theimage_<%=imageStr%>">
			<div class="col-lg-8 col-lg-offset-2 text-center">
			<div id="theimg_<%=imageStr%>" style="border:1px solid #f00; background:#eee; padding:5px"></div>
			</div>
		</div>
		<div class="row hiddenContent" id="content_<%=imageStr%>">
			<div class="clearfix"></div>
			
			<div class="col-lg-5 col-lg-offset-1" title="jpg">
				<p>
				White Background (.JPG)<br>
				<a href="#" class="showCodesnippet">125 x 179</a> <a href="#" class="showImagesnippet">(preview)</a><br>
				<a href="#" class="showCodesnippet">75 x 107</a> <a href="#" class="showImagesnippet">(preview)</a><br>
				<a href="#" class="showCodesnippet">50 x 72</a> <a href="#" class="showImagesnippet">(preview)</a>
				</p>
			</div>
			<div class="col-lg-5 col-lg-offset-1" title="png">
				<p>Transparent Background (.PNG)<br>
				<a href="#" class="showCodesnippet">125 x 179</a> <a href="#" class="showImagesnippet">(preview)</a><br>
				<a href="#" class="showCodesnippet">75 x 107</a> <a href="#" class="showImagesnippet">(preview)</a><br>
				<a href="#" class="showCodesnippet">50 x 72</a> <a href="#" class="showImagesnippet">(preview)</a>
				</p>
			</div>
		</div>

		<div class="clearfix"></div>
		<%imageStr="Zip2tax_icon_badge_125"%>
		<div class="row" style="min-height:150px">
			<div class="col-lg-6">
				<img src="/Website/Images/badges/<%=imageStr%>.jpg" alt="Sales and use tax rates certified by Zip2Tax.com" id="img_<%=imageStr%>" class="center-block">
			</div>
			<div class="col-lg-6">
				<div class="clearfix"></div>
			<button class="btn btn-danger center-block" id="link_<%=imageStr%>">Show the Code</button>
			</div>
		</div>
		<div class="row hiddenContent" id="thehtml_<%=imageStr%>">
			<div class="col-lg-12 text-center">
			<textarea id="theCode<%=imageStr%>" style="width:60%; height:80px;"></textarea>
			<br>
			<small style="color:#f00;">The clipboard object isn't supported by your browser. Press CTRL-C to copy to the clipboard.</small>
			</div>
		</div>
		<div class="row hiddenContent" id="theimage_<%=imageStr%>">
			<div class="col-lg-8 col-lg-offset-2 text-center">
			<div id="theimg_<%=imageStr%>" style="border:1px solid #f00; background:#eee; padding:5px"></div>
			</div>
		</div>
		<div class="row hiddenContent" id="content_<%=imageStr%>">
			<div class="clearfix"></div>
			
			<div class="col-lg-5 col-lg-offset-1" title="jpg">
				<p>
				White Background (.JPG)<br>
				<a href="#" class="showCodesnippet">125 x 122</a> <a href="#" class="showImagesnippet">(preview)</a><br>
				<a href="#" class="showCodesnippet">62 x 62</a> <a href="#" class="showImagesnippet">(preview)</a><br>
				<a href="#" class="showCodesnippet">50 x 49</a> <a href="#" class="showImagesnippet">(preview)</a><br>
				<a href="#" class="showCodesnippet">25 x 24</a> <a href="#" class="showImagesnippet">(preview)</a>
				</p>
			</div>
			<div class="col-lg-5 col-lg-offset-1" title="png">
				<p>Transparent Background (.PNG)<br>
				<a href="#" class="showCodesnippet">125 x 122</a> <a href="#" class="showImagesnippet">(preview)</a><br>
				<a href="#" class="showCodesnippet">62 x 62</a> <a href="#" class="showImagesnippet">(preview)</a><br>
				<a href="#" class="showCodesnippet">50 x 49</a> <a href="#" class="showImagesnippet">(preview)</a><br>
				<a href="#" class="showCodesnippet">25 x 24</a> <a href="#" class="showImagesnippet">(preview)</a>
				</p>
			</div>
		</div>

		<div class="clearfix"></div>
		
</div>
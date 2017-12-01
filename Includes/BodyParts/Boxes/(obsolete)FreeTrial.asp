<!-- START NEWSLETTER BOX -->

<%
			   If Session("z2t_loggedin") <> "True"  Then
			 %>
<div class="box">
  <h2 class="title">Free Trial</h2>
  
  <div class="centering content">
    <strong> 
        Call 1-866-492-8494 today<br>
        <!-- Edited By : Humair 26 Jan 2016, 
        	 Changed : href="/Website/pagesProducts/offers/Free/z2t_Services_Free.asp" 
             To:	href="javascript:div_show(1);"
         -->
         for your free trial or 
         <br><a  href="javascript:div_show(1);">
         		sign up
             </a>
           risk free!<br>
      
    </strong>
  </div><!-- content-->
</div><!-- box -->
<%End If %>

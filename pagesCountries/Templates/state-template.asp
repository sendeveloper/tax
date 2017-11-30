<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<!--#include virtual="/Website/Includes/Config.asp"-->
<!--#include virtual="/Website/Includes/Connection.asp"-->

<%
    Session("activePage") = "Tax Rates"
    Session("currentPage") = "index.asp"
%>

<html>
  <head>
    <title>~{MetaTitle~}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="description" content="~{MetaDescription~}">
	<!-- #include virtual="/Website/Includes/BodyParts/HeadContent.inc"-->	
    <script language="javascript" src="/Website/Includes/Javascript/z2t_functions.js" type="text/javascript"></script>

    <script type="text/javascript" src="/Website/Includes/Javascript/lib.js"></script>
	<script language="javascript" type="text/javascript">
	      function formLoad() {
        document.getElementById('JavaScriptTest').innerHTML = 'Pass';
        //document.getElementById('inputZip').focus()

        // state map zoom-in
        function position(object) {
          var position = xy(object);
          var left = position[0];
          var top = position[1];
          var right = left -  parseFloat(css(object).width);
          var bottom = top - parseFloat(css(object).height);
          return [right, bottom];}

        (function(){
          var xy = position(get("#img-small"));
          var imgBig =
            node("div", ["id","img-big", "style","display: inline-block; white-space: nowrap; overflow: hidden; background: black; color: lightgrey; border: 1px solid black; visibility: hidden; position: absolute; top: 15em; left: 10em;"],
              node("div", ["style","text-align: right; background-color: #ec3333;"], node("div", ["class","button", "style","cursor: pointer; margin-right: 1em; background-color: #ec3333; color: black;"], text("[X] Close"))),
              node("img", ["src","http://www.zip2tax.com/Website/Images/States/~{State~}-lg.png", "style","border: 1px solid black; background: rgba(128, 128, 128, .5);"]));
          listen(get("#img-small"), "click",
            function(event){
              var xy = position(get("#img-small")); 
              //imgBig.style.right = px(xy[0]); 
              //imgBig.style.bottom = px(xy[1]); 
              show(imgBig); 
              return;});
          listen(imgBig, "click", 
            function(event){
                hide(imgBig);
                return;});
          get("body")[0].appendChild(imgBig);})();

        return;}

      window.onload = formLoad;
	</script>
 
    <style type="text/css">
      h1 {text-align: left; margin-top: 1em; margin-bottom: 1em;}
      h2 {margin-bottom: .5em;}
      ul.disc {list-style: disc outside none !important;}

      .box h1 {margin-bottom: 0em; margin-top: 0em;}
      .box h2 {margin-bottom: 0em;}
      .post > h1.title {
        margin: 45px 0 20px 0;
        padding-left: 33px;
        background: url(/website/images/star.gif) no-repeat left top !important;}

      .post h2.title {
        margin: 45px 0 20px 0;
        padding-left: 33px;
                          margin-left: -33px;
        background: url(/website/images/star.gif) no-repeat left top !important;}

      /* h2.title {margin-left: -5em;} */
    </style>
  </head>
  
  <body>
        <!--#include virtual="/Website/Includes/BodyParts/BodyContent.inc"-->
    <div id="divMain">
      
      <div id="divPageTop">
        <!--#include virtual="/Website/Includes/bodyParts/page_top.asp"-->
      </div><!-- divPageTop -->
      

      <div id="divPageMiddle">
        <div id="divPageLeft">
          <!-- #include virtual="/Website/pagesCountries/Templates/State/state_template_left_sidebar.asp" -->
        </div><!-- divPageLeft -->

        <div id="divPageCenter">
          <!-- #include virtual="/Website/pagesCountries/Templates/State/state_template_content.inc" -->
        </div><!-- divPageCenter -->

        <div id="divPageRight">
          <!-- #include virtual="/Website/pagesCountries/Templates/State/state_template_right_sidebar.asp" -->
        </div><!-- divPageRight -->
      </div><!-- divPageMiddle -->


      <div id="divPageBottom">
        <!--#include virtual="/Website/Includes/bodyParts/footer.asp"-->
      </div><!-- divPageBottom -->
      
    </div><!-- main -->
  </body>
</html>

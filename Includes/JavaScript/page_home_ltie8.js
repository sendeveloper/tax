function formLoad(){mi1=document.getElementById("MovingImage1"),errorMessage>""&&alert(errorMessage),"True"==NewUser&&(placeImages(),moveObjRight(mi1),document.getElementById("inputZip").focus())}function clickImage(){mi1.style.visibility="hidden",document.getElementById("inputZip").focus()}function moveObjRight(a){a.style.left=Hmove+"px",(Hmove+=5)<Hlimit&&window.setTimeout(function(){moveObjRight(a)},0)}function placeImages(){mi1.style.top=document.getElementById("lookupbox").offsetTop-document.getElementById("lookupbox").offsetHeight+"px",Hlimit=document.getElementById("lookupbox").offsetLeft-document.getElementById("MovingImage1").offsetWidth,mi1.style.left="50px",mi1.style.visibility="visible"}var pathBase="<%=pathBase%>",currentPage='<%=Session("currentPage")%>',errorMessage='<%=Session("LoginErrorUrgent")%>',NewUser='<%=Session("NewUser")%>',PageKeyWords="<%=PageKeyWords%>",mi1="",Hmove=50,Hlimit;window.onload=formLoad;
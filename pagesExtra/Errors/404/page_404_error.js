    function formLoad() {
        //document.getElementById('JavaScriptTest').innerHTML = 'Pass';}

    window.onload = formLoad;

    function ShowHide(divId) {
      if (document.getElementById(divId).className != "screen-shown") {
        document.getElementById(divId).className = "screen-shown";}
      else {
        document.getElementById(divId).className = "screen-hidden";}}

      function formLoad()
        {
        document.getElementById('JavaScriptTest').innerHTML = 'Pass';

        return;
        document.getElementById('divPageMiddle').style.border = '2px solid red';
        document.getElementById('divPageLeft').style.border = '2px solid black';
        document.getElementById('divPageCenter').style.border = '2px solid #C0C0C0';
        document.getElementById('divPageRight').style.border = '2px solid black';
        document.getElementById('divPageBottom').style.border = '2px solid #C0C0C0';
        }

      window.onload=formLoad;
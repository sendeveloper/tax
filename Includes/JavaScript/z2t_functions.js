function nil() {}

function SetScreen(a, b) {
    window.resizeTo(a, b), CenterScreen(a, b)
}

function CenterScreen(a, b) {
    var c, d, e = (window.screen.availWidth - a) / 2,
        f = (window.screen.availHeight - b) / 2;
    "Microsoft Internet Explorer" == navigator.appName ? (c = e, d = f) : (c = e - pageXOffset, d = f - pageYOffset), window.moveTo(c, d)
}

function openPopUp(a) {
    window.open(a, "", "scrollbars=yes,fullscreen=no,resizable=yes,height=10,width=10,left=10,top=10")
}

function openPopUpSize(a, b, c) {
    window.open(a, "", "scrollbars=yes,fullscreen=no,resizable=yes,height=" + c + ",width=" + b + ",left=10,top=10")
}

function clickLogin() {
    if ("" == document.getElementById("z2tLogin").value && "" == document.getElementById("z2tPassword").value) return void document.getElementById("z2tLogin").focus();
    if ("" == document.getElementById("z2tLogin").value) return document.getElementById("z2tLogin").focus(), void alert("Please enter your User Name");
    if ("" == document.getElementById("z2tPassword").value) return document.getElementById("z2tPassword").focus(), void alert("Please enter your Password");
    var a = currentPagePath + "?lname=" + document.getElementById("z2tLogin").value + "&pass=" + document.getElementById("z2tPassword").value;
    window.document.location = a
}

function clickLogout() {
    var a = currentPagePath + "?logout=true";
    window.document.location = a
}

function clickLookup() {
    var a = document.getElementById("inputZip");
    if (a.value.length > 5 && (a.value = a.value.substr(0, 5)), 5 == a.value.length) {
        var b = "/sales-tax-calculator?inputZip=" + a.value;
        window.document.location = b
    } else alert("Zip Code Must Contain 5 Characters")
}

function focusField(a) {
    foc = a
}

function keyPress(a, b) {
    var c;
    if (b) c = b.which;
    else {
        if (!window.event) return !0;
        c = window.event.keyCode
    }
    if (13 == c) {
        if (c = 0, "z2tLogin" == a.name) return document.getElementById("z2tPassword").focus(), !1;
        if ("z2tPassword" == a.name) return clickLogin(), !1
    }
    return !0
}

function keyPressNumbersOnly(a, b, c) {
    var d, e;
    if (b) d = b.which;
    else {
        if (!window.event) return !0;
        d = window.event.keyCode
    }
    return e = String.fromCharCode(d), 13 == d && ("amt" == foc && document.getElementById("inputzip").focus(), "zip" == foc && document.getElementById("inputamt").focus(), "inputZip" == a.name && LookupORLoginBox()), null == d || 0 == d || 8 == d || 9 == d || 27 == d || ("0123456789".indexOf(e) > -1 || !(!c || "." != e) && (a.form.elements[c].focus(), !1))
}

function getPosition(a) {
    a || (a = window.event);
    var b = {
        x: 0,
        y: 0
    };
    return a.pageX || a.pageY ? (b.x = a.pageX, b.y = a.pageY) : (b.x = a.clientX + (document.documentElement.scrollLeft || document.body.scrollLeft) - document.documentElement.clientLeft, b.y = a.clientY + (document.documentElement.scrollTop || document.body.scrollTop) - document.documentElement.clientTop), b
}

function clickLink(a) {
    var b = "Website/pagesProducts/z2t_services.asp#";
    1 == a && (b = "Website/pagesProducts/z2t_services.asp#PageSection1"), 2 == a && (b = "Website/pagesProducts/z2t_services.asp#PageSection2"), 3 == a && (b = "Website/pagesProducts/z2t_services.asp#PageSection3"), 4 == a && (b = "/shopping/z2t_zipcode.asp"), 5 == a && (b = "/shopping/z2t_zip4.asp"), 6 == a && (b = "/shopping/z2t_pinpoint.asp");
    var c = pathBase + b;
    window.document.location = c
}

function check_empty() {
    "" == document.getElementById("Username").value || "" == document.getElementById("Password").value ? alert("Fill All Fields !") : (document.getElementById("form").submit(), alert("Form Submitted Successfully..."))
}

function div_show(a) {
    1 == a ? document.getElementById("LoginPopup").style.display = "block" : 2 == a ? document.getElementById("InitialSignupPopup").style.display = "block" : 3 == a ? document.getElementById("ThankyouPopup").style.display = "block" : 4 == a ? document.getElementById("InterimSignupPopup").style.display = "block" : 5 == a && (document.getElementById("passwordRecoveryPopup").style.display = "block")
}

function div_hide(a) {
    1 == a ? document.getElementById("LoginPopup").style.display = "none" : 2 == a ? document.getElementById("dialog-form2").parentNode.style.display = "none" : 3 == a ? document.getElementById("ThankyouPopup").style.display = "none" : 4 == a ? document.getElementById("InterimSignupPopup").style.display = "none" : 5 == a && (document.getElementById("passwordRecoveryPopup").style.display = "none")
}

function passwordRecoveryPopup() {
    div_show(5)
}

function FreeTrialInitialSingup() {
    div_hide(1), div_show(2)
}

function FreeTrialLogin() {
    div_hide(2), div_show(1)
}

function SubmitFreeTrialInitialSignup() {
    return FirstName = document.getElementById("FirstName").value, Email = document.getElementById("Email").value, !!ValidateEmail(document.getElementById("Email")) && (ValidateName(document.getElementById("FirstName")) ? FirstName.length < 1 || Email.length < 1 ? (alert("Invalid Firstname or Email"), document.getElementById("FirstName").focus(), !1) : (PostStr = "fName=" + FirstName + "&Email=" + Email + "&ftsignup=1", url = pathBase + "website/Includes/login/FreeTrialSignUp/initial_signup.asp", doAJAXCall(url, "GET", PostStr, ResponseSaved), void 0) : (alert("Invalid first name, space and special characters are not accepted."), document.getElementById("FirstName").focus(), !1))
}

function SubmitPasswordRecovery() {
    return Email = document.getElementById("passrEmail").value, !!ValidateEmail(document.getElementById("passrEmail")) && (Email.length < 1 ? (alert("Invalid email address."), document.getElementById("passrEmail").focus(), !1) : (PostStr = "Email=" + Email, url = pathBase + "website/Includes/login/PasswordRecovery/password_recovery.asp", doAJAXCall(url, "GET", PostStr, ResponseSaved), void 0))
}

function SubmitFreeTrialInterimSingup() {
    return ftintlname = document.getElementById("ftintlname").value, ftinttitle = document.getElementById("ftinttitle").value, ftintcompanyname = document.getElementById("ftintcompanyname").value, ftintphone = document.getElementById("ftintphone").value, ValidateName(document.getElementById("ftintlname")) ? ValidateTitleName(document.getElementById("ftinttitle")) ? ValidateCompanyName(document.getElementById("ftintcompanyname")) ? document.getElementById("ftintphone").length < 14 ? (alert("Invalid phone, please provide complete phone number."), document.getElementById("ftintphone").focus(), !1) : ftintlname.length < 1 || ftinttitle.length < 1 || ftintcompanyname.length < 1 || ftintphone.length < 1 ? (alert("All Fields are requierd"), document.getElementById("ftintFirstName").focus(), !1) : (PostStr = "ftintlname=" + ftintlname + "&ftinttitle=" + ftinttitle + "&ftintcompanyname=" + ftintcompanyname + "&ftintphone=" + ftintphone + "&ftintsignup=1", url = pathBase + "website/Includes/login/FreeTrialSignUp/interim_signup.asp", doAJAXCall(url, "GET", PostStr, ResponseSaved), void 0) : (alert("Invalid company name, special characters are not accepted."), document.getElementById("ftintcompanyname").focus(), !1) : (alert("Invalid title name, special characters are not accepted."), document.getElementById("ftinttitle").focus(), !1) : (alert("Invalid last name, space and special characters are not accepted."), document.getElementById("ftintlname").focus(), !1)
}

function ftLogin() {
    if (ftusernameval = document.getElementById("ftUsername").value, ftpasswordval = document.getElementById("ftPassword").value, inputZip = document.getElementById("inputZip").value, ftusernameval.length < 1 || ftpasswordval.length < 1) return alert("Invalid username or password"), document.getElementById("ftUsername").focus(), !1;
    PostStr = "lName=" + ftusernameval + "&pass=" + ftpasswordval + "&ftlogin=1", url = pathBase + "website/Includes/login/freeTrialLogin.asp", doAJAXCall(url, "GET", PostStr, ResponseSaved)
}

function ResponseSaved(a) {
    var b = a.response;
    "success" == b ? window.location.href = pathBase + "sales-tax-calculator?inputZip=" + inputZip : "failed" == b ? alert("Invalid Username or Password") : "InitSignupDone" == b ? (div_hide(2), div_show(3)) : "Interim" == b ? (div_hide(1), div_show(4)) : "InterimSignupDone" == b ? window.location.href = pathBase + "sales-tax-calculator" : "Online" == b ? window.location.href = pathBase + "sales-tax-calculator" : "passrecovered" == b ? (div_hide(5), alert("An email has been sent containing password.")) : "IncorrectEmail" == b ? alert("Incorrect email address.") : "InitSignupDuplicateEmail" == b && (div_hide(2), alert("Email already exists, please use forgot password to recover your account."), div_show(5))
}
function ftLoginNew() {
    document.getElementById('dialog-waiting').style.display = "block";
    if (ftusernameval = document.getElementById("ftUsername").value, ftpasswordval = document.getElementById("ftPassword").value, ftusernameval.length < 1 || ftpasswordval.length < 1) return alert("Invalid username or password"), document.getElementById("ftUsername").focus(), !1;
    PostStr = "lName=" + ftusernameval + "&pass=" + ftpasswordval + "";
    url = pathBase + "website/Includes/login/freeTrialLogin.asp?";
    $.get(url+PostStr, function(data, status){
        document.getElementById('dialog-waiting').style.display = "none";
        setTimeout(function(){
            ResponseSavedNew(data);    
        }, 50);
    });
}
function ResponseSavedNew(a) {
	var b = a;
    "success" == b ? document.location.reload() : "failed" == b ? alert("Invalid Username or Password") : "InitSignupDone" == b ? (div_hideNew(2), div_showNew(3)) : "Interim" == b ? (document.location.reload()) : "InterimSignupDone" == b ? window.location.href = pathBase + "sales-tax-calculator" : "Online" == b ? window.location.href = pathBase + "sales-tax-calculator" : "passrecovered" == b ? (div_hideNew(5), alert("An email has been sent containing password.")) : "IncorrectEmail" == b ? alert("Incorrect email address.") : "InitSignupDuplicateEmail" == b && (div_hideNew(2), alert("Email already exists, please use forgot password to recover your account."), div_showNew(5))
}
function div_showNew(a) {
    1 == a ? document.getElementById("dialog-form").style.display = "block" : 2 == a ? document.getElementById("dialog-form2").style.display = "block" : 3 == a ? document.getElementById("ThankyouPopup").style.display = "block" : 4 == a ? document.getElementById("InterimSignupPopup").style.display = "block" : 5 == a && (document.getElementById("passwordRecoveryPopup").style.display = "block")
}

function div_hideNew(a) {
    1 == a ? document.getElementById("dialog-form").style.display = "none" : 2 == a ? document.getElementById("dialog-form2").parentNode.style.display = "none" : 3 == a ? document.getElementById("ThankyouPopup").style.display = "none" : 4 == a ? document.getElementById("InterimSignupPopup").style.display = "none" : 5 == a && (document.getElementById("passwordRecoveryPopup").style.display = "none")
}
function ValidateEmail(a) {
    return !!/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(a.value) || (alert("Please provide a valid email address!"), !1)
}

function ValidateName(a) {
    return !!/^[a-zA-Z-]*$/.test(a.value)
}

function ValidateNumbers(a) {
    return !!/^[0-9]*$/.test(a.value)
}

function ValidateCompanyName(a) {
    return !!/^[a-zA-Z0-9- .]*$/.test(a.value)
}

function ValidateTitleName(a) {
    return !!/^[a-zA-Z- ]*$/.test(a.value)
}

function moveCaretToStart(a) {
    if ("number" == typeof a.selectionStart) a.selectionStart = a.selectionEnd = 0;
    else if (void 0 !== a.createTextRange) {
        a.focus();
        var b = a.createTextRange();
        b.collapse(!0), b.select()
    }
}
var foc = "",
    isIE = 1;
if ("Netscape" == navigator.appName && (isIE = 0)){
  $(window).load(function() {
    
  })
}

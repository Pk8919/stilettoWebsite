function SetAspNetFormAction(action) {
    document.forms["aspnetForm"].action = action;
    document.getElementById("__VIEWSTATE").value = "";
}
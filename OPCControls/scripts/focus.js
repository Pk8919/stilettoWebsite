function setFocus(eleId)
{
    var textBox = document.getElementById(eleId);
    if (textBox == null || textBox === undefined)
    {
        return;
    }
    if (textBox.disabled == false)
    {
        if (textBox.value == '')
        {
            textBox.focus();
            textBox.focus();
            textBox.focus();
            textBox.focus();
            textBox.focus();
        }
    }
}

function setFocusTimeout(eleId)
{
    var textBox = document.getElementById(eleId);    
    textBox.focus();
}


window.scrollTo = function() { }

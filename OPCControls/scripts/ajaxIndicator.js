function AjaxIndicator(backgroundId, foregroundId)
{
    this.backgroundId = backgroundId;
    this.foregroundId = foregroundId;
}

DropDownList.prototype.backgroundId;
DropDownList.prototype.foregroundId;

AjaxIndicator.prototype.initialize = function()
{
    var bgElement = document.getElementById(this.backgrounId);

    var height = 0;
    if (document.documentElement && document.documentElement.scrollHeight)
    {
        height = document.documentElement.scrollHeight;
    }
    else
    {
        if (document.body.scrollHeight > document.body.offsetHeight)
        {
            height = (document.body.scrollHeight);
        }
        else
        {
            height = document.body.offsetHeight;
        }
    }

    bgElement.style.height = (height + 1000) + 'px';

    this.reposition();

    window.onscroll = reposAjaxProgress;
}

AjaxIndicator.prototype.reposition = function()
{
    var foregroundElement = document.getElementById(this.foregroundId);
    var scrollTopLoc = document.body.scrollTop;
    if (scrollTopLoc == 0)
    {
        if (window.pageYOffset) 
            scrollTopLoc = window.pageYOffset;
        else
            scrollTopLoc = (document.body.parentElement) ? document.body.parentElement.scrollTop : 0;
    }
    foregroundElement.style.top = 150 + scrollTopLoc + "px";
}

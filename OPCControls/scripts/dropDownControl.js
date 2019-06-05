function DropDownList(elementId)
{
	this.Id = elementId;
	this.SelectElement = document.getElementById(this.Id);
};

DropDownList.prototype.Id;
DropDownList.prototype.SelectElement;

DropDownList.prototype.clearOptions = function()
{
	var selectParentNode = this.SelectElement.parentNode;
	var newSelectObj = this.SelectElement.cloneNode(false); // Make a shallow copy
	selectParentNode.replaceChild(newSelectObj, this.SelectElement);
	this.SelectElement = newSelectObj;
	return newSelectObj;
}

DropDownList.prototype.addOption = function(optionText, optionValue)
{
	var elOptNew = document.createElement('option');
	elOptNew.text = optionText;
	elOptNew.value = optionValue;
	try
	{
		this.SelectElement.add(elOptNew, null); // standards compliant; doesn't work in IE
	}
	catch(ex)
	{
		this.SelectElement.add(elOptNew); // IE only
	}
}


DropDownList.prototype.value = function()
{
	var selIndex = this.SelectElement.selectedIndex;
	if((this.SelectElement.options.length > 0) && (this.SelectElement.options[selIndex] != null))
	{
		return this.SelectElement.options[selIndex].value;
	}
	return '';	
}

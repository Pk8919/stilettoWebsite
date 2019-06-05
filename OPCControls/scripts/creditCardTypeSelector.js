function getCardType(number)
{
	var re = new RegExp("^4");
	if(number.match(re) != null)
	{
	    return "Visa";
	}

	re = new RegExp("^(34|37)");
	if(number.match(re) != null)
	{
	    return "AmericanExpress";
	}

	re = new RegExp("^(6334|6767)");
	if (number.match(re) != null) 
	{
	    return "Solo";
	}

	re = new RegExp("^5[1-5]");
	if(number.match(re) != null)
	{
	    return "MasterCard";
	}

	re = new RegExp("^(5018|5020|5038|6304|6759|6761|6763)");
	if (number.match(re) != null) {
	    return "Maestro";
	}

	re = new RegExp("^6011");
	if(number.match(re) != null)
	{
	    return "Discover";
	}

	return "";
}

function setCreditCardType(e, ccTypeId, visaImageId, mcImageId, discImageId, amexImageId, soloImageId, maestroImageId, issueBoxId, securityCodeId, ccNumberId) {
    var ccNumber = e.target;
    if (ccNumber === undefined) {
        ccNumber = e.srcElement;
    }

    setElementOpacity(visaImageId, 'opacity25');
    setElementOpacity(mcImageId, 'opacity25');
    setElementOpacity(discImageId, 'opacity25');
    setElementOpacity(amexImageId, 'opacity25');
    setElementOpacity(soloImageId, 'opacity25');
    setElementOpacity(maestroImageId, 'opacity25');
    disableIssueBox(issueBoxId, true);

	if(ccNumber.value.length >= 4)
	{
		var cardType = getCardType(ccNumber.value);		
		var cardTypeHidden = document.getElementById(ccTypeId);
		cardTypeHidden.value = cardType;
		var securityCode = document.getElementById(securityCodeId);
		securityCode.setAttribute('maxlength', 3);
		var ccNumber = document.getElementById(ccNumberId);
		ccNumber.setAttribute('maxlength', 16);

		if (cardType == "Visa") {
		    setElementOpacity(visaImageId, 'opacity100');
		}
		else if (cardType == "MasterCard") {
		    setElementOpacity(mcImageId, 'opacity100');
		}
		else if (cardType == "AmericanExpress") {
		    setElementOpacity(amexImageId, 'opacity100');
		    securityCode.setAttribute('maxlength', 4);
		    ccNumber.setAttribute('maxlength', 15);
		}
		else if (cardType == "Solo") {
		    setElementOpacity(soloImageId, 'opacity100');
		}
		else if (cardType == "Discover") {
		    setElementOpacity(discImageId, 'opacity100');
		}
		else if (cardType == "Maestro") {
		    setElementOpacity(maestroImageId, 'opacity100');
		    disableIssueBox(issueBoxId, false);
		}
	}
}

function disableIssueBox(issueBoxId, bool) {
    var element = document.getElementById(issueBoxId);
    
    if ((element != null) && (typeof (element) != 'undefined')) {
        element.disabled = bool;
        element.value = '';
    }
}

function setElementOpacity(eleId, opacityClass)
{
	var element = document.getElementById(eleId);
    if ((element != null) && (typeof (element) != 'undefined'))
    {
		element.className = opacityClass;
    }
}

function pageLoad()
{
    hideOverlay();
}
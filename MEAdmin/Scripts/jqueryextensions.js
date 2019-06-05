function ToggleAppConfigStores(storeConfigTableElement) {
    var visible = $(storeConfigTableElement).find('.storeToggleRow:visible').length > 0;

    $(storeConfigTableElement).find('.storeToggleRow').toggle(!visible);
//    if (visible) {
//        $(storeConfigTableElement).removeClass("alternaterows");
//    }
//    else {
//        $(storeConfigTableElement).addClass("alternaterows");
//    }

    setAlternatingRows();
}


function setAlternatingRows() {
    $(".alternaterows tr:nth-child(even)").addClass("alternatingTR");
    if ($.browser.msie && $.browser.version.substr(0,1)<7) {
        $(".pnlOverAtomFixedButtons").height("500px");
    }
}
({
	clickCreateItem : function(component, event, helper) {
		var validItem = component.find('campingform').reduce(
            function ( validSoFar, inputComp ) {
                inputComp.showHelpMessageIfInvalid();
                return validSoFar && inputComp.get("v.validity").valid;
            }, true);
        
        if ( validItem ) {
            var newItem = component.get("v.newItem");
            console.log('JSON.stringigy(newItem): ' + JSON.stringify(newItem));
            helper.createItem(component, event, newItem);
        }
	},
})
({
	createItem : function(component, event, item) {
        
        var createItemEvent = component.getEvent("addItem");
        createItemEvent.setParams({"item": item});
        console.log('In helper : ' + JSON.stringify(item));
        component.set("v.newItem", { 'sobjectType': 'Camping_Item__c',
                    'Name': '',
                    'Quantity__c': 0,
                    'Price__c': 0,
                    'Packed__c': false });
        createItemEvent.fire();
        
	}
})
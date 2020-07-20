({
    createItem : function(component, newItem) {
        
		var action = component.get("c.saveItem");
        action.setParams({'item': newItem});
        
        action.setCallback(this, function(response) { 
        	var state = response.getState();
            if (state === "SUCCESS") {
                var savedItem = response.getReturnValue();
                var theItems = component.get("v.items");
                theItems.push(savedItem);
                component.set("v.items", theItems);
                component.set("v.newItem", 
                              	{'sobjectType' : 'Camping_Item__c',
                             	'Quantity__c' : 0,
                             	'Price__c' : 0
								})
            }
        });
        
        $A.enqueueAction(action);

    }
})
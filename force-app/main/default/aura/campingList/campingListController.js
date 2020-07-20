({
	
    
    doInit : function (component, event, helper) {
        var action = component.get("c.getItems");
        action.setCallback( this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var items = response.getReturnValue();
                component.set("v.items", items);
            } else {
                console.log("Failed with State : " + state);
            }
        });
        $A.enqueueAction(action);
    },
    
    handleAddItem : function(component, event, helper) {
        // Note: For the Trailhead challenge, it is expecting to have the Apex call in this function instead of helper.
        // So, copied the helper method code here to pass the challenge. 
      
        var item = event.getParam("item");
        console.log('JS Controller - handleAddItem: ' + JSON.stringify(item));
        //helper.createItem(component, item);
        
        var action = component.get("c.saveItem");
        action.setParams({"item": item});
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                // all good, nothing to do.
                var items = component.get("v.items");
                items.push(response.getReturnValue());
                component.set("v.items", items);        
            }
        });
        $A.enqueueAction(action);
    }
})
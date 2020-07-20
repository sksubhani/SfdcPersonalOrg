({
	getAccts : function(component, event, helper) {
        
        var retrieveAccountsEvent = component.getEvent("retrieveAccounts");
        console.log('Firing event...' + retrieveAccountsEvent);
        retrieveAccountsEvent.fire();
        
	},
    
    handleAccounts : function(component, event, helper) {
        
        var action = component.get("c.getAllAccounts");
        console.log('Calling the Apex service.');
        
        action.setCallback(this, function (response)  {
           console.log('Callback received from Apex');
           var state  = response.getState();
           console.log('State: ' +  state) ;
            
           if (state === "SUCCESS") {
               //console.log('Result : ' + JSON.stringify(response.getReturnValue()));
               var result = response.getReturnValue();
               component.set("v.accounts", result);
            } else {
                console.log('No accounts found.');
            }
        });
        $A.enqueueAction(action);
    }
})
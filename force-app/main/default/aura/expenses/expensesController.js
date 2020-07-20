({
	
    
    doInit : function (component, event, helper) {
        
        var action = component.get("c.getExpenses");
        //console.log("Action Name: " + action.getName());
        
        action.setCallback( this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.expenses", response.getReturnValue());
            } else {
                console.log("Failed with State : " + state);
            }
        });
        
        $A.enqueueAction(action);
    },
    
	handleUpdateExpense: function(component, event, helper) {
        var updatedExp = event.getParam("expense");
        helper.updateExpense(component, updatedExp);
    },
    
    handleCreateExpense : function(component, event, helper) {
        var newExpense = event.getParam("expense");
        helper.createExpense(component, newExpense);
    },

})
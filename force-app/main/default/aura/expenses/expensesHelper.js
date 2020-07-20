({
    
    saveExpense : function(component, expense, callback) {
        var action = component.get("c.saveExpense");
        action.setParams({"expense" : expense});
        if (callback) {
            action.setCallback(this, callback);
        }
        $A.enqueueAction(action);
    },

    createExpense : function(component, expense) {
        
        // saveExpense() method is defined below and takes 3 params. But, JavaScript handles 
        // this method though the params are missing. ie. method overloading concept.
        // If the third param (callback) is not received, it treats as blank.
        // In this case, callback is set. When the callback is called, system executes the
        // anonymous function 'function(response)' will be called.
        // 
        // We are calling the callback and setting the results because, we did not have complete 
        // scope of 'expenses' results to be shown after adding (createExpense) new expense. 
        // i.e we did not use the event handler in this case.
        this.saveExpense(component, expense, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var expenses = component.get("v.expenses");
                expenses.push(response.getReturnValue());
                component.set("v.expenses", expenses);
            }
        });
    },
    
    updateExpense : function(component, expense) {
        //alert('In controller helper: ' + JSON.stringify(expense));
        // In this case, the callback is not set. Hence, the response not not explicitly received in callback section.
        // We are not calling / setting callback feature because we are using the 'events'. The event handler automatically
        // handles updating the saved expense response back in the section where it was updated in the form.
        this.saveExpense(component, expense);
    }
    
    /*createExpense: function(component, expense) {
        
        var action = component.get("c.saveExpense");
        action.setParams(	{
            				"expense" : expense
        					}
                        );
        
        action.setCallback(this, function (response) {
            var state = response.getState();
            if (state == "SUCCESS") {
                var theExpenses = component.get("v.expenses");
                var savedExpense = response.getReturnValue();                
               	theExpenses.push(savedExpense);
        		component.set("v.expenses", theExpenses); 
            }
        });
        $A.enqueueAction(action);
    },*/
    
    /*updateExpense : function(component, expense) {
        var action = component.get("c:saveExpense");
        action.setParams({"expense" : expense});
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                
            }
        });
        $A.enqueueAction(action);
    }*/
})
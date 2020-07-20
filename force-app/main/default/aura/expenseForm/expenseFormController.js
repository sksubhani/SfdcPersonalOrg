({
	clickCreate : function(component, event, helper) {
		var validExpense = component.find('expenseform').reduce(
            function ( validSoFar, inputComp ) {
                inputComp.showHelpMessageIfInvalid();
                return validSoFar && inputComp.get("v.validity").valid;
            }, true);
        
        if (validExpense) {
            var newExpense = component.get("v.newExpense");
            
            console.log('newExpense: ' + newExpense);
            console.log('JSON.stringigy(newExpense): ' + JSON.stringify(newExpense));
            
            helper.createExpense(component, newExpense);
        }
	},
})
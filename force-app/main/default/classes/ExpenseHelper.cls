global class ExpenseHelper implements Comparable {

    public Expense__c exp;
    public ExpenseHelper(Expense__c e) {
        exp = e;
    }
    
    global Integer compareTo(Object compareToObj) {
        ExpenseHelper compareExpense = (ExpenseHelper) compareToObj;
        Integer returnValue = 0;
        
        if (exp.Amount__c > compareExpense.exp.Amount__c)
            returnValue = 1;
        else if (exp.Amount__c < compareExpense.exp.Amount__c)
            returnValue = -1;
        
        return returnValue;
    }
}

/*
// Code to run in Async Window for Testing the sorting.

List<Expense__c> expenses = new List<Expense__c>();
Integer i = 1;
Expense__c e;
while (i <= 10) {
    e = new Expense__c();
    e.Name = 'Book ' + i;
    e.Amount__c = 100 - (i * 10);
    e.Client__c = (Math.mod(i, 2) == 0) ? 'Sales Connect' : 'SNAP';
    e.Date__c = System.today();
    e.Reimbursed__c = (Math.mod(i, 2) == 0) ? true : false;
    i += 1;
    expenses.add(e);
}

List<ExpenseHelper> expensesList = new List<ExpenseHelper>();
ExpenseHelper eee;

for (Expense__c e : expenses) {
    eee = new ExpenseHelper(e);
    expensesList.add(eee);
}

System.debug('Before sorting...');
for (ExpenseHelper e : expensesList) {
    Expense__c ex = e.exp;
    System.debug('Expense Name: ' + ex.Name + ', Amount: ' + ex.Amount__c + ', Client: ' + ex.client__c + ', Date : ' + ex.Date__c + ', Reiumbursed : ' + ex.Reimbursed__c);
}

expensesList.sort();

System.debug('After sorting...');
for (ExpenseHelper e : expensesList) {
    Expense__c ex = e.exp;
    System.debug('Expense Name: ' + ex.Name + ', Amount: ' + ex.Amount__c + ', Client: ' + ex.client__c + ', Date : ' + ex.Date__c + ', Reiumbursed : ' + ex.Reimbursed__c);
}

*/
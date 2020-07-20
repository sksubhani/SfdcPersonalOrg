trigger AccountAddressTrigger on Account (before insert, before update) {
    List<Account> acctsToUpdate = new List<Account>();
    
    for (Account a : Trigger.New) {
        if (a.Match_Billing_Address__c) {
            a.ShippingPostalCode = a.BillingPostalCode;
        	//acctsToUpdate.add(a);   
        }
    }
    // Note: before insert and before update triggers does not required DML operation. If we update the record, 
    // the trigger will automatically perform the DML at the end of the transaction. Hence, below statement is not required.
    /*if (!acctsToUpdate.isEmpty())
    	upsert acctsToUpdate;*/
        
}
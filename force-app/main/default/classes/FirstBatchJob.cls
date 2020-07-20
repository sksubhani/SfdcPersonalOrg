global class FirstBatchJob implements Database.Batchable<SObject>, Database.Stateful {
    
    global Integer numberOfAccountsUpdated = 0;
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('select Id, Name from Account where Name Like \'Subhani%\'');
    }
    
    global void execute(Database.BatchableContext bc, List<Account> accounts) {
        for (Account a : accounts) {
            a.Box_Folder_ID__c = a.ID + 'SBN';
            numberOfAccountsUpdated += 1;
        }
        update accounts;
    }
    
    global void finish(Database.BatchableContext bc) {
        System.debug('Number of accounts updated with box id : ' + numberOfAccountsUpdated);
        
    }

}
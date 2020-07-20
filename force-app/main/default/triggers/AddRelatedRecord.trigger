trigger AddRelatedRecord on Account (after insert, after update) {

    List<Opportunity> acctsToCreateOpptys = new List<Opportunity>();
    Opportunity oppty;
    /*Map<Id, Account> acctsOpptys = 
        new Map<Id, Account>([select Id, Name,  (Select Id from Opportunities) from Account 
                              where Id in :Trigger.New]);
    Opportunity oppty; // = new Opportunity();
    
    for (Id acctId : acctsOpptys.keySet()) {
        if (acctsOpptys.get(acctId).Opportunities.size() == 0) {
            oppty = new Opportunity(Name = 'Opportunity from Account Trigger for Account ' + acctsOpptys.get(acctId).Name, 
                                    accountId = acctId, stageName = 'Prospecting', closeDate = System.today().addMonths(1));
            System.debug('Creating an Opportunity for Account ' + acctsOpptys.get(acctId).Name);
            acctsToCreateOpptys.add(oppty);
        }
    }*/
    
    for(Account a : [SELECT Id,Name FROM Account WHERE Id IN :Trigger.New AND
                                         Id NOT IN (SELECT AccountId FROM Opportunity)]){
            System.debug('Creating an Opportunity for Account ' + a.Name);
            acctsToCreateOpptys.add(new Opportunity(Name = 'Opportunity from Account Trigger for Account ' + a.Name, 
                                                    accountId = a.Id, 
                                                    stageName = 'Prospecting', 
                                                    closeDate = System.today().addMonths(1)));                              
    }
    
    if (acctsToCreateOpptys != null && acctsToCreateOpptys.size() > 0) 
        insert acctsToCreateOpptys;
    System.debug('Inserted ' + acctsToCreateOpptys.size() + ' Opportunities from AddRelatedRecord Trigger.');
}
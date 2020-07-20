public class ApexBatchThrowingExceptionDemo implements Database.Batchable<SObject>, Database.Stateful {
	public String status;    
    
    public Database.QueryLocator start(Database.BatchableContext ctx) {
        status = 'Started';
        System.debug('In start : ' + System.now().getTime());
        return Database.getQueryLocator([select id, name from opportunity limit 2]);
    }
    
    public void execute(Database.BatchableContext ctx, List<SObject> scope) {
        System.debug('In execute ' + System.now().getTime());
        status = 'Submitted';
        
        System.debug('status ' + status);
        try {
            Opportunity oppty = [select id from Opportunity where id = ''];
        } catch (Exception e) {
            System.debug('Exception in execute()' + e);
            status = 'Failed';
            throw e;
        }
    }
    
    public void finish(Database.BatchableContext ctx) {
        System.debug('In finish ' + System.now().getTime());
        System.debug('status ' + status);
        Account a = new Account(Name='Exception Account');
        insert a;
    }

}
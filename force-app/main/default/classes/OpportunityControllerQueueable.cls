public class OpportunityControllerQueueable implements Queueable {
	public List<Account> accts;
	public List<Opportunity> opptys;
    
    public OpportunityControllerQueueable() {
        System.debug('In OpportunityControllerQueueable default Constructor.');
        this.opptys = new List<Opportunity>();
        this.accts = new List<Account>();
    }
    
    public OpportunityControllerQueueable(List<Account> accounts) {
        System.debug('In OpportunityControllerQueueable argument Constructor.');
        //OpportunityControllerQueueable();
        if (this.accts == null) 
        	this.accts = new List<Account>();
		
        this.accts = [select Id, Name from Account where Id in :accounts];
    }
    
    public void execute(QueueableContext context) {
        System.debug('In OpportunityControllerQueueable execute() method.');
        Integer index = 0;
        for (Account acct : accts) {
            //opptys.add(new Opportunity(Name='Queueable Opportunity ' +  (index++), AccountId=acct.Id));
        }
        //insert opptys;
        System.debug('Inserted all opportunities...');
    }
}
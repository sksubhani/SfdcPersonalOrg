// Aim: I want to create Accounts first. Once this batch job completed, Create Opportunities using Opportunity batch job.

public class AccountControllerQueueable implements Queueable {    
    public List<Account> accts;
    
    public AccountControllerQueueable() {
        System.debug('In AccountControllerQueueable Constructor.');
        this.accts = new List<Account>();
    }
    
    public void execute(QueueableContext context) {
        System.debug('In AccountControllerQueueable execute() method.');
        
        for (Integer i=0; i<5; i++) {
            accts.add(new Account(Name='Queueable Account ' + i));
        }
        insert accts;
        System.debug('Inserted all accounts... Now calling to enqueue OpportunityControllerQueueable job');
        
        System.enqueueJob(new OpportunityControllerQueueable(accts));
    }
}
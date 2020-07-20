// Aim: Create 100 Accounts, with a batch of 10. We will maintain a Queue and add each batch to the Queue.
public class QueueableApexDemo implements Queueable {
    
    public List<Account> accts;
    
    public QueueableApexDemo() {
        accts = new List<Account>();
    }
    
    public void execute(QueueableContext context) {
        for (Integer i=0; i<100; i++) {
            this.accts.add(new Account(Name='Queueable Account ' + i));
        }
        insert this.accts;
    }
}
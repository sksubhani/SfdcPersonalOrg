public class ParentBatchProcessDemo implements Database.Batchable<Account> {
    
    public ParentBatchProcessDemo(){
        System.debug('In ParentBatchProcessDemo constructor.');
    }
    
    public static List<Account> start(Database.BatchableContext context) {
        System.debug('In ParentBatchProcessDemo start method.');
        List<Account> acctList = new List<ACcount>();
        return acctList;
    }
    
    public static void execute(Database.BatchableContext context, List<Account> acctList) {
        System.debug('In ParentBatchProcessDemo execute method.');
    }
    
    public static void finish(Database.BatchableContext context) {
        System.debug('In ParentBatchProcessDemo finish method.');
        System.debug('Calling ChildBatchProcessDemo.');
        
        ChildBatchProcessDemo childBatch = new ChildBatchProcessDemo();
        Database.executeBatch(childBatch);
    }
}
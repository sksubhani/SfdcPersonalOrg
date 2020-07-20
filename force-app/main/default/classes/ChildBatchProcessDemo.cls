public class ChildBatchProcessDemo implements Database.Batchable<Contact> {
    
    public ChildBatchProcessDemo(){
        System.debug('In ChildBatchProcessDemo constructor.');
    }
    
    public static List<Contact> start(Database.BatchableContext context) {
        System.debug('In ChildBatchProcessDemo start method.');
        List<Contact> contactList = new List<Contact>();
        return contactList;
    }
    
    public static void execute(Database.BatchableContext context, List<Contact> contactList) {
        System.debug('In ChildBatchProcessDemo execute method.');
    }
    
    
    
    public static void finish(Database.BatchableContext context) {
        System.debug('In ChildBatchProcessDemo finish method.');
        
        InvokeBatchDemo.finishAllBatches();
    }
}
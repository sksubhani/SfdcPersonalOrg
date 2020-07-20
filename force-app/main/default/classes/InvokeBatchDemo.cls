public class InvokeBatchDemo {
    public static void invokeBatch() {
        ParentBatchProcessDemo parentBatch = new ParentBatchProcessDemo();
        Database.executeBatch(parentBatch);
    }
    
    public static void finishAllBatches() {
        System.debug('Finished all batches and running finishAllBatches() in main class.');
    }
}
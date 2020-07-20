//global class RenewalNotebookOpportunityBatch implements Database.Batchable<SObject> {
global class RenewalNotebookOpportunityBatch implements Database.Batchable<SObject>, Database.Stateful {
    
    /*global List<RenewalNotebookController.SearchResult> start(Database.BatchableContext context) {
        return null;
    }*/
    
    global List<Opportunity> start(Database.BatchableContext BC) {
        return null;
    }
    
    /*global void execute(Database.BatchableContext context, List<RenewalNotebookController.SearchResult> searchResults) {
        
    }*/
    
    global void execute(Database.BatchableContext BC, List<Opportunity> scope) {
    }
    
    /*global void finish() {  
    }*/
    
    global void finish(Database.BatchableContext BC) {
    }

}
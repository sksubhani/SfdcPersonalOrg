global class LeadProcessor implements Database.Batchable<SObject>, Database.Stateful {
    
    global Integer leadCount = 0;
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('select Id from Lead');
    }
    
    global void execute(Database.BatchableContext bc, List<Lead> leads) {
        for (Lead l : leads) {
            l.leadsource = 'Dreamforce';
            leadCount +=1 ;
        }
        update leads;
    }
    
    global void finish(Database.BatchableContext bc) {
        System.debug('Total leads updated with lead source: ' + leadCount);
    }

}
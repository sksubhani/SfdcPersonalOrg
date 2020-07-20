trigger ExampleTrigger on Contact (after insert, after delete) {
    if (Trigger.isInsert) {
        Integer newRecordCount = Trigger.New.size();
        //Integer oldRecordCount = Trigger.Old.size();
        
        EmailManager.sendMail('sk_subha@yahoo.com', 'Trailhead Trigger Tutorial', 
                    newRecordCount + ' contact(s) were inserted.');
        
        System.debug('Record Count: ' + newRecordCount);
        //System.debug('Record Count: ' + oldRecordCount);
        //
        for (Contact c : Trigger.New) {
            System.debug('Contact being inserted: ' + c);
        }
    } else if (Trigger.isDelete) {
        // Process delete here.
    }
}
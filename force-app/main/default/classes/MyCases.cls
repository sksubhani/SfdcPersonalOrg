global class MyCases {
    webservice static String helloError() {
        if (true)
        	throw new SampleException('This is custom Exception.');
        return 'SUCCESS';
    }
    
    webservice static String successMethod() {
        return '001f40000069pHy';
    }
    
    webservice static String hello() {
        return 'Hello';
    }
    
    webservice static String generateValidationError() {
        
        SavePoint sp = Database.setSavePoint();
        System.debug('Save point: ' + sp);
        
        SavePoint spx = Database.setSavePoint();
        System.debug('Save point: ' + spx);
        
        MyCase__c c = new MyCase__c();
        c.Name = 'Test case';
        c.status__c = 'Closed';
        upsert c; // This shuld throw an error. Status can notbe clsoed - There is a validation rule.
        return 'SUCCESS';
    }
}
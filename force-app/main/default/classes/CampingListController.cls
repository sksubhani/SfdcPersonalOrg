public with sharing class CampingListController {
	
    @AuraEnabled
    public static List<Camping_Item__c> getItems() {
        
        return [select Id, Name, Price__c, Quantity__c, Packed__c, CreatedDate from Camping_Item__c];
        
    }
    
    @AuraEnabled
    public static Camping_Item__c saveItem(Camping_Item__c item) {
        
        System.debug('item : ' + item);
        upsert item;
        return item;
    }
}
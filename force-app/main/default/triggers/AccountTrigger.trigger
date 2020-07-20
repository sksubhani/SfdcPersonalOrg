trigger AccountTrigger on Account (after insert, after update) {
    public static Map<Id, Account> staticAcctMap;
    if (staticAcctMap == null) {
        staticAcctMap = new Map<Id, Account>();
        System.debug('static map is null. Init....');
    }
        
    
    System.debug('In AccountTrigger......' + Trigger.new);
    
    Map<Id, Account> acctMap = new Map<Id, Account>(Trigger.new);
    Set<ID> staticAccts = staticAcctMap.keySet();   
    
    if (!staticAccts.containsAll(acctMap.keySet()))
        AccountHelper.displayAccount(acctMap.values());
    
    staticAcctMap.putAll(acctMap);
    System.debug('static acct map size: ' + staticAcctMap.size());
    

}
public class SortAccounts {
    
    public static void sortAccounts(){
    	List<Account> accts = [select Id, Name, Account_Status__c from Account limit 10];
        System.debug('Before sorting...');
        for (Account a : accts)
            System.debug(a.Name + ' , ' + a.Account_Status__c);
       
        sortAccounts(accts);
    }
    
    public static void sortAccounts(Account[] accts) {

        System.debug('After sorting...');
        accts.sort();
        try {
        	for (Account a : accts)
            	System.debug(a.Name + ' , ' + a.Account_Status__c);
        } catch (Exception e) {
            System.debug('Exception occurred: ' + e);
        }
    }    
}
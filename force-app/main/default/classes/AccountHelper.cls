public class AccountHelper {
    public static void displayAccount(List<Account> acctList) {
        for (Account a: acctList) {
            System.debug('Acct Name: ' + a.Name);
            a.SBN1__TestField2__c = '';
        }	
    }
}
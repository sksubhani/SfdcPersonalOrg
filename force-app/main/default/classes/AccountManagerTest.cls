@isTest
public class AccountManagerTest {
    @istest
    public static void testGetAccount() {
        Account acct = new Account(Name = 'Test Account');
        insert acct;
        
        RestRequest request = new RestRequest();
        request.requestURI = '/services/apexrest/accounts/' + acct.Id + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        
        Account a = AccountManager.getAccount();
        
        System.debug('Account received: ' + a);
        
        System.assert(a != null, 'Account not found');
    }
}
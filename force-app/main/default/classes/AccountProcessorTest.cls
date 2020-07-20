@isTest
public class AccountProcessorTest {
	@isTest
    public static void countAccountContacts() {
        List<Id> accountIds = new List<Id>();
        
        List<Account> accounts = new List<Account>(); 
        Account a1 = new Account (Name = 'Test Account 1');
        Account a2 = new Account (Name = 'Test Account 2');
        accounts.add(a1);
        accounts.add(a2);
        insert accounts;
        
        List<Contact> contacts = new List<Contact>();
        Contact a1c1 = new Contact(FirstName = 'Test Account 1', LastName ='Contact 1', accountId = a1.Id);
        Contact a1c2 = new Contact(FirstName = 'Test Account 1', LastName ='Contact 2', accountId = a1.Id);

        Contact a2c1 = new Contact(FirstName = 'Test Account 2', LastName ='Contact 1', accountId = a2.Id);
        Contact a2c2 = new Contact(FirstName = 'Test Account 2', LastName ='Contact 2', accountId = a2.Id);
        Contact a2c3 = new Contact(FirstName = 'Test Account 2', LastName ='Contact 3', accountId = a2.Id);
        Contact a2c4 = new Contact(FirstName = 'Test Account 2', LastName ='Contact 4', accountId = a2.Id);        
        
		contacts.add(a1c1);
        contacts.add(a1c2);
        contacts.add(a2c1);
        contacts.add(a2c2);
        contacts.add(a2c3);
        contacts.add(a2c4);
        insert contacts;
        
        for (Account account : accounts) {
            List<Contact> ccs = [select Id, Name from Contact where contact.account.id = :account.id];
            System.debug('contacts in account ' + ccs.size());
			accountIds.add(account.Id);
        }
        System.debug('Accoutns sending: ' + accountIds.size());
        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();
    }
}
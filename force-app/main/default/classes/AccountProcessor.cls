public class AccountProcessor {

    @future (callout = true)
    public static void countContacts(List<Id> accountIds) {
        Integer totalContacts = 0;
        System.debug('Account IDs received: ' + accountIds.size());
        List<Account> accounts = [select Id, Name from Account where Id IN :accountIds];    
        System.debug('Accounts received: ' + accounts.size());
        for (Account a : accounts) {
            List<Contact> c = [select Id, Name from contact where contact.account.id = :a.id];
            System.debug('c.size ' + c.size());
            List<AggregateResult> contacts = [select count(Contact.Id)cnt from Contact where contact.account.Id = :a.Id];
            Integer contactsInAccount = (Integer) contacts.get(0).get('cnt');
            System.debug('contacts in account: ' + contactsInAccount);
            a.Number_of_Contacts__c = contactsInAccount;
            totalContacts += contactsInAccount;
            
            update a;
        }
        System.debug('Total contacts in all accounts: ' + totalContacts);
    }
}
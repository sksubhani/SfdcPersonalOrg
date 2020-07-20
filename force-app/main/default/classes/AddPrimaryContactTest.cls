@isTest
public class AddPrimaryContactTest {
    
    @testSetup()
    public static void setUp() {
        List<Account> accountsNY = new List<Account>();
        List<Account> accountsCA = new List<Account>();
        for (Integer i=0; i<50; i++) {
            Account aNyy = new Account (Name = 'Test Account for Queueable apex batch NY' + i, billingState = 'NY');
            Account aCa = new Account (Name = 'Test Account for Queueable apex batch CA' + i, billingState = 'CA');
            accountsNY.add(aNyy);
            accountsCA.add(aCa);
        }
        insert accountsNY;
        insert accountsCA;
    }
    
	@isTest
    public static void testAddPrimaryContact() {
     	String stateName = 'NY';
        Contact c = new Contact(FirstName = 'Test First Name', LastName = 'Same Child');
        
        Test.startTest();
        AddPrimaryContact ap = new AddPrimaryContact(c, stateName);
        Id jobId = System.enqueueJob(ap);
        Test.stopTest();
        List<Account> accountsNY = [select Id, Name from Account where billingState = 'NY' and Name LIKE 'Test Account for Queueable apex batch'];
        for (Account a : accountsNY) {
        	System.assertEquals(1, [select count() from Contact where contact.account.Id = :a.Id]);    
        }
        
    }
    
}
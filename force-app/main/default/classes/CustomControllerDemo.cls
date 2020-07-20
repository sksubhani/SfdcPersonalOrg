public class CustomControllerDemo {
    private Account myAccount; // {set;}
    private String acctId {get; set;}
    
    public CustomControllerDemo() {
        acctId = ApexPages.currentPage().getParameters().get('id');
    	List<Account> accts = [select Id, Name from Account where Id = :acctId limit 1];
        if (!accts.isEmpty())
            myAccount = accts.get(0);
    }
    
    public Account getMyAccount() {
        if (myAccount == null)
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Please send the Account ID in the Parameters with name id.'));
        return myAccount;
    }
    
    public PageReference save() {
        System.debug('Save called.');
        update myAccount;
        return null;
    }
}
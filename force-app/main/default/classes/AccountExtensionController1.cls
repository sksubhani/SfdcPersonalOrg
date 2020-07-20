public class AccountExtensionController1 {
	public Account myAccount;
    String acctId;
    
    public AccountExtensionController1(ApexPages.StandardController stdController) {
        acctId = stdController.getRecord().Id;
        List<Account> accts = [select Id, Name, Rating from Account where Id = :acctId];
        if (!accts.isEmpty())
            myAccount = accts.get(0);
    }
    
    public Account getMyAccount() {
        return myAccount;
    }
    
    public PageReference customSave() {
        myAccount.Rating = 'Hot';
        update myAccount;
        return null;
    }
}
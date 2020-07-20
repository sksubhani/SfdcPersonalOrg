public class AccountExtensionController {
	
    private final Account acct; // {get; set;}
    
    public AccountExtensionController(ApexPages.StandardController stdController) {
        this.acct = (Account) stdController.getRecord();
        System.debug('Account Id passed from Standard controller: ' + acct.Id);
    }
    
    public void save() {
        this.acct.Name = 'My Acct Name - Account Name Overridden in Controller Extension';
        update this.acct;
    }    
}
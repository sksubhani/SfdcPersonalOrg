public class AccountControllerExtension {
	
    public Account acct; // {get; set;}
    
    public String acctName {get; set;}
    
    public AccountControllerExtension() {
    	System.debug('Inside AccountControllerExtension default constructor...');    
    }
    
    public AccountControllerExtension(ApexPages.StandardController stdController) {
        System.debug('Inside AccountControllerExtension parameterized constructor...');
        this.acct = (Account) stdController.getRecord();
        //acctName = this.acct.Name;
        System.debug('Controller: ' + stdController);
        System.debug('acct before: ' + acct);
        System.debug('acctName before: ' + acctName);
    }
    
    public PageReference changeAcctName() {
        System.debug('Inside changeAcctName() method..., acct - ' + acct);
        System.debug('Inside changeAcctName() method..., acctName - ' + acctName);
        acctName = acct.Name;
        System.debug('Inside changeAcctName() method..., acctName - ' + acctName);
        return null;
    }
}
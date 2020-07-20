public class AccountCustomController {
    
    public String acctName {get; set;}
    public String acctName1 {get; set;}
    
    public AccountCustomController() {
    	System.debug('AccountCustomController - Default constructor invoked.');
        acctName1 = ApexPages.currentPage().getParameters().get('acctName1');
        System.debug('AccountCustomController - Default constructor invoked and input parameter received ' + acctName1);
    }
    
    
    public void fetchAccounts() {
    	System.debug('AccountCustomController - fetchAccounts() method invoked.'); 
        System.debug('AccountCustomController - fetchAccounts() method - ' + acctName);
		
    }
}
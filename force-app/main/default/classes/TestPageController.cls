public class TestPageController {
    
    public Id notebookId {get; set;}
    
    public TestPageController() {
    	notebookId = null;
    }
    
    public PageReference saveCriteria() {
        
        System.debug('Id received: ' + ApexPages.currentPage().getParameters().get('id'));
        List<Account> accts = [select Id from Account limit 1];
        Id acctId = accts.get(0).Id;
        PageReference ref = new PageReference('/apex/TestPage');
        ref.getParameters().put('id', acctId);
        notebookId = acctId;
        return ref;
    }
}
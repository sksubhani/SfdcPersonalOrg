public class MyBugController {
    public MyBug__c bug;
    
    public MyBugController(ApexPages.StandardController stdController) {
        bug = (MyBug__c) stdController.getRecord();
    } 
    
    public PageReference redirectView() {
        System.debug('In Controller Extensions.... redirectView()');
        PageReference ref = Page.MyBugViewOverride;
        System.debug('PageRef : ' + Page.MyBugViewOverride + '\n' + ref);
        return ref;
    }
}
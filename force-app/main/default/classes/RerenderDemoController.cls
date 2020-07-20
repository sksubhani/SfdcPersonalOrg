public class RerenderDemoController {
    public List<Account> accts {get; set;}
    public Boolean pageLoad {get; set;}
    public String userName {get; set;}
    public Boolean displaySearchCriteria {get; set;}
    
    public RerenderDemoController() {
        pageLoad = true;
        userName = 'My First Name';
        accts = [select id, name from Account limit 10];
        System.debug('pageLoad in constructor: ' + pageLoad);        
    }
    
    public void editSearchResult() {
        pageLoad = false;
        accts = [select id, name from Account limit 20];
        userName = 'My Last Name';
        System.debug('pageLoad in editSearchResult: ' + pageLoad);
    }
    
    public Boolean getDisplaySearchCriteria() {
        System.debug('pageLoad in getDisplaySearchCriteria: ' + pageLoad);
        return pageLoad;        
    }
}
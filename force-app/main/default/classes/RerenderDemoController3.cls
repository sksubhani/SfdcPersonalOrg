public class RerenderDemoController3 {    

    public String mode {get; set;}
    public List<Account> accts {get; set;}    
    
    public RerenderDemoController3() {
        System.debug('pageLoad in constructor...');
        mode = 'pageLoad';
        accts = [select id, name from Account limit 10];
    }
    
    public void editSearchResult() {
        mode = 'EditResult';
        System.debug('In editSearchResult...');
    }
    
    public boolean getDisplaySearchCriteria() {
        System.debug('In getDisplaySearchCriteria... with mdoe : ' + mode);
        
        return (mode == 'EditResult') ? false : true;
        
        // return (mode != 'EditResult' && mode != 'AddNewResult' ) ? false : true;
    }
    
    public boolean getDisplaySearchResults() {
        System.debug('In getDisplaySearchResults... with mdoe : ' + mode);
        
        return (mode == 'EditResult') ? false : true;
    }
}
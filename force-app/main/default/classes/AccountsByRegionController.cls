public class AccountsByRegionController {
    public String region {get; set;}
    public Account account {get; set;}
    public List<Account> acctListByRegion;
    
    public List<Account> getAccountByRegion() {
        System.debug('In getAccountByRegion');
        //region = //ApexPages.currentPage().getParameters().get('region');
        System.debug('Region received : ' + account.region__c);
        return null;
    } 
}
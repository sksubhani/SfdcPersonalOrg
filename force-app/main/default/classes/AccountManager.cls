@RestResource(urlMapping='/accounts')
global class AccountManager {
	@HttpGet
    global static Account getAccount() {
        RestRequest requestContext = RestContext.request;
        System.debug('RequestContext: ' + requestContext);
        System.debug('Resource Path: ' + requestContext.resourcePath);

        String baseUri = 'https://mysubha-dev-ed.my.salesforce.com';
        String basePath = '/services/apexrest/Accounts/';

        String requestUri = requestContext.requestUri; 
        System.debug('Request URI: ' + requestUri); //==> /services/apexrest/Accounts/001f4000008b4RgAAI/contacts
        
        String uriPath = requestContext.requestURI.substring(basePath.length());
        System.debug('URI Path: ' + uriPath); // ==> 001f4000008b4RgAAI/contacts
        
        String accountId = uriPath.substring(0, uriPath.indexOf('/'));
        System.debug('accountId: ' + accountId); // ==> 001f4000008b4RgAAI
        Account acct = [select Id, Name, (select Id, Name from Contacts) from Account where Id = :accountId];
        System.debug('acct: ' + acct);
        return acct;
    }
}
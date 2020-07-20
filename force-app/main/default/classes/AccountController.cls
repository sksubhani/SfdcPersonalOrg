public with sharing class AccountController {
  // Test Comment before commiting to Github.
  public static List<Account> getAllActiveAccounts() {
    return [SELECT Id,Name,Active__c FROM Account WHERE Active__c = 'Yes'];
  }
}
public with sharing class VsCode_AccountController {

    public static List<Account> getAllActiveAccounts() {
        return [SELECT Id,Name FROM Account limit 10];
    }
}
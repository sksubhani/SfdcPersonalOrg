@isTest 
public class AccountTriggerTest {
    @isTest public static void testAccuontTrigger() {
        List<Account> acctList = new List<Account>();
        for (Integer i=1; i<=10; i++) {
            Account a = new Account(Name = 'Account Name ' + i);
            acctList.add(a);
        }
        insert acctList;
        
        Account a = [select id, name, website from Account where name = 'Account Name 1'];
        a.Website = 'www.yahoo.com';
        upsert a;
    }
}
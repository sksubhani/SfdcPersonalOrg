public class AccountIdAssignDemo {
    public static void assignId() {
        Account a = [select Id, Name from Account limit 1];
        System.debug('a: ' + a);
        
        Account b = new Account(Id = a.Id, Name = 'Copied Account1');
        System.debug('b: ' + b);
        
        upsert b;
    }
}
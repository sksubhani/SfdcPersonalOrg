public class SelectQueryDemo {
    public static void simpleQueryWithNoRecords() {
      	List<Account> accts = [select id, name from Account where name = '343242342342'];
        System.debug('accts: ' + accts + ': ' + accts.size() + ', isnull: ' + (accts == null));

      	Contact contact = [select id, name from Contact where name = '343242342342'];
        System.debug('contact: ' + contact + ': ' + ', isnull: ' + (contact == null));        
    }
}
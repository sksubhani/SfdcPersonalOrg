public class ExceptionDemoWithNoRecords {

    public static void soqlWithNoRecords() {
        List<Account> accts;
        try {
        	accts = [select id, name from Account where name = 'sfsdfsdfdsf'];
        } catch(Exception e) {
            System.debug('Exception - No records: ' + e);
        }
        //System.debug('Successful.' + accts);
    }
}
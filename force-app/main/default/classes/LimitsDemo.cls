public class LimitsDemo {

    public static void limitsMethodDemo() {
        List<Account> acc = [SELECT ID FROM Account LIMIT 10];
		//delete acc;
        Database.emptyRecycleBin(acc);
        System.debug(Limits.getDMLStatements() + ', ' +Limits.getLimitDMLStatements());
        System.debug(Limits.getQueries() + ', ' + Limits.getLimitQueries());

    }
}
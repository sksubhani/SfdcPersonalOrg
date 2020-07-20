public class AccountAddressHandler {
    public static void updatePostalCodes(List<Account> accts) {
        if (!accts.isEmpty())
            upsert accts;
    }
}
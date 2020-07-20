@isTest
public class TestVerifyDate {
    @isTest public static void testCheckDates() {
        Date d1 = Date.today();
        Date d2 = d1.addDays(1);
        Date d3 = d1.addDays(30);
        VerifyDate.CheckDates(d1, d2);
        VerifyDate.CheckDates(d1, d3);
    }
}
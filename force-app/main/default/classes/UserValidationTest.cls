@isTest
public class UserValidationTest {
	@isTest
    public static void testGuestAdminUser() {
        List<User> users = [select Id, Name, email, username, isactive from User where username like '%guestadmin%'];
        for (User usr : users) {
            System.assertEquals(usr.isactive, false, 'The guest user ' + usr.username + ' is active.');
        }
    }
}
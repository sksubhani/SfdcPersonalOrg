@isTest
public class TestRestrictContactByName {
    
    @testSetup public static void setUpTestData() {
		
    }
    
	@isTest public static void testInvalidLastName() {
        Test.startTest();
        Contact c = new Contact (FirstName = 'Hello', LastName = 'INVALIDNAME');
        insert c;
        //Contact c = [select FirstName from Contact where FirstName = 'Hello'];
        Test.stopTest();
    }
}
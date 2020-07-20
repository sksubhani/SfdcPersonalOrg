@isTest
public class AnimalLocatorTest {
	@IsTest
    public static void testGetAnimalNameById()  {
    	Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String name = AnimalLocator.getAnimalNameById(1);
        System.assertEquals('bear', name, 'Name received: ' + name);
    }
}
@IsTest
public class AnimalsCalloutsTest {

    @IsTest
    public static void testGetCallout() {
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setHeader('content-type', 'application/json;charset=UTF-8');
        mock.setStaticResource('GetAnimalResource');
        mock.setStatusCode(200);
        
        Test.setMock(HttpCalloutMock.class, mock);
        HttpResponse response = AnimalsCallouts.getAnimals();
        
        System.assertEquals(200, response.getStatusCode());
        System.assertNotEquals(null, response.getBody());
    }
    
	@IsTest
    public static void testPostCallout() {
        
        Test.setMock(HttpCalloutMock.class, new AnimalsHttpCalloutMock());
        HttpResponse response = AnimalsCallouts.addAnimal();
        
        System.assertEquals(201, response.getStatusCode());
        System.assertNotEquals(null, response.getBody());
        Map<String, Object> animalMap = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        List<Object> animals = (List<Object>) animalMap.get('animals');
        
        System.assertEquals(4, animals.size());
    }
}
@isTest
private class ParkLocatorTest {
	@isTest
    static void testGetParks() {
    
    	Test.setMock(WebServiceMock.class, new ParkServiceMock());
    	
    	ParkLocator service = new ParkLocator();
    	List<String> parks = service.getParks('India');
    	System.assertEquals(2, parks.size());
    	    
        
    }
}
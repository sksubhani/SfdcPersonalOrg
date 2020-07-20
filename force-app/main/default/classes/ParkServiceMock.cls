@isTest
global class ParkServiceMock implements WebServiceMock {
	public void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
           	
           List<String> parksList = new List<String>();
           parksList.add('Park 1');
           parksList.add('Park 2');

           ParkService.byCountryResponse response_x = new ParkService.byCountryResponse();
           response_x.return_x = parksList;
           
               response.put('response_x', response_x); 
	}
    
}
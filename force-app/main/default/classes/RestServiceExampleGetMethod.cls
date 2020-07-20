global class RestServiceExampleGetMethod {

	public void getAnimals() {
		
		Http http = new Http();
		HttpRequest request = new HttpRequest();
		request.setMethod('GET');
		request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
		HttpResponse response = http.send(request);
		if (response.getStatusCode() == 200) {
			String str = response.getBody();
			System.debug('Response: ' + str);	
		} else {
			System.debug('Http Request failed. Status code: ' + response.getStatusCode()
				+ '\n Error Message: ' + response.getBody());
			
		}
		
	}
}
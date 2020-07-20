global class AnimalsCallouts {
    
	public static HttpResponse getAnimals() {
		
		Http http = new Http();
		HttpRequest request = new HttpRequest();
		request.setMethod('GET');
		request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
		HttpResponse response = http.send(request);
		if (response.getStatusCode() == 200) {
			String str = response.getBody();
			System.debug('Response: ' + str);
            
            Map<String, Object> resultsMap = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            List<Object> animalList = (List<Object>) resultsMap.get('animals');
            
            for (Object animal: animalList) {
                System.debug('Animal : ' + animal);
            }
            
		} else {
			System.debug('Http Request failed. Status code: ' + response.getStatusCode()
				+ '\n Error Message: ' + response.getBody());
			
		}
        
        return response;
		
	}

	public static HttpResponse addAnimal() {
		
		Http http = new Http();
		HttpRequest request = new HttpRequest();
		request.setMethod('POST');
        request.setHeader('content-type', 'application/json;charset=UTF-8');
        request.setBody('{"name" : "crazy frog"}');	
		request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
		HttpResponse response = http.send(request);
		if (response.getStatusCode() == 201) {
			String str = response.getBody();
			System.debug('Response: ' + str);
            
            Map<String, Object> resultsMap = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            List<Object> animalList = (List<Object>) resultsMap.get('animals');
            
            for (Object animal: animalList) {
                System.debug('Animal : ' + animal);
            }
            
		} else {
			System.debug('Http Request failed. Unable to add the animal. Status code: ' + response.getStatusCode()
				+ '\n Error Message: ' + response.getBody());
			
		}
        
        return response;
		
	}    
}
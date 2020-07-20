public class AnimalLocator {
    
    public class Animal {
        //Integer id {get; set;}
        String name {get; set;}
        //String eats {get; set;}
        //String says {get; set;}
    }
    
    public class AnimalResponse {
        Animal animal;
    }
    
    public static String getAnimalNameById(Integer id) {
    	String animalName = '';
    	
    	Http http = new Http();
    	HttpRequest request = new HttpRequest();
    	request.setMethod('GET');
    	request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + id);
    	
    	HttpResponse response = http.send(request);
        System.debug('Raw response: ' + response + '\n' + response.getBody());
        AnimalResponse animalResponse = new AnimalResponse();
        
    	if (response.getStatusCode() == 200) {
    		animalResponse = (AnimalResponse) JSON.deserialize(response.getBody(), AnimalResponse.class);
            System.debug('Converted animalResponse: '  + animalResponse);
    	}
        Animal a = (Animal) animalResponse.animal;
    	return a.name;
    }
}

/*public class AnimalLocator
{

  public static String getAnimalNameById(Integer id)
   {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
          String strResp = '';
           system.debug('******response '+response.getStatusCode());
           system.debug('******response '+response.getBody());
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) 
        {
            // Deserializes the JSON string into collections of primitive data types.
           Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
           Map<string,object> animals = (map<string,object>) results.get('animal');
            System.debug('Received the following animals:' + animals );
            strResp = string.valueof(animals.get('name'));
            System.debug('strResp >>>>>>' + strResp );
        }
        return strResp ;
   }
  
}*/
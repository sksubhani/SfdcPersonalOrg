@isTest
global class AnimalLocatorMock implements HttpCalloutMock {
    
    global HttpResponse respond(HttpRequest request) {  
        HttpResponse response = new HttpResponse();
        response.setHeader('content-type', 'application/json;charset=UTF-8');
        response.setStatus('Success');
        response.setStatusCode(200);
        //response.setBody('{"animals" : [{"id" : "1", "name" : "bear", "eats" : "[]", "says" : "yum yum"}]}');
        response.setBody('{"animal":{"id":1,"name":"bear","eats":"berries, campers, adam seligman","says":"yum yum"}}');
        
        return response;
    }
}
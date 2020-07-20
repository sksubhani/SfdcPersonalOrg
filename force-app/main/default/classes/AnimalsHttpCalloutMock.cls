public class AnimalsHttpCalloutMock implements HttpCalloutMock {
    public HttpResponse respond(HttpRequest request) {
        HttpResponse response = new HttpResponse();
        response.setHeader('content-type', 'application/json;charset=UTF-8');
        response.setBody('{"animals" : ["Lion", "Tiger", "Monkey", "Cheetah"]}');
        response.setStatusCode(201);
        return response;
    }
}
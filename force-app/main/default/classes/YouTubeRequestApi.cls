public with sharing class YouTubeRequestApi {

    public static String YOUTUBE_CHANNELS_ENDPOINT = 'https://www.googleapis.com/youtube/v3/channels?part=snippet,statistics&id=UClO6U6_Hv4-j32QEryChrLg&key=AIzaSyDmpzXnpF_0zgXp04gW9i6iJbz1pxiBlv8';

    public YouTubeRequestApi() {
    }

    public static void getYouTubeStats() {
        
        Http http = new Http();
        
        HttpRequest request = new HttpRequest();
        request.setEndPoint(YOUTUBE_CHANNELS_ENDPOINT);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);

        if (response.getStatusCode() == 200) {

            System.debug(response.getBody());

        } else {
            System.debug('Error Response Received: ' + response.getBody());
        }

    }
}
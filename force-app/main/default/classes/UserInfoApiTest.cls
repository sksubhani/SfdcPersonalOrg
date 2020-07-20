public with sharing class UserInfoApiTest {
    public void getUserSessionId() {
        String sessionId = UserInfo.getSessionId();
        System.debug('User Session ID: ' + sessionId);
        System.debug('User Name: ' + UserInfo.getUserName());
        
    }
}
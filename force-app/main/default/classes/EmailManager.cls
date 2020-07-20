public with sharing class EmailManager{
    public static void sendMail(String [] addresses, String [] subjects, String [] messages) {
        Messaging.SingleEmailMessage [] emails = new Messaging.SingleEmailMessage[]{};
        Integer totalMails = addresses.size();
        for(Integer i=0; i < totalMails; i++){
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setSubject(subjects[i]);
            email.setToAddresses(new List<String> { addresses[i] });
            email.setPlainTextBody(messages[i]);
            emails.add(email);
        }
        Messaging.sendEmail(emails);
    }
    
	public static void sendMail(String address, String subject, String message) {
        Messaging.SingleEmailMessage [] emails = new Messaging.SingleEmailMessage[]{};

        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setSubject(subject);
        email.setToAddresses(new List<String> { address });
        email.setPlainTextBody(message);
        emails.add(email);
        
        Messaging.sendEmail(emails);
    }    
}
public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numOfContactsToGenerate, String contactLastName) {
        List<Contact> contacts = new List<Contact>();
        for (Integer cnt = 1; cnt <= numOfContactsToGenerate; cnt++)
            contacts.add(new Contact(FirstName = 'Test ' + cnt, LastName = contactLastName));
        
        return contacts;
    }
}
public class ContactControllerExtn {
    public Contact contact;
    
    public ContactControllerExtn(ApexPages.StandardController stdController) {
        this.contact = (Contact) stdController.getRecord();
    }
    
    public String getConcatinatedContactName() {
        return (contact.FirstName + ' - ' + contact.LastName).toUpperCase();
    }
}
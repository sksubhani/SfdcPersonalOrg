global class AddPrimaryContact implements Queueable {
	Contact contact = new Contact();
    String state = null;
    
    global AddPrimaryContact(Contact c, String state) {
		this.contact = c;
        this.state = state;
        insert this.contact;
    }
    
    global void execute(QueueableContext qc) {
        List<Account> accounts = [select Id, Name, BillingState from Account where BillingState = :state limit 200];
        for (Account a: accounts) {
            Contact c = contact.clone(false, false, true, false);
            c.AccountId = a.Id;
        }
		update accounts;
    }
}
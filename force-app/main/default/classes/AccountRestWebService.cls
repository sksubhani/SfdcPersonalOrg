@RestResource(urlMapping='/Account/*')
global class AccountRestWebService {
	
	@HttpGet
	global static Account getAccountById() {
		RestRequest request = RestContext.request;
		String id = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
		Account account = [select Id, Name from Account where id = :id];
		return account;
	}
	
	@HttpPost
	global static Id addAccount(String name, String rating, String phone) {
		Account account = new Account(name=name, rating=rating, phone=phone);
		insert account;
		return account.Id;
	}
    
    @HttpDelete
    global static Id deleteAccountByName() {
    	RestRequest request = RestContext.request;
		String name = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
    	Account account = [select Id from Account where name = :name];
		delete account;
		return account.id;    	
    }
    
    
}
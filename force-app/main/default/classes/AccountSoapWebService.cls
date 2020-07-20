global class AccountSoapWebService {
    webservice static Account getAccountById(String id) {
    	Account account = [select Id, Name from Account where Id = :id];
    	return account;
    } 
}
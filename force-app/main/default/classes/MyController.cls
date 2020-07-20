public class MyController {
    
    private  Account account;
    
    public MyController() {
        account = [select Id, Name, Site from Account 
                   where id = :ApexPages.currentPage().getParameters().get('id')];    
    }   
    
    public Account getAccount() {
        return account;
    }
    
    public PageReference save() {
        update account;
        return null;
    }
    
}
public class RenewalNotebookController {
    public class AccountSearchCriteria {
    	public Account account {get; set;}
    	public User accountOwner {get; set;}
    	public Boolean includeAccountWithZeroMembers {get; set;}
    	
    	public AccountSearchCriteria(User currentUser) {
    		//account = new Account(Account_Status__c = 'Active', Business_Segment__c = 'Small Group', Region__c = currentUser.Sub_Region__c);    		
    		//accountOwner = new User(Business_Segment__c = 'Small Group');
    		account = new Account(Account_Status__c = 'Active');
    		includeAccountWithZeroMembers = false;
    	}
    }
    
    public class SearchResult {
    	public Account account {get; set;}
    	public Opportunity previousYearsOppty {get; set;}
        public Opportunity nextYearsOppty {get; set;}
        public boolean selected {get; set;}
    	
    	public SearchResult(Account account, Opportunity previousYearsOppty) {
    		this.account = account;
    		this.previousYearsOppty = previousYearsOppty;
            this.nextYearsOppty = nextYearsOppty;
            this.selected = false;
    	}
    }

    /*public class WrapSearchResult {
        public SearchResult searchResult {get; set;}
        public boolean selected {get; set;}
        
        public WrapSearchResult(SearchResult result) {
            this.searchResult = result;
            //this.selected = false;
        }
    }*/    
    
    public AccountSearchCriteria searchCriteria {get; set;}
    public SearchResult searchResult {get; set;}
    public List<SearchResult> searchResults {get; set;}
    //public List<WrapSearchResult> wrapSearchResults {get; set;}
    public String displayMode {get; set;}
    public String checkAllLabel {get; set;}
    public Map<String, SearchResult> searchResultsMap {get; set;}
    
    public RenewalNotebookController(ApexPages.StandardController controller) {
    	User currentUser = [select Id from User where Id = :UserInfo.getUserId()];
    	searchCriteria = new AccountSearchCriteria(currentUser);
    	searchResult = null;
        //displayMode = 'New';
    }
    
    private void buildSearchResults(Map<Id, Account> accountsMap, Map<Id, Opportunity> opportunitiesByAccount) {
    	searchResults = new List<SearchResult>();
        searchResultsMap = new Map<String, SearchResult>();
    	for (Id accountId : accountsMap.keySet()) {
    		Account acct = accountsMap.get(accountId);
    		Opportunity oppty = (opportunitiesByAccount.containsKey(accountId)) ? opportunitiesByAccount.get(accountId) : null;
			System.debug('Account: ' + acct.Name + ', Oppty: ' + ((oppty != null) ? oppty.Name : 'No Oppty exists'));
            SearchResult res = new SearchResult(acct, oppty);
    		searchResults.add(res);
            searchResultsMap.put(acct.Id, res);
    	}
        
    }
    
    private void searchAccounts() {
    	searchResults = new List<SearchResult>();
    	
	    Id ownerId = searchCriteria.account.OwnerId;
	    //String accountOwnerBusinessSegment = searchCriteria.accountOwner.Business_Segment__c;
	    /*String accountStatus = searchCriteria.account.Account_Status__c;
	    String businessSegment = searchCriteria.account.Business_Segment__c;
	    String region = searchCriteria.account.Region__c;
	    String renewalMonth = searchCriteria.account.Renewal_Month__c;
	    String accountType = searchCriteria.account.Type;
	    String marketArea = searchCriteria.account.Market_Area__c;*/
	    
	    String query = 'select Id, AccountNumber, Name from Account ' 
	    		+ 'where OwnerId = :ownerId and AccountNumber != null order by AccountNumber limit 5';
	    			
	    List<Account> accounts = (List<Account>) Database.query(query);
	    Map<Id, Account> accountsMap = new Map<Id, Account>(accounts);
	    
	    if (!accountsMap.isEmpty()) {
	    	Date todaysDate = Date.today();
        	Date aYearAgoDate = Date.today().addYears(-1);			
            Date aYearLaterDate = Date.today().addYears(1);	
			List<Opportunity> opportunities = [select Id, AccountId, Account.Name, Name, StageName, IsClosed, CloseDate from Opportunity 
				where AccountId in :accountsMap.keySet() and CloseDate >= :aYearAgoDate 
					and CloseDate <= :aYearLaterDate order by CloseDate desc];
            // and IsClosed = true and StageName = 'Closed Won' 
            
			Map<Id, Opportunity> opportunitiesByAccount = new Map<Id, Opportunity>();
            for (Opportunity oppty : opportunities) {
                System.debug('Account: ' + oppty.Account.Name + ', Oppty: ' + oppty.Name);
				if (!opportunitiesByAccount.containsKey(oppty.AccountId))
					opportunitiesByAccount.put(oppty.AccountId, oppty);
            }
			
			buildSearchResults(accountsMap, opportunitiesByAccount);
	    }
	    
	    if (searchResults.isEmpty()) {
	    	ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.INFO, 'No records found matching your search criteria.');
	    	ApexPages.addMessage(myMsg);
	    }
    }
    
    public PageReference findAccounts() {
    	searchAccounts();
        displayMode = 'displaySearchResults'; 
        checkAllLabel = 'Check All';
    	return null;
    }
    
    public PageReference clearSearch() {
    	searchResults = null;
    	User currentUser = [select Id from User where Id = :UserInfo.getUserId()];
    	searchCriteria = new AccountSearchCriteria(currentUser);
    	return null;
    }
    
    public void editSearchResult() {
        displayMode = 'EditSearchResult';
        String accountId = ApexPages.currentPage().getParameters().get('selectedAccountId');
        System.debug('selected account id: ' + accountId);
        searchResult = getSearchResult(accountId);
    }
    
    public SearchResult getSearchResult(String s) {
        SearchResult result = null;
        for (SearchResult res : searchResults) {
            if (res.account.Id == s) {
                result = res; 
            	break;
        	}
        }
        return result;
    }
    
    public void deleteSearchResult() {
        displayMode = 'displaySearchResults';
        String accountId = ApexPages.currentPage().getParameters().get('selectedAccountId');
        System.debug('selected account id: ' + accountId);
        deleteResult(accountId);
    }
    
    public void deleteResult(String s) {
        SearchResult result = null;
        Integer index = 0;
        for (SearchResult res : searchResults) {
            if (res.account.Id == s) {
                System.debug('Deleting result: ' + res);
                searchResults.remove(index);
            	break;
        	}
            ++index;
        }
    }
    
	public void updateSearchResult() {
        displayMode = 'displaySearchResults';
    }
    
    public void cancelUpdateSearchResult() {
        displayMode = 'displaySearchResults';
    }
    
    public void addSearchResult() {
        displayMode = 'addSearchResult';
    }
    
    public void cancelAddSearchResult() {
        displayMode = 'displaySearchResults';
    }    
    
    public boolean getDisplaySearchCriteria() {
        return (displayMode == 'EditSearchResult' || displayMode == 'addSearchResult') ? false : true;     
    }
    
    public boolean getDisplaySearchResults() {
        System.debug('displayMode: ' + displayMode + ', (displayMode == displaySearchResults): ' + (displayMode == 'displaySearchResults'));
        return (displayMode == 'displaySearchResults') ? true : false;     
    }
    
    public boolean getDisplayEditSearchResult() {
        return (displayMode != 'EditSearchResult') ? false : true;     
    }
    
    public boolean getDisplayAddNewSearchResult() {
        return (displayMode == 'AddSearchResult') ? true : false;     
    }    
    
    public void checkAll() {
        if (searchResults != null && searchResults.size() > 0) {
            for (SearchResult res : searchResults)
                res.selected = (checkAllLabel == 'Check All') ? true : false;
			
            checkAllLabel = (checkAllLabel == 'Check All') ? 'Uncheck All' : 'Check All';
        }
    }
}
public class SearchResultController {
    
    public List<SearchResult> resultList {get; set;}
    public SearchResult searchResult {get; set;}
    
    public SearchResultController() {
        searchResult = new SearchResult();
        getSearchResults();
    }
    
    public class SearchResult {
        public Id acctId {get; set;}
        public Opportunity oppty {get; set;}
    }
    
    public void getSearchResults() {
        resultList = new List<SearchResult>();
        List<Opportunity> opptys = [select Id, Name, OwnerId, AccountId from Opportunity limit 5];
        SearchResult result; 
        for (Opportunity oppty : opptys) {
            result = new SearchResult();
            result.acctId = oppty.AccountId;
            result.oppty = oppty;
            resultList.add(result);
        }
    }
}
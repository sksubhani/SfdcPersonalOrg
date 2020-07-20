public class WrapperClassDemo {
    public List<AccountWrapper> acctWrapperList {get; set;}
    
    public WrapperClassDemo() {
        acctWrapperList = new List<AccountWrapper>();
        List<Account> acctList = [select Id, Name, SBN1__Active__c, SBN1__Potential_Value__c, SBN1__Account_Status__c from Account where Name<> '' limit 10];
        
        Integer idx = 1;
        Boolean checked;
        for (Account a : acctList) {
            checked = (a.SBN1__Potential_Value__c > 0) ? true : false;
            acctWrapperList.add(new AccountWrapper(checked, idx++, a.Name, a.SBN1__Account_Status__c));
        }
    }
    
    public class AccountWrapper {
        public Boolean checked {get; set;}
        public Integer serialNumber {get; set;}
        public String acctName {get; set;}
        public String acctStatus {get; set;}
        
        public AccountWrapper() {
            checked = false;
            serialNumber = 0;
            acctName = '';
            acctStatus = '';
        }
        
        public AccountWrapper(Boolean c, Integer sn, String n, String s) {
            this.checked = c;
            this.serialNumber = sn;
            this.acctName = n;
            this.acctStatus = s;
        }
    }
}
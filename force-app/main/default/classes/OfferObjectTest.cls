@isTest
public class OfferObjectTest {
	@isTest
    public static void testOfferAmountExists() {
        Offer__c o = new Offer__c();
        o.offer_amount__c = 100000.0;
        
        insert o;
        System.Assert(o.Id != null, 'Offer does not contain amount field.');
    }
    
	@isTest
    public static void testTargetCloseDateExists() {
        Offer__c o = new Offer__c();
        o.target_close_date__c = System.today();
        
        insert o;
        System.Assert(o.Id != null, 'Offer does not contain Target Close Date field.');
    }   
}
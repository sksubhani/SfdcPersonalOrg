@isTest
public class LeadProcessorTest {
	@isTest
    public static void testLeadProcessorBatch() {
        List<Lead> leads = new List<Lead>();
        for (Integer i=0; i<200; i++) {
            Lead l = new Lead (FirstName = 'Lead First Name ' + i, LastName = 'Lead Last Name ' + i  + ' for Batch job testing', company = 'KPSC');
            leads.add(l);
        }
        insert leads;
        
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchJobId = Database.executeBatch(lp);
        Test.stopTest();
        
        System.assertEquals(200, [select count() from Lead where leadsource = 'Dreamforce']);
        
    }
    
}
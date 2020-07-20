@isTest 
public class DailyLeadProcessorTest {
    @testSetup
    public static void setUp() {
        List<Lead> leads = new List<Lead>();
        Lead lead;
        for (Integer i=0; i<200; i++) {
            lead = new Lead(FirstName='Sample Lead FN ' + i, LastName='Sample Lead LN ' + i, Company='Verizon');
            leads.add(lead);
        }
        insert leads;
    }
    
    @isTest 
    public static void testDailyLeadProcessorScheduler() {
        Test.startTest();
        
        List<Lead> leads = [select Id, Name, LeadSource from Lead where FirstName like 'Sample Lead FN%'];
        DailyLeadProcessor dlp = new DailyLeadProcessor();
        // Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
        String cronExpr = '00 00 00 21 02 ?';
        String jobId = System.schedule('Daily Lead Processor', cronExpr, dlp);
        System.debug('Job Id: ' + jobId);
        
        Test.stopTest();
    }
}
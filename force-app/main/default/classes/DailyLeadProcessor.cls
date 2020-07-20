public class DailyLeadProcessor implements Schedulable {
    public static void execute(System.SchedulableContext context) {
    	List<Lead> leads = [select Id, Name, Company, LeadSource from Lead where LeadSource = null limit 200];    
        for (Lead lead : leads)
            lead.LeadSource = 'Dreamforce';
        upsert leads;
    }
    
}
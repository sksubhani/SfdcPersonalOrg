trigger ClosedOpportunityTrigger on Opportunity (before insert, before update) {
	List<Task> tasks = new List<Task>();
    List<Opportunity> opptysForTasks = new List<Opportunity>();
    
    for (Opportunity oppty : Trigger.New) {
        if (oppty.stageName == 'Closed Won') {
			tasks.add(new Task(Subject = 'Follow Up Test Task', whatId = oppty.Id));
        }
    }
    
    if (!tasks.isEmpty())
    	insert tasks;
}
trigger TriggerDemo on Case (before insert) {
    
    List<case> childcases = new List<case>();
    for(case parent  : trigger.new)
    {
        case child = new case(parentId = parent.Id, subject = parent.subject);
        childcases.add(child);
    }
    insert childcases;

}
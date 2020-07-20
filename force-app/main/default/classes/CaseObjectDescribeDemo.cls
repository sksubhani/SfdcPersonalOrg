public class CaseObjectDescribeDemo {
    public static void getDetails() {
        List<Schema.RecordTypeInfo> recTypeList = Case.SobjectType.getDescribe().getRecordTypeInfos();
        for (Schema.RecordTypeInfo r : recTypeList) 
            System.debug(r);
        
        List<Schema.PicklistEntry> pickListEntry = Case.Status.getDescribe().getPicklistValues();
        for (Schema.PicklistEntry entry : pickListEntry) {
            System.debug(entry);
        }
    }
}
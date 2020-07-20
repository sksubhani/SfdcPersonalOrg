public class QueryMetaDataOnObject {

    public static void getRequiredFields() {
        Schema.DescribeSObjectResult r = Property__c.sObjectType.getDescribe();
            Map<String,Schema.SObjectField> M = r.fields.getMap();
            System.debug('Object: ' + r.getLabel());
            for(String fieldName : M.keySet())
            { 
                Schema.SObjectField field = M.get(fieldName);
                Schema.DescribeFieldResult F = field.getDescribe();
                if (!F.isNillable())
             		System.debug ('Field Label: ' + F.getLabel() + ', Field API Name: ' + fieldName);
           }
    }
}
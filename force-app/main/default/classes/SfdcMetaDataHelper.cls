public class SfdcMetaDataHelper {

    public static String getFieldsString(String objectName) {
        String fieldsString = '';
        Schema.SObjectType objectType = Schema.getGlobalDescribe().get(objectName);
        System.debug('object type: ' + objectType);
        
        Schema.DescribeSObjectResult result = objectType.getDescribe();
        System.debug('object result : ' + result);
        
        Map<String, Schema.SObjectField> fieldMap = result.fields.getMap();
        System.debug('Field Map : ' + fieldMap);
        
        for (String fieldKey: fieldMap.keySet()) {
            System.debug('Key, Value: ' + fieldKey + ': ' + fieldMap.get(fieldKey));
            fieldsString += fieldMap.get(fieldKey) + ', ';
        }
        
        return fieldsString;
    }
}
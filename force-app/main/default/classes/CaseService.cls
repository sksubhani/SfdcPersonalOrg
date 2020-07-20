public with sharing class CaseService {
    public static void closeCases(Set<Id> caseIds, String closeReason) {
        List<Case> caseList = [select Id, status, reason from Case where ID IN :caseIds];
        if (caseList != null || caseList.size() > 0) {
            for (Case c : caseList) {
                c.status = 'Closed';
                c.Reason = closeReason;
            }
            upsert caseList;
        }
    }
}
@RestResource(urlmapping='/case/*/close')
global with sharing class CaseCloseResource {
	@HttpPost
    global static void closeCase (String closeReason) {
        RestRequest request = RestContext.request;
        String[] uriParams = request.requestURI.split('/');
        String caseId = uriParams[2];
        CaseService.closeCases(new Set<ID> { caseId }, closeReason);
    }
}
public class NewCaseListController {
    public List<Case> getNewCases() {
        List<Case> cases = null;
        cases = [select id, caseNumber from Case where status = 'New'];
        return cases;
    }
}
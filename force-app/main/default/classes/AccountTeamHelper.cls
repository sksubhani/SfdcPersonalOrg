public class AccountTeamHelper {

    public void getAccountTeamByAccountName(String acctName) {
        List<Account> accounts = [Select (Select Id, UserID, TeamMemberRole from AccountTeamMembers where TeamMemberRole = 'Account Manager'
												) from Account a Where a.name = :acctName]; 
			if (accounts == null || accounts.isEmpty())
				System.debug('No account found');
        	else 
                System.debug('Account found: ' + accounts[0]);
			List<AccountTeamMember> accountTeam = accounts[0].AccountTeamMembers;
			if (accountTeam == null || accountTeam.isEmpty())
                System.debug('No Account team found');
        	else 
                System.debug('Account Team ' + accountTeam);
        
        	Map<String, String> ACCOUNT_MANAGEMENT_TEAM_MAP = new Map<String, String>();
			ACCOUNT_MANAGEMENT_TEAM_MAP.put('REGIONAL_ACCOUNT_MANAGER', 'Regional Account Manager');
			ACCOUNT_MANAGEMENT_TEAM_MAP.put('REGIONAL_ASSOCIATE_ACCOUNT_MANAGER', 'Regional Associate Account Manager');
        
        	System.debug('Map Values ' + ACCOUNT_MANAGEMENT_TEAM_MAP.values());
        
    }
    
    public void getAccountTeam() {
        Map<String, String> teamMap = new Map<String, String>();
        teamMap.put('REGIONAL_ACCOUNT_MANAGER', 'Regional Account Manager');
        teamMap.put('REGIONAL_ASSOCIATE_ACCOUNT_MANAGER', 'Regional Associate Account Manager');
        teamMap.put('REGIONAL_ASSOCIATE_ACCOUNT_TEAM_MEMBER', 'Regional Associate Account Team Manager');
        String amTeam = '';
        if (teamMap != null && !teamMap.isEmpty()) {
            for (String s : teamMap.values())
                amTeam += s + ', ';
           	amTeam = amTeam.substringBeforeLast(', ');
        }
        System.debug( 'Team : ' + amTeam);
        
        System.debug('Other way : ' + String.join(teamMap.values(), ' OR '));
    }
}
global class TimeZoneHelper {
	@invocablemethod (label='Get Time Zones' description='Returns the list of time zone names.')
    public static List<String> getTimeZones() {
        List<String> timeZoneList = new List<String>();
        Set<String> timeZoneSet = new Set<String>();
        Schema.DescribeFieldResult fieldResult = User.TimeZoneSidKey.getdescribe();
		List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
		for(Schema.PicklistEntry p : ple) {
            timeZoneList.add(p.getLabel());
			System.debug('Label: ' + p.getlabel() + ', Value: ' + p.getValue());
		}
        return timeZoneList;
    }
}
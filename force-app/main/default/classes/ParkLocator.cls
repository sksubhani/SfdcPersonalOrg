global class ParkLocator {
	global List<String> getParks(String countryName) {
		ParkService.ParksImplPort service = new ParkService.ParksImplPort();
		List<String> parks = service.byCountry(countryName);
		return parks;
	}
}
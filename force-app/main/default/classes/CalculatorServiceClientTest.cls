@isTest
public  class CalculatorServiceClientTest {
	
	@isTest
	public static void testDoAdd() {
		Test.setMock(WebserviceMock.class, new CalculatorsServiceMock());
		Double a = 2.0;
		Double b = 1.0;
		
		CalculatorServiceClient c = new CalculatorServiceClient();
		Double result = c.add(a, b);
		//System.debug('Result : ' + result);
		System.assertEquals(3.0, result);
	}  

	@isTest
	public static void testDoSubtrat() {
		Test.setMock(WebserviceMock.class, new CalculatorsServiceMock());
		Double a = 2.0;
		Double b = 1.0;
		
		CalculatorServiceClient c = new CalculatorServiceClient();
		Double result = c.subtract(a, b);
		//System.debug('Result : ' + result);
		System.assertEquals(1.0, result);
	}

	@isTest
	public static void testDoMultiply() {
		Test.setMock(WebserviceMock.class, new CalculatorsServiceMock());
		Double a = 2.0;
		Double b = 1.0;
		
		CalculatorServiceClient c = new CalculatorServiceClient();
		Double result = c.multiply(a, b);
		//System.debug('Result : ' + result);
		System.assertEquals(2.0, result);
	}

	@isTest
	public static void testDoDivide() {
		Test.setMock(WebserviceMock.class, new CalculatorsServiceMock());
		Double a = 2.0;
		Double b = 1.0;
		
		CalculatorServiceClient c = new CalculatorServiceClient();
		Double result = c.divide(a, b);
		//System.debug('Result : ' + result);
		System.assertEquals(2.0, result);
	}    
}
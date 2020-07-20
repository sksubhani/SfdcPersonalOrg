public class CalculatorServiceClient {
    
    public Double add(Double a, Double b) {
    	CalculatorServices.CalculatorImplPort service = new CalculatorServices.CalculatorImplPort();
	    Double c = service.doAdd(a,b);
        return c;
    }

    public Double divide(Double a, Double b) {
    	CalculatorServices.CalculatorImplPort service = new CalculatorServices.CalculatorImplPort();
	    Double c = service.doDivide(a,b);
        return c;
    }

    public Double multiply(Double a, Double b) {
        CalculatorServices.CalculatorImplPort service = new CalculatorServices.CalculatorImplPort();
        Double c = service.doMultiply(a,b);
        return c;
    }

    public Double subtract(Double a, Double b) {
    	CalculatorServices.CalculatorImplPort service = new CalculatorServices.CalculatorImplPort();
	    Double c = service.doSubtract(a,b);
        return c;
    }
}
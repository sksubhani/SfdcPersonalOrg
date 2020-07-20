@isTest
global class CalculatorsServiceMock implements WebServiceMock {
   global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
        	// start - specify the response you want to send
            if (requestName.equalsIgnoreCase('doAdd')) {
                calculatorServices.doAddResponse response_x = 
                	new calculatorServices.doAddResponse();
                response_x.return_x = 3.0;
                // end
                response.put('response_x', response_x);    
            } else if (requestName.equalsIgnoreCase('doSubtract')) {
                calculatorServices.doSubtractResponse response_x = 
                	new calculatorServices.doSubtractResponse();
                response_x.return_x = 1.0;
                // end
                response.put('response_x', response_x);    
            } else if (requestName.equalsIgnoreCase('doMultiply')) {
                calculatorServices.doMultiplyResponse response_x = 
                	new calculatorServices.doMultiplyResponse();
                response_x.return_x = 2.0;
                // end
                response.put('response_x', response_x);    
            } else if (requestName.equalsIgnoreCase('doDivide')) {
                calculatorServices.doDivideResponse response_x = 
                	new calculatorServices.doDivideResponse();
                response_x.return_x = 2.0;
                // end
                response.put('response_x', response_x);    
            }
   }
}
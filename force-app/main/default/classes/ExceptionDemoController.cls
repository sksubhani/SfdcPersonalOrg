public class ExceptionDemoController {
    public boolean error { get; set;}
    
    public class DemoException extends Exception {}
    
    public void displayData() {
        error = true;
        throw new DemoException('DEMO::: Demo Exception Message!!!');
    }    
    
}
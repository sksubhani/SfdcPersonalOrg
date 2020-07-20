global class SchedulerDemo implements Schedulable {
    HelloWorld hw = new HelloWorld();
    
    global void execute(SchedulableContext cxt) {
        hw.printHelloWorld();
    }
}
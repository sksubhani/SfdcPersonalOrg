public class DemoController {
    public String myString {get; set;}
	Public String getStringMethod1(){
		return myString;
	}
	public String getStringMethod2() {
		if(myString == null)
			myString ='Method 2';
		return myString;
	}
}
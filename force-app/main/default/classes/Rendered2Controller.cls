public class Rendered2Controller {
	Public Boolean PBFlag{get;set;}
  	Public Account[] accRec{get;set;}

	Public Rendered2Controller(){
  		accRec = [select name,id,accountnumber from account limit 1];

		PBFlag= false;
  	}

	public void ShowPB(){
  		PBFlag= !PBFlag;
  	}
}
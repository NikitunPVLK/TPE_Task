package;

/**
 * ...
 * @author Pavlo Nikitin
 */
class TextData {
	private var smallText:String;
	private var bigText:String;
	
	public function new(?smallText:String="small text", ?bigText:String = "big text") {
		this.smallText = smallText;
		this.bigText = bigText;
	}
	
	public function getSmallText():String{
		return smallText;
	}
	
	public function setSmallText(smallText:String){
		this.smallText = smallText;
	}
	
	public function getBigText():String{
		return bigText;
	}
	
	public function setBigText(bigText:String){
		this.bigText = bigText;
	}
}
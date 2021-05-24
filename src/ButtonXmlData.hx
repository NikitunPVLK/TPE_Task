package;

import openfl.Assets;
import haxe.xml.Access;
import sys.io.File;

/**
 * ...
 * @author Pavlo Nikitin
 */
class ButtonXmlData {
	
	private var data:Array<Access>;

	public function new(path:String) {
		var xmlString = File.getContent(Assets.getPath(path));
		var xml = Xml.parse(xmlString);
		
		var buttonsElement = new Access(xml.firstElement());
		var buttonElementsArray = buttonsElement.nodes.button;
		data = [];
		for (button in buttonElementsArray){
			data.push(button);
		}
	}
	
	public function getData():Array<Access>{
		return data;
	}
	
}
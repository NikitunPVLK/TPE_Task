package;

import feathers.controls.Button;
import feathers.controls.LayoutGroup;
import openfl.Assets;
import feathers.events.TriggerEvent;
import feathers.controls.Alert;
import openfl.display.Loader;
import openfl.net.URLRequest;
import openfl.events.Event;
/**
 * ...
 * @author Pavlo Nikitin
 */
class ButtonView extends LayoutGroup {

	public function new(rows:Int, cols:Int, width:Float, height:Float, buttonXmlData:ButtonXmlData) {
		super();
		
		var data = buttonXmlData.getData();
		
		var buttonWidth = width / cols;
		var buttonHeight = height / rows;
		var counter = 1;
		for (i in 0...rows){
			for (j in 0...cols){
				var button = new Button();
				button.name = "Button №" + (counter++);
				button.x = buttonWidth * j;
				button.y = buttonHeight * i;
				button.minWidth = buttonWidth; 
				button.minHeight = buttonHeight;
				button.maxWidth = buttonWidth; 
				button.maxHeight = buttonHeight;
				
				var loader = new Loader();
				loader.load(new URLRequest(Assets.getPath(data[j].att.img)));
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, function(e:Event){
					loader.content.width = Std.parseInt(data[j].att.width);
					loader.content.height = Std.parseInt(data[j].att.height);
					button.icon = loader.content;
					this.addChild(button);
				});
				
				button.addEventListener(TriggerEvent.TRIGGER, function(e:TriggerEvent){
					Alert.show(button.name, "MessageBox", ["Ok"]);
					this.removeChildren();
					button.icon.height = height;
					button.icon.width = width;
					this.addChild(button.icon);
					button.icon.x = 0;
					button.icon.y = 0;
				});
			}
		}
	}
}
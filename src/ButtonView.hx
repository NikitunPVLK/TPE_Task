package;
import feathers.controls.Button;
import feathers.controls.LayoutGroup;
import openfl.display.Bitmap;
import openfl.Assets;
import feathers.events.TriggerEvent;
import feathers.controls.Alert;
/**
 * ...
 * @author Pavlo Nikitin
 */
class ButtonView extends LayoutGroup {

	public function new(rows:Int, cols:Int, width:Float, height:Float) {
		super();
		
		var buttonWidth = width / cols;
		var buttonHeight = height / rows;
		var counter = 1;
		for (i in 0...rows){
			for (j in 0...cols){
				var button = new Button();
				button.name = "Кнопка №" + (counter++);
				button.x = buttonWidth * j;
				button.y = buttonHeight * i;
				button.minWidth = buttonWidth; 
				button.minHeight = buttonHeight;
				button.maxWidth = buttonWidth; 
				button.maxHeight = buttonHeight;
				var icon = new Bitmap(Assets.getBitmapData((j + 1) + ""));
				icon.width = buttonWidth / 2;
				icon.height = buttonHeight / 2;
				button.icon = icon;
				this.addChild(button);
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
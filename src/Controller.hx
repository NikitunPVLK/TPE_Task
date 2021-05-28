package;
import feathers.controls.Button;
import feathers.controls.TextArea;
import feathers.controls.navigators.TabNavigator;
import feathers.data.ArrayCollection;
import openfl.display.DisplayObjectContainer;
import feathers.controls.navigators.TabItem;
import openfl.display.Loader;
import openfl.net.URLRequest;
import openfl.events.Event;
import feathers.events.TriggerEvent;
import openfl.Assets;
import feathers.controls.Alert;

/**
 * ...
 * @author Pavlo Nikitin
 */
class Controller {
	
	private var target:DisplayObjectContainer;
	private var navigator:TabNavigator;
	private var views:Array<View>;
	private var textData:TextData;
	private var buttonData:ButtonXmlData;
	
	public function new(target:DisplayObjectContainer, textData:TextData, buttonXmlData:ButtonXmlData) {
		this.target = target;
		this.textData = textData;
		this.buttonData = buttonXmlData;
		views = [];
		
		var navigator:TabNavigator = new TabNavigator();
		navigator.x = 20;
		navigator.y = 20;
		navigator.width = 0;
		navigator.name = "navigator";
		target.addChild(navigator);
		
	}
	
	public function addViews(views:Array<View>) {
		for (view in views) {
			addView(view);
		}
	}
	
	public function addView(view:View) {
		var navigator = cast(target.getChildByName("navigator"), TabNavigator);
		views.push(view);

		if(navigator.dataProvider == null) {
			navigator.dataProvider = new ArrayCollection([TabItem.withDisplayObject(view.name, view)]);
		} else {
			navigator.dataProvider.add(TabItem.withDisplayObject(view.name, view));
		}
	}
	
	public function display() {
		for (view in views) {
			if (Std.downcast(view, ButtonView) != null) {
				displayButtons(view);
			} else {
				displayText(view);
			}
		}
	}
	
	private function displayButtons(view:View) {
		var data = buttonData.getData();
		var buttonWidth = Main.contentWidth / Main.cols;
		var buttonHeight = Main.contentHeight / Main.rows;
		var counter = 1;
		for (i in 0...Main.rows) {
			for (j in 0...Main.cols) {
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
					loader.contentLoaderInfo.addEventListener(Event.COMPLETE, function(e:Event) {
					loader.content.width = Std.parseInt(data[j].att.width);
					loader.content.height = Std.parseInt(data[j].att.height);
					button.icon = loader.content;
					view.addChild(button);
				});
				
				button.addEventListener(TriggerEvent.TRIGGER, function(e:TriggerEvent) {
					Alert.show(button.name, "MessageBox", ["Ok"]);
					view.removeChildren();
					button.icon.height = Main.contentHeight;
					button.icon.width = Main.contentWidth;
					view.addChild(button.icon);
					button.icon.x = 0;
					button.icon.y = 0;
				});
			}
		}
	}
	
	private function displayText(view:View){
		var textArea = new TextArea();
		if (view.name == "Small text") {
			textArea.text = textData.getSmallText();
		} else if (view.name == "Big text") {
			textArea.text = textData.getBigText();
		} else {
			textArea.text = "";
		}
		textArea.height = Main.contentHeight;
		textArea.width = Main.contentWidth;
		textArea.editable = false;
		textArea.autoHideScrollBars = true;
		view.addChild(textArea);
	}
}
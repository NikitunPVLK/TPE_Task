package;

import openfl.display.DisplayObject;
/**
 * ...
 * @author Pavlo Nikitin
 */
class ButtonView extends View {

	public function new(?content:DisplayObject) {
		super();
		
		if (content != null) {
			this.addChild(content);
		}
	}
	
}
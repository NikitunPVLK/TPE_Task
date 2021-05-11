package;
import feathers.controls.LayoutGroup;
import feathers.controls.TextArea;
/**
 * ...
 * @author Pavlo Nikitin
 */
class TextView extends LayoutGroup {
	
	private var textArea:TextArea;

	public function new(text:String, width:Float, height:Float) {
		super();
		
		textArea = new TextArea();
		textArea.text = text;
		textArea.width = width;
		textArea.height = height;
		textArea.editable = false;
		textArea.autoHideScrollBars = true;
		
		this.addChild(textArea);
		
	}
	
}
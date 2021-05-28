package;
import feathers.controls.TextArea;
/**
 * ...
 * @author Pavlo Nikitin
 */
class TextView extends View {

	public function new(?textArea:TextArea=null) {
		super();
		
		if (textArea != null) {
			addChild(textArea);
		}
	}
	
	
}
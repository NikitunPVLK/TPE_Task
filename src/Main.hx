package;

import feathers.data.ArrayCollection;
import openfl.display.Sprite;
import feathers.controls.navigators.TabNavigator;
import feathers.controls.navigators.TabItem;

/**
 * ...
 * @author Pavlo Nikitin
 */
class Main extends Sprite 
{

	public function new() 
	{
		super();
		
		var navigator = new TabNavigator();
		var buttonXmlData = new ButtonXmlData("buttons.xml");
		
		navigator.x = 20;
		navigator.y = 20;
		navigator.width = 0;
		
		var contentWidth = 760;
		var contentHeight = 400;
		
		var smallTextView = new TextView("Text", contentWidth, contentHeight);
		var bigTextView = new TextView("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis elementum pretium lacus nec accumsan. Quisque accumsan metus ac blandit vulputate. Nulla rhoncus a lacus vitae fringilla. Proin efficitur semper dictum. Nulla leo nibh, consequat sed iaculis ullamcorper, dapibus nec nibh. Morbi vehicula lobortis hendrerit. Integer posuere nisl eu orci maximus tristique. Duis eget leo commodo, consectetur dui eu, tincidunt nulla.Donec pulvinar, quam ut interdum lobortis, diam quam mollis tortor, congue porta turpis mauris non magna. Vestibulum auctor vel odio quis sagittis. Praesent mollis, magna feugiat sodales mattis, ante turpis elementum ipsum, id auctor massa urna eu elit. Donec vel ex in justo placerat viverra vel ut purus. Phasellus sit amet ipsum quam. Etiam sapien arcu, posuere ac turpis eget, euismod fermentum mauris. Praesent venenatis, eros ac efficitur feugiat, leo odio dapibus nulla, ut cursus nibh lacus sed nibh. Morbi dapibus augue quis lobortis cursus. Phasellus luctus volutpat nibh, a pretium leo dapibus sed. Fusce at ipsum elit. Maecenas at dictum justo. Cras dignissim lorem nec lectus gravida, et posuere purus molestie. Nulla urna tellus, consectetur efficitur ipsum nec, lacinia tempus mauris. In elementum rutrum arcu vitae sollicitudin. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent molestie felis massa, non sollicitudin urna lacinia placerat. Nulla malesuada dictum cursus. Mauris eget tempus nibh. Nunc eget aliquet ex. Cras sit amet arcu enim. Etiam feugiat nisi nec ultrices volutpat. Donec nunc quam, bibendum sit amet felis sed, tincidunt consectetur mi. Fusce sit amet fringilla lacus, vitae dignissim erat. Curabitur condimentum fermentum arcu efficitur sodales. Donec venenatis tortor ac nunc aliquet semper. Phasellus aliquam ligula non dolor semper, et consequat erat placerat. Proin ut ex a velit blandit scelerisque. Sed suscipit elit tellus, sed consectetur nunc elementum sed. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Curabitur in urna ornare ipsum tristique pretium. Vestibulum quis consectetur dolor. Sed sit amet lacus eu eros elementum vehicula ut eget turpis. Pellentesque consequat nulla ante, ut sollicitudin lorem placerat vel. Nam tempor, lorem egestas bibendum ornare, nisi odio dignissim justo, id iaculis leo arcu ac lectus. Praesent eget placerat eros. Nullam id maximus mi, sit amet pellentesque enim. Curabitur non enim pharetra, bibendum purus vitae, posuere libero. Integer lacus turpis, tristique id convallis eu, eleifend vel mi. Nullam vestibulum elementum tellus pulvinar aliquam. Etiam bibendum malesuada risus, vitae lacinia orci placerat iaculis. Sed iaculis arcu a quam placerat, vitae condimentum lacus commodo. Donec sit amet nibh enim.",
										contentWidth, contentHeight);
		var buttonView = new ButtonView(4, 4, contentWidth, contentHeight, buttonXmlData);
		
		navigator.dataProvider = new ArrayCollection([
			TabItem.withDisplayObject("Small Text", smallTextView),
			TabItem.withDisplayObject("Big text", bigTextView),
			TabItem.withDisplayObject("Buttons", buttonView)
		]);
		
		this.addChild(navigator);
	}

}

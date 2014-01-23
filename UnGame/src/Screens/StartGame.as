package Screens 
{
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Qiao Xiaomeng
	 */
	public class StartGame extends Sprite 
	{
		// 功能分区
		private var sections:Vector.<String> = Vector.<String>(["开始游戏", "载入游戏", "游戏结束"]);
		
		public function StartGame() 
		{
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			var buttonTexture:Texture = (new Assets().getTexture("ButtonTexture"));
			var menuContainer:Sprite = new Sprite();
			var numSections:uint = sections.length;
			for (var i:uint = 0; i < 3; i++ )
			{
				var button:Button = new Button(buttonTexture, sections[i]);
				button.fontBold = true;
				button.y = button.height * i;
				menuContainer.addChild(button);
				
				menuContainer.addEventListener(Event.TRIGGERED, onTriggered);
			
			}
			addChild(menuContainer);
		}
		
		private function onTriggered(e:Event):void 
		{
			trace(e.currentTarget, e.target);
			trace("点击！");
		}
		
	}

}
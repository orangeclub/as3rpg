package  
{
	import flash.display.BitmapData;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	import events.TalkEvent;
	/**
	 * ...
	 * @author Qiao Xiaomeng
	 */
	
	/**
	 * TODO:
		 * 1.加入不同种类NPC图像，随机出现
		 * 2.NPC层类，或NPC类
	 */
	public class NPC extends Sprite
	{
		public var NPCImage:Image;
		public var NPCBMD:BitmapData;
		
		//private var dialogue:Dialogue;
		
		public function NPC(npcX:uint, npcY:uint) 
		{
			this.NPCImage = new Image(new Assets().getTexture("Scene2Texture"));
			
			this.addChild(NPCImage);
			this.x = npcX;
			this.y = npcY;
			
			
			addEventListener(TouchEvent.TOUCH, onTouchNPC);
			//this.addEventListener("talk", onTalk)
		}
		
		//private function onTalk(e:TalkEvent):void 
	////	{
		//	trace("这就是对话");
	//		dialogue = new Dialogue();
	//		IdleMode.talkLayer.addChild(dialogue);
			
	//	}

		

		
		private function onTouchNPC(e:TouchEvent):void 
		{
			var touch:Touch = e.getTouch(e.target as DisplayObject);
			if (touch)
			{
				if (touch.phase == TouchPhase.HOVER)
				{
					trace("可以对话");
				}
				if (touch.phase == TouchPhase.ENDED)
				{
					trace("对话进行中");
					dispatchEvent(new TalkEvent());
					
				}
			}
		}
	}

}
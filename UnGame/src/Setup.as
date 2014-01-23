package 
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author Qiao Xiaomeng
	 */
	
	 [SWF(width = "640", height = "480", frameRate = "60", backgroundColor = "#ffffff")]
	public class Setup extends Sprite 
	{
		private var _starling:Starling;
		
		public function Setup():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			
			
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			_starling = new Starling(UnGame, stage);
			stage.align = StageAlign.TOP_LEFT;
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			_starling.start();
		}
		
	}
	
}
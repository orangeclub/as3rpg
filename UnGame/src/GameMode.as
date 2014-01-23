package  
{
	import starling.animation.Juggler;
	import starling.display.Sprite;
	
	/**
	 * 处理游戏模块的基类。
	 * 游戏模块包括探索模式、战斗模式、菜单模式等。
	 * @author Qiao Xiaomeng
	 */
	public class GameMode extends Sprite 
	{
		// 
		private var juggler:Juggler;
		
		private var _pause:Boolean;
		public function GameMode() 
		{
			juggler = new Juggler();
		}
		
		// 这一接口可从外部调用，停止调用将导致内容停止
		public function advanceTime(time:Number):void
		{
			juggler.advanceTime(time);
		}
		
		
		public function start():void
		{
			_pause = false;
		}
		
		public function stop():void
		{
			_pause = true;
		}
		

		public override function dispose():void
		{
			juggler.purge();
			super.dispose();
		}
		
		
		
		
		
	}

}
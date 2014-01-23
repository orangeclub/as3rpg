package  
{
	import flash.geom.Point;
	import Screens.StartGame;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.text.TextField;
	
	/**
	 * 游戏文档类，负责不同游戏模式切换。
	 * @author Qiao Xiaomeng
	 */
	
	 // TODO:
	 // 1. 增加游戏菜单。
	 // 2. 游戏载入画面。
	 // 3. 游戏存档。
	public class UnGame extends Sprite 
	{
		// 探索模式
		private var _idleMode:IdleMode;
		// 开始界面
		private var _startGame:StartGame;


		public function UnGame() 
		{
			
			// 可见抛出
			addEventListener(Event.ADDED_TO_STAGE, onAdded);

		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			// 载入探索模式（主要游戏模式）
			_idleMode = new IdleMode();
			addChild(_idleMode);
			// 载入开始界面
			//_startGame = new StartGame();
			//addChild(_startGame);
		}
		
		

		

		
		
		
	}

}
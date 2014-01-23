package  
{

	import events.ScrollEvent;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import starling.display.Sprite;
	import flash.geom.Point;
	import flash.utils.clearInterval;
	import flash.utils.setTimeout;
	import flash.utils.Timer;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	import events.TalkEvent;

	/**
	 * 探索模式.
	 * 玩家可在其中实现人物移动, 获取物品, 场景切换, 交流对话等功能.
	 * 由下至上，游戏层级分别为地图层、人物层、物品层、效果层、对话层、控制层。
	 * @author Qiao Xiaomeng
	 */
	
	// TODO:
	// 1. 场景切换。
	// 2. 视窗调整。（场景似乎也需单独划分类别。）
	// 3. 加入底层与场景类
	// 4. 碰撞检测具体运用，即场景类别需要加入碰撞检测框。
	// 6. 碰撞检测整合至场景类（或Player类）
	// 7. BUG：点击NPC，玩家角色也会跟着动
	// 8. 地点
	// 9. 游戏时间
	// 10.暂停
	 
	public class IdleMode extends GameMode
	{
		// 游戏层级
		
		// 游戏底层
		private var bgLayer:Sprite;
		// 地图层
		private var mapLayer:Sprite;
		// 人物层
		private var actorLayer:Sprite;
		// 事件层
		private var eventLayer:Sprite;
		// 对话层
		private var dialogueLayer:Sprite;
		// 控制层
		private var ctrlLayer:Sprite;
		

		// 玩家角色
		public var _player:Player;
		// 鼠标坐标
		private var mouseX:Number = 0;
		private var mouseY:Number = 0;
		// 对话
		private var dialogue:Dialogue;
		// 判断鼠标是否按下
		var mouseIn:Boolean;
		// 判断是否可以开始对话（全局变量）
		public static var canTalkNow:Boolean;
		// 计时器（判断闲置延时，若大于一定时间则播放闲置动画）
		var timer:Number;
		// 碰撞检测框架
		var bmd:BitmapData;
		
		var canWalk:Boolean = false;
		
		public var NPCLayer:Sprite;
		
		public var _npc:NPC;
		public static var talkLayer:Sprite;
		
		public var _map:Map;
		
		

		public function IdleMode() 
		{
			// 碰撞检测测试
			// 注意：碰撞检测框架需放在游戏场景之下
			//_scene2 = new Image(new Assets().getTexture("Scene2Texture"));
			
			//bmd = (new Assets().getBitmapData("Scene2Texture"));
			
			// 游戏层次初始化
			layerInit();
			
			// 载入游戏场景
			addMap();


			// 载入玩家角色
			addPlayer();

			_npc = new NPC(400, 300);
			this.addChild(_npc);
			
			
			// 刷新
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			// 鼠标监听
		_map.addEventListener(TouchEvent.TOUCH, onTouch);
			_npc.addEventListener(TalkEvent.TALK, onTalk);
			_player.addEventListener(ScrollEvent.SCROLL, onScroll);
		
		}		
		
		

		
		

		
		
		// 游戏层次显示初始化
		private function layerInit():void 
		{
			// 添加游戏底层
			bgLayer = new Sprite();
			addChild(bgLayer);
			// 添加地图层
			mapLayer = new Sprite();
			bgLayer.addChild(mapLayer);
			// 添加人物层
			actorLayer = new Sprite();
			bgLayer.addChild(actorLayer);
			// 添加对话层
			dialogueLayer = new Sprite();
			bgLayer.addChild(dialogueLayer);
			// 添加事件层
			eventLayer = new Sprite();
			bgLayer.addChild(eventLayer);
			// 添加控制层
			ctrlLayer = new Sprite();
			bgLayer.addChild(ctrlLayer);
		}
		
		
		// 载入游戏场景
		private function addMap():void 
		{
			_map = new Map("Scene1Texture");
			mapLayer.addChild(_map);
		}

		
		// 载入玩家角色
		private function addPlayer():void 
		{
			_player = new Player();
			_player.x = 300;
			_player.y = 400;
			actorLayer.addChild(_player);
		}
	
		private function onScroll(e:ScrollEvent):void 
		{
			trace("卷轴");
		}
		
		private function onTalk(e:Event):void 
		{
			trace("这就是对话");			dialogue = new Dialogue();
			addChild(dialogue);
			
		}
		

		
		/**
		 * 监测每帧刷新
		 * @param	e
		 */
		private function onEnterFrame(e:Event):void 
		{
			
			// 玩家角色移动至鼠标坐标

			_player.walkTo(mouseX, mouseY);
			_player.playerHitTest(new Point(_map.x, _map.y), _map.mapBMD);
			
			//_player.scalePlayer();
			//var bounds:Rectangle = _player.getBounds(this);
			//if (bounds.intersects(_map.eventRect))
			//{
			//	trace("场景跳转!");
			//}
		
			
			if (_player.x > 300)
			{
				root.x = 300 - _player.x;
				
				}
				
				
		
	


        }
			
		private function onTouch(e:TouchEvent):void 
		{
			// 监听鼠标事件
			var touch:Touch = e.getTouch(e.target as DisplayObject);
			// 如果鼠标事件存在
			if (touch)
			{	
				// 待机
				standBy();
				// 鼠标点击
				if (touch.phase == TouchPhase.BEGAN)
				{
					mouseIn = true;	
					
	
				}		
				else if (touch.phase == TouchPhase.HOVER)
				{
					trace("可以行走");
					//canWalk = true;
				}
				// 鼠标点击结束
				else if (touch.phase == TouchPhase.ENDED)
				{
					mouseIn = false;
				}	
				//else if (touch.phase == TouchPhase.)
			if ( mouseIn )
			{
					// 获取鼠标坐标
					var pos:Point = touch.getLocation(e.target as DisplayObject);
					
					// 存储鼠标坐标
					mouseX = pos.x;
					//trace(mouseX);
					//trace(_map.x);
					mouseY = touch.globalY;
					
					canWalk = true;
			}

			
			// 判断鼠标经过是否为可对话对象
			// TODO: 加入可对话对象
			// TODO: 方圆几里之内才能够对话
			//if (pos.x > 400)
		/*	{
				// 显示可对话标记
				trace("可以对话");
				// 判断鼠标是否按下
				if (canTalkNow == false)
				{
					canTalkNow = true;
				}
				
				if (mouseIn)
				{
					trace("对话中");
					
					// 保持角色位置不变
					
				}*/
				
			
				
			//}
				
				// 判断鼠标点击是否为可触发事件对象
			

		
			}

			
		}		
		

		
		/**
		 * 待机函数
		 */
		private function standBy():void 
		{
			//trace("有操作");
			// 重新计算时间
			clearInterval(timer);
			// 待机改变内容
			timer = setTimeout(function() { 
			//trace("无操作");
			// 播放人物闲置动画
			_player.idleAnim();
			}, 5000);
		}
		

		

	}

}
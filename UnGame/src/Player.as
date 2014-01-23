package  
{
	import events.PlayerStopEvent;
	import events.ScrollEvent;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * 玩家角色类（探索模式）
	 * @author Qiao Xiaomeng
	 */	
	
	 // TODO:
	// 3. 闲置动画
	// 4. 与场景类联动完成人物形变
	

	

	public class Player extends Sprite 
	{
		// 负责调用角色动画的MovieClip对象
		private var pmc:MovieClip;
		// 速度
		private var speed:Number = 3;
		// 玩家角色BitmapData对象，用于处理碰撞检测
		public var bmd:BitmapData;
		// 最大形变量，根据场景纵深得出
		public static var SCALE_AMOUNT:Number = 5;
		// 形变比例
		private var isWalking:Boolean = true;
		var isArrival:Boolean;

		
		public function Player() 
		{
			// 载入玩家角色
			pmc = new MovieClip(new Assets().getMCTextures("kola", "kola"));
			addChild(pmc);
			// 玩家角色BitmapData对象，用于处理碰撞检测
			bmd = (new Assets().getBitmapData("testplayerTexture"));
			// 将玩家角色锚点移至中心，确保移动准确
			this.pivotX = this.width / 2;
			this.pivotY = this.height / 2;
			this.addEventListener(PlayerStopEvent.PLAYERSTOP, onPlayerStop);
	
		}
		
		private function onPlayerStop(e:PlayerStopEvent):void 
		{
			isWalking = false;
		}

		
		/**
		 * 玩家角色移动至某处
		 * @param	pointX
		 * @param	pointY
		 */
		public function walkTo(pointX:Number, pointY:Number):void
		{
			if (this.x <= 0)
			{x = 0; }
			else
			{isWalking = true;}
		
			// 鼠标与玩家坐标之差
			var tx:Number = - (this.x - pointX);
			var ty:Number = - (this.y - pointY);
			// 鼠标点击位置与玩家角色距离计算
			var dis:Number = Math.sqrt(tx * tx + ty * ty);
			// 计算不同方向分量
			var tan:Number = Math.atan2(ty, tx);
			var dx:Number = Math.cos(tan) * speed;
			var dy:Number = Math.sin(tan) * speed;
			// 移动玩家角色
			if ( !isArrival )
			//这一句作用尚未搞清
			{
				if (isWalking)
				{
					this.x += dx;
					this.y += dy;
				}
				else 
				{
					//this.x += 0 ;
					//this.y += 0 ;
				}

			}
			else
			{
				
			}

			
			// 计算移动角度
			var cos:Number = tx / dis;
			var angle:int = int(Math.floor(Math.acos(cos) * 180 / Math.PI));
			if ( ty < 0 )
			{
				angle = 360 - angle;
			}
			// 根据移动角度判断行走区域，并播放行走动画
			if (angle > 337 || angle < 23)
			{
				//trace("右"); 
			}
			else if ( angle > 292 )
			{
				//trace("右上");
			}
			else if ( angle > 247 )
			{
				//trace("上");
			}
			else if ( angle > 202 )
			{
				//trace("左上");
			}
			else if ( angle > 157 )
			{
				//trace("左");
			}
			else if ( angle > 112 )
			{
				//trace("左下")
			}
			else if ( angle > 67 )
			{
				//trace("下");
			}
			else 
			{
				//trace("右下");
			}
		}
		
		// 播放闲置动画
		public function idleAnim():void
		{
			//Starling.juggler.add();
			trace("闲置动画");
		}
		

		
		// 透视形变
		public function scalePlayer(ce:Number):void
		{
			var scalePlayer:Tween=new Tween(this, .5, Transitions.EASE_OUT_ELASTIC);
			scalePlayer.scaleTo(ce);
			Starling.juggler.add(scalePlayer);
		}
		
		// 碰撞检测
		public function playerHitTest(hitPoint:Point, hitBMD:BitmapData):void
		{
			var point:Point = new Point();
			point.x = this.x;
			point.y = this.y;
			if (this.bmd.hitTest(point, 255, hitBMD, hitPoint, 255))
			{
				trace("玩家角色碰撞");
				return;
				
			}
			else { isWalking = true; }

			

				
		}
		
		public override function dispose():void
		{
			super.dispose();
			removeChild(pmc);
		}
		
		
	}

}
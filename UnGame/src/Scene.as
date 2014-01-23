/*package  
{*/
	import flash.display.BitmapData;
	import flash.geom.Point;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.TextureAtlas;
	
	/**
	 * 游戏场景（地图）类。
	 * 用于地图层。
	 * @author Qiao Xiaomeng
	 */
	
	 /**
	  * TODO:
		  * 1.到达出口
		  * 2.Camera
		  * 3.形变系数
	  */
	public class Scene extends Sprite 
	{
		// 场景ID
		public var sceneID:int;

		public var visibleRegionBPD:BitmapData;
		public var sceneImage:Image;
		public var atlasExist:Boolean = false;
		
		
		
		public function Scene(name:String) 
		{
			trace(atlasExist);
			// 获取场景名称
			this.name = name;
			// 如果尚未载入纹理图集，则载入
			if (!atlasExist)
			{出口是标准碰撞检测
				var scenesAtlas:TextureAtlas = new TextureAtlas(new Assets().getTextureAtlas("Scenes"));
				atlasExist = true;
			}
			// 场景Image
			this.sceneImage = new Image(scenesAtlas.getTexture(this.name));
			// 如果已经载入场景Image，则加载可行走区域的位图数据
			if (sceneImage)
			{
				this.visibleRegionBPD = new BitmapData(new Assets().getBitmapData(this.name + "BPD"));
				addChild(visibleRegionBPD);
			}
			addChild(sceneImage);
		}
		
		private function loadAnotherScene():void 
		{	
			// 如果进入边缘
			{
				this.removeChild(sceneImage);
				this.removeChild(visibleRegionBPD);
				
			}
			
		}
		
		private function canWalkThrough(bmd:BitmapData, point:Point):void 
		{
			// 碰撞检测
			var point1:Point = new Point();
			var point2:Point = new Point();
			point1 = point;
			point2.x = this.x;
			point2.y = this.y;
			visibleRegionBPD.hitTest(point1, 255, bmd, point2, 255)
			{
				trace("hit!");
			}
		}
		
	}

}
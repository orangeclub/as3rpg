package  
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import starling.display.Image;
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author Qiao Xiaomeng
	 */
	
	/**
	 * TODO:
		 * 1.根据名称载入地图（脚本化？）
		 * 2.碰撞检测——也可以用事件处理
		 * 3.Camera
	 */
	public class Map extends Sprite 
	{
		
		public var eventRect:Rectangle;
		
		public var mapImage:Image;
		
		public var mapName:String;
		public var mapBMD:BitmapData;
		//public var mapBMDImage:Image;
		
		public var exitRegion:Sprite;
		
		public function Map(mapName:String) 
		{
			// 获取地图名称
			this.mapName = mapName;
			// 如果尚未载入纹理，则载入纹理
			if (!mapImage)
			{
				mapImage = new Image(new Assets().getTexture(mapName));
				this.addChild(mapImage);
			}
			// 如果已载入纹理，则可载入BitmapData文件
			if (mapImage)
			{
				mapBMD = (new Assets().getBitmapData(mapName + "BMD"));
			}
			
			//mapBMDImage = new Image(new Assets().getTexture(mapName + "BMD"));
			//this.addChild(mapBMDImage);

			
			
			
			//eventRect = new Rectangle(0, 0, 80, 40);
	
			
			
		}
		

		
		public override function dispose():void 
		{
			super.dispose();
			this.removeChild(mapImage);
			mapImage.dispose();
			
			
		}
		
	}

}
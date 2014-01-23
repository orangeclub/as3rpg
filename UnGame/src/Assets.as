package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.utils.Dictionary;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	/**
	 * 资源管理类。
	 * @author Qiao Xiaomeng
	 */
	public class Assets 
	{
		// 字体
		
		// 声音
		
		//地图素材
		[Embed(source = "/../assets/scenes/scene1.png")]
		public var Scene1Texture:Class;
		[Embed(source = "/../assets/scenes/scene2.png")]
		public var Scene2Texture:Class;
		// 地图BMD
		[Embed(source = "/../assets/scenes/scene1bmd.png")]
		public var Scene1TextureBMD:Class;
		// 玩家角色
		[Embed(source = "/../assets/Kola.xml", mimeType = "application/octet-stream")]
		public var kolaData:Class;
		[Embed(source = "/../assets/Kola.png")]
		public var kolaTexture:Class;
		[Embed(source = "/../assets/testplayer.png")]
		public var testplayerTexture:Class;
		// 游戏按钮
		[Embed(source = "/../assets/button.png")]
		public var ButtonTexture:Class;
		// 材质缓存
		private static var sTextures:Dictionary = new Dictionary();
		private static var sSound:Dictionary = new Dictionary();
		private static var sTextureAtlas:TextureAtlas;
		
		
		
		public function Assets() 
		{
			
		}
		
		public function getEmbedResource(className:String):*
		{
			var result:*;
			if (this.hasOwnProperty(className))
			{
				var cls:Class = this[className] as Class;
				result = new cls();
			}
			else throw new Error("未找到指定名称的嵌入素材");
			return result;
		}
		
		public function getTexture(name:String):Texture
		{
			var bitmap:Bitmap = getEmbedResource(name) as Bitmap;
			if (bitmap)
			{
				return Texture.fromBitmap(bitmap);
			}
			return null;
			
		}
		
		public function getBitmapData(name:String):BitmapData
		{
			var bitmap:Bitmap = getEmbedResource(name) as Bitmap;
			if (bitmap)
			{
				return bitmap.bitmapData;
				
			}
			return null;
			
		}
		
		public function getTextureAtlas(name:String):TextureAtlas
		{
			var result:TextureAtlas;
			var tBMP:Bitmap = getEmbedResource( name + "Texture" ) as Bitmap;
			var tXML:XML = XML(getEmbedResource( name + "Data" ));
			if( tBMP && tXML )
			{
				result = new TextureAtlas(Texture.fromBitmap(tBMP), tXML);
			}
			return result;
		}
		
		public function getMCTextures(textureAtlasName:String, texturesPrefix:String):Vector.<Texture>
		{
			var result:Vector.<Texture>;
			var atlas:TextureAtlas = getTextureAtlas(textureAtlasName);
			if( atlas )
			{
				result = atlas.getTextures(texturesPrefix);
			}
			return result;
		}
	}

}
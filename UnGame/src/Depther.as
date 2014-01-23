package  
{
	import flash.display.Shape;
	import flash.display.Sprite;
	
	/**
	 * 元件深度。
	 * 使用Shape创建深度，因其不接受鼠标事件，可一定程度减少资源
	 * @author Qiao Xiaomeng
	 */
	public class Depther extends Shape 
	{
		
		public function Depther(bg:Sprite, num:uint) 
		{
			for (var i:uint = 0; i < num; i++ )
			{
				var temp = new Shape();
				bg.addChild(temp);
			}
			
		}
		
	}

}
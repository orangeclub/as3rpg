package events 
{
	import starling.events.Event;
	/**
	 * ...
	 * @author Qiao Xiaomeng
	 */
	public class ScrollEvent extends Event
	{
		public static const SCROLL:String = "scrollMap";
		public var disX:Number;
		public var disY:Number;
		
		public function ScrollEvent(disX:Number, disY:Number) 
		{
			this.disX = disX;
			this.disY = disY;
			super(SCROLL);
		}
		
	}

}
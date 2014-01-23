package events 
{
	import flash.geom.Rectangle;
	import starling.events.Event;
	/**
	 * ...
	 * @author Qiao Xiaomeng
	 */
	public class JumpEvent extends Event
	{
		public static const JUMP:String = "jumpScenes";
		
		public var eventRect:Rectangle;
		
		public function JumpEvent(eventRect:Rectangle) 
		{
			this.eventRect = eventRect;
			super(JUMP);
		}
		
	}

}
package  events
{
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Qiao Xiaomeng
	 */
	public class TalkEvent extends Event 
	{
		/**
		 * 事件类型
		 * @default
		 */
		public static const TALK:String = "talk";
		 
		public function TalkEvent() 
		{
			super(TALK);
		}
		
	}

}
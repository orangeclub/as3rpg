package events 
{
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Qiao Xiaomeng
	 */
	public class PlayerStopEvent extends Event 
	{
					/**
		 * 事件类型
		 * @default
		 */
		public static const PLAYERSTOP:String = "playerStop";
		public function PlayerStopEvent() 
		{

		 

			super(PLAYERSTOP);

		}
		
	}

}
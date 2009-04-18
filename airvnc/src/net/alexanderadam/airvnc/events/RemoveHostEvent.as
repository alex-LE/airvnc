package net.alexanderadam.airvnc.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import flash.events.Event;

	public class RemoveHostEvent extends CairngormEvent
	{
		public static const REMOVE_HOST:String = 'Removed_Host';
		
		public var id:String;
		
		public function RemoveHostEvent(id:String)
		{
			super(REMOVE_HOST);
			
			this.id = id;
		}
		
		override public function clone():Event {
			return new RemoveHostEvent(id);
		}
	}
}
package net.alexanderadam.airvnc.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;
	
	public class LoadDataEvent extends CairngormEvent
	{
		public static const LOAD_DATA:String = 'Load_Data';
		
		public function LoadDataEvent() {
			super(LOAD_DATA);
		}
		
		override public function clone():Event {
			return new LoadDataEvent();
		}
	}
}
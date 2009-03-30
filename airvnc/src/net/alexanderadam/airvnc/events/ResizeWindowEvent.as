package net.alexanderadam.airvnc.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;
	
	public class ResizeWindowEvent extends CairngormEvent
	{
		public static const RESIZE_WINDOW:String = 'Resize_Window';
		
		public function ResizeWindowEvent() {
			super(RESIZE_WINDOW);
		}
		
		override public function clone():Event {
			return new ResizeWindowEvent();
		}
	}
}
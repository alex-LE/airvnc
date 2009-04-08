package net.alexanderadam.airvnc.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import flash.events.Event;

	public class AddHostEvent extends CairngormEvent
	{
		public static const ADD_HOST:String = 'Add_Host';
		
		public var host:String;
		public var port:String;
		public var password:String;
		public var viewtype:String;
		
		public function AddHostEvent(host:String, port:String, password:String, viewtype:String)
		{
			super(ADD_HOST);
			
			this.host = host;
			this.port = port;
			this.password = password;
			this.viewtype = viewtype;
		}
		
		override public function clone():Event {
			return new AddHostEvent(host, port, password, viewtype);
		}
	}
}
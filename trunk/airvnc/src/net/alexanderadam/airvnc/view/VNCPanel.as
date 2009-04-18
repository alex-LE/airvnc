package net.alexanderadam.airvnc.view
{
	import mx.containers.Canvas;
	import mx.containers.Panel;
	import mx.controls.Label;

	public class VNCPanel extends Panel
	{
		public var host:String;
		public var password:String;
		public var actionpanel:Canvas;
		public var titleCaption:Label;
		public var titlepanel:Canvas;
		
		protected var videoWidth:uint = 640;
		protected var videoHeight:uint = 480;
		
		public function VNCPanel()
		{
			super();
		}
		
		public function resizeMe():void {}
		public function reconnect():void {}
		public function disconnect():void {}
	}
}
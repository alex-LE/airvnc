package net.alexanderadam.airvnc.view
{
	import flash.filters.DropShadowFilter;
	
	import mx.containers.Panel;
	import mx.containers.Canvas;

	public class VNCPanel extends Panel
	{
		public var host:String;
		public var password:String;
		public var actionpanel:Canvas;
		
		public function VNCPanel()
		{
			super();
		}
		
	}
}
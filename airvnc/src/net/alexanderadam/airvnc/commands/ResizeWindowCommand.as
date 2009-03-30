package net.alexanderadam.airvnc.commands
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	import net.alexanderadam.airvnc.events.*;
	import net.alexanderadam.airvnc.model.ViewModelLocator;
	
	public class ResizeWindowCommand implements ICommand, IResponder
	{
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		
		public function ResizeWindowCommand()
		{
		}

		public function execute(event:CairngormEvent):void {
			var e:ResizeWindowEvent = event as ResizeWindowEvent;
			modelLocator.resized = true;			
			trace('window resized');
		}
		
		public function result(event:Object):void {
			
		}
		
		public function fault(event:Object):void {
			
		}
	}
}
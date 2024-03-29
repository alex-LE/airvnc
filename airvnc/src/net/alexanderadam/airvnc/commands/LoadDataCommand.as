package net.alexanderadam.airvnc.commands
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	import net.alexanderadam.airvnc.business.LoadDataDelegate;
	import net.alexanderadam.airvnc.events.*;
	import net.alexanderadam.airvnc.model.ViewModelLocator;
	
	public class LoadDataCommand implements ICommand, IResponder
	{
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		
		public function LoadDataCommand()
		{
		}

		public function execute(event:CairngormEvent):void {
			var e:LoadDataEvent = event as LoadDataEvent;
			var delegate:LoadDataDelegate = new LoadDataDelegate(this);
			delegate.send();
			trace('loading data');
		}
		
		public function result(event:Object):void {
			modelLocator.itemsadded = true;
			modelLocator.itemlist = event.result as XML;
			modelLocator.appTitle = 'airVNC - servers.xml';
			trace('data loaded');
		}
		
		public function fault(event:Object):void {
			
		}
	}
}
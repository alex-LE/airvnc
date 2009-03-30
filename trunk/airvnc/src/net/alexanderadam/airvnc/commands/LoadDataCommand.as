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
//			modelLocator.resized = true;
			modelLocator.itemsadded = true;
			modelLocator.itemlist = event.result as XML;
			
			trace('data loaded');
			
			/*
			for each (var item:Object in event.result.Connection) {
				var vnc:VNCPanel;
				if(item.@type.toString() == 'thumb') {
					vnc = new VNCThumbnailPanel();
				} else if(item.@type.toString() == 'live') {
					vnc = new VNCLivePanel();
				} else {
					Alert.show('Invalid Type!');
					continue;
				}
				item
				
				vnc.password = Encryption.decrypt(item.@Password.toString(), this.key);
				vnc.host = item.@Host.toString();
				vnc.initialize();
				//vnc.addEventListener('VNCConnected', showImage);
				itemlist.addChild(vnc);
			}
			*/
		}
		
		public function fault(event:Object):void {
			
		}
	}
}
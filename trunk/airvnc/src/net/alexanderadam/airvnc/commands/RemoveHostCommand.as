package net.alexanderadam.airvnc.commands
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	import net.alexanderadam.airvnc.events.*;
	import net.alexanderadam.airvnc.model.ViewModelLocator;
	
	public class RemoveHostCommand implements ICommand, IResponder
	{
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		
		public function RemoveHostCommand()
		{
		}

		public function execute(event:CairngormEvent):void {
			var e:RemoveHostEvent = event as RemoveHostEvent;
			
			var i:Number = 0;
			for each (var item:XML in modelLocator.itemlist.Connection) {
				if(item.@id == e.id) {
					delete modelLocator.itemlist.Connection[i];
					break;
				}
				i++;
			}
			modelLocator.itemlist = modelLocator.itemlist.copy();
			modelLocator.itemsadded = true;
			trace('item removed');
			
			/*
			var newitem:XML = new XML(<Connection Host="" Password="" type=""/>);
			newitem.@Host = e.host;
			newitem.@Password = Encryption.encrypt(e.password, modelLocator.key);
			newitem.@type = e.viewtype;
			
			modelLocator.itemlist.appendChild(newitem);
			modelLocator.itemlist = modelLocator.itemlist.copy();
			modelLocator.itemsadded = true;
			modelLocator.appTitle += '*';
			trace('new item added');
			*/
		}
		
		public function result(event:Object):void {
		}
		
		public function fault(event:Object):void {
			
		}
	}
}
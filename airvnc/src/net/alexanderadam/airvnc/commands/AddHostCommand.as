package net.alexanderadam.airvnc.commands
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	import net.alexanderadam.airvnc.events.*;
	import net.alexanderadam.airvnc.helper.Encryption;
	import net.alexanderadam.airvnc.model.ViewModelLocator;
	
	public class AddHostCommand implements ICommand, IResponder
	{
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		
		public function AddHostCommand()
		{
		}

		public function execute(event:CairngormEvent):void {
			var e:AddHostEvent = event as AddHostEvent;
			var newitem:XML = new XML(<Connection Host="" Password="" type=""/>);
			newitem.@Host = e.host;
			newitem.@Password = Encryption.encrypt(e.password, modelLocator.key);
			newitem.@type = e.viewtype;
			
			modelLocator.itemsadded = true;
			modelLocator.itemlist.appendChild(newitem);
		}
		
		public function result(event:Object):void {
		}
		
		public function fault(event:Object):void {
			
		}
	}
}
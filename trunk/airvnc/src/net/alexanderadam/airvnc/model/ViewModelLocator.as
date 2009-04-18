package net.alexanderadam.airvnc.model
{
	import com.adobe.cairngorm.model.IModelLocator;
	
	import flash.filesystem.File;
	
	[Bindable]
	public class ViewModelLocator implements IModelLocator
	{
		// Single Instance of Our ModelLocator
		private static var instance:ViewModelLocator;
	
		public function ViewModelLocator(enforcer:SingletonEnforcer) {
			if (enforcer == null) {
				throw new Error( "You Can Only Have One ModelLocator" );
			}
		}

		// Returns the Single Instance
		public static function getInstance() : ViewModelLocator {
			if (instance == null) {
				instance = new ViewModelLocator( new SingletonEnforcer );
			}
			return instance;
		}	
	
		// DEFINE YOUR VARIABLES HERE
		public var itemlist:XML = new XML('<servers></servers>');
		public var resized:Boolean;
		public var itemsadded:Boolean;
		
		public var isMaximized:Boolean = false;
		
		public var appTitle:String = 'airVNC';
		
		public var serversfile:String = File.applicationStorageDirectory.nativePath + File.separator + 'servers.xml';
		
		// key for password encryption
		public var key:String = '545be77c7cbcf6b24eed68202763116c';
		
		// reload all items
		public var reloadall:Boolean = false;
		
		// reload all items every 10min - by default - in minutes
		public var reloadall_time:int = 10;
		
	}
}

class SingletonEnforcer {}
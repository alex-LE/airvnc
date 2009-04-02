package net.alexanderadam.airvnc.model
{
	import com.adobe.cairngorm.model.IModelLocator;
	
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
		public var itemlist:XML;
		public var resized:Boolean;
		public var itemsadded:Boolean;
		
		public var isMaximized:Boolean = false;
		
		// key for password encryption
		public var key:String = '545be77c7cbcf6b24eed68202763116c';
	}
}

class SingletonEnforcer {}
package net.alexanderadam.airvnc.control
{
	import com.adobe.cairngorm.control.FrontController;
	
	import net.alexanderadam.airvnc.commands.*;
	import net.alexanderadam.airvnc.events.*;
	
	public class MainController extends FrontController
	{
		public function MainController()
		{
			this.initialize();
		}

		public function initialize():void {
			
			// ADD COMMANDS
			this.addCommand(ResizeWindowEvent.RESIZE_WINDOW, ResizeWindowCommand);
			this.addCommand(LoadDataEvent.LOAD_DATA, LoadDataCommand);
			this.addCommand(AddHostEvent.ADD_HOST, AddHostCommand);
			this.addCommand(RemoveHostEvent.REMOVE_HOST, RemoveHostCommand);
		}
	}
}
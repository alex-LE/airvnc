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
			//this.addCommand(LoginEvent.LOGIN, LoginCommand);
			//this.addCommand(LoadOverviewBusinessEvent.LOADOVERVIEWBUSINESS, LoadOverviewBusinessCommand);
			//this.addCommand(LoadOrdersRevenuesEvent.LOADORDERSREVENUES, LoadOrdersRevenuesCommand);
		}
	}
}
package net.alexanderadam.airvnc.business
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.IResponder;
	import mx.rpc.http.mxml.HTTPService;
	
	public class LoadDataDelegate
	{
		private var responder:IResponder;
		private var service:Object;
		
		
		public function LoadDataDelegate(responder:IResponder) {
			this.responder = responder;
			this.service = ServiceLocator.getInstance().getHTTPService('dataXML');
		}

		public function send():void {
			var call:Object = service.send();
			call.addResponder(responder);
		}
	}
}
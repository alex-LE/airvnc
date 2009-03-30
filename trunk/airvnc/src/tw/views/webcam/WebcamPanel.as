package tw.views.webcam
{
	import mx.containers.Panel;

	public class WebcamPanel extends Panel
	{
		import mx.containers.Panel;
		import flash.media.Camera;
		import flash.media.Video;
		import mx.core.UIComponent;  
		
		public var video:Video;
		public function WebcamPanel(){
			super();
			insertWebcamVideo();
		}
		
		public function insertWebcamVideo():void{
		   var videoHolder:UIComponent = new UIComponent();
		   var camera:Camera = Camera.getCamera();
		   video = new Video(camera.width*2, camera.height*2);
		   video.attachCamera(camera);
		   videoHolder.addChild(video);
		   addChild(videoHolder);
		   videoHolder.y =10;
		}
	}
}
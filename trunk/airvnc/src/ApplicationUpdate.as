import air.update.ApplicationUpdater;
import air.update.events.*;
import mx.events.CloseEvent;
import mx.controls.Alert;
       	
private var appUpdater:ApplicationUpdater = new ApplicationUpdater();        	
        	
// ActionScript file
private function startUpdater():void {
	appUpdater.updateURL = 'http://10.1.142.15/~aadam/vncthumbnailviewer/updates/updateDescriptor.xml';
	appUpdater.delay = 1;
	appUpdater.addEventListener(UpdateEvent.INITIALIZED, updaterInitialized);
	appUpdater.addEventListener(StatusUpdateEvent.UPDATE_STATUS, updateStatusHandler);
	appUpdater.addEventListener(StatusUpdateErrorEvent.UPDATE_ERROR, updateStatusErrorHandler);
	appUpdater.addEventListener(ErrorEvent.ERROR, onError);

	appUpdater.initialize();
}

private function onError(ev:ErrorEvent):void{
  Alert.show("Update failed", ev.text);
}
 
private function updaterInitialized(event:UpdateEvent):void {
  appUpdater.checkNow();
}
 
private function updateStatusErrorHandler(event:StatusUpdateErrorEvent) : void {
  Alert.show("Update failed:" + event.text);
}
 
private function updateStatusHandler(event:StatusUpdateEvent) : void {
  // stop the event from triggering the update download/install by itself
  event.preventDefault();
  if (event.available) {
	Alert.okLabel = "Update";
	Alert.buttonWidth = 80;
	var def:XML = (event.target as ApplicationUpdater).updateDescriptor;
	var releaseNotes:String = getUpdateReleaseNotes(event.details);
	Alert.show("A new version (" + event.version + ") has been found and will be installed automatically" + releaseNotes, "Compulsory update: " + event.version, Alert.OK, null, updateChoiceAlertHandler);			   
  }
}
 
private function getUpdateReleaseNotes(details:Array) : String {
  var releaseNotes:String = "";
  for (var i:Number=0; i<details[0].length; i++) {
    releaseNotes += details[0][i] + "\n";
  }
  return releaseNotes;
}
 
private function updateChoiceAlertHandler(event:CloseEvent) : void {
  if (event.detail == Alert.OK) {
    appUpdater.downloadUpdate();
  } 
}
package net.alexanderadam.airvnc.view.components
{
	import mx.controls.LinkButton;
	import mx.core.IFlexDisplayObject;
	import mx.core.mx_internal;
	use namespace mx_internal;
	import flash.text.TextLineMetrics;
	import net.alexanderadam.airvnc.view.components.NoTruncationUITextField;
	import flash.display.DisplayObject;

	public class MultiLineButton extends LinkButton
	{
		public function MultiLineButton()
		{
			super();
			
		}
	
		override protected function createChildren():void
		{
			if (!textField)
			{
				textField = new NoTruncationUITextField();
				textField.styleName = this;
				addChild(textField as DisplayObject);
			}
	
			super.createChildren();
	
			textField.multiline = true;
			textField.wordWrap = true;
		}
	
		override protected function measure():void
		{
			if (!isNaN(explicitWidth))
			{
				var tempIcon:IFlexDisplayObject = getCurrentIcon();
				var w:Number = explicitWidth;
				if (tempIcon)
					w -= tempIcon.width + getStyle("horizontalGap") + getStyle("paddingLeft") + getStyle("paddingRight");
				textField.width = w;
			}
			super.measure();
		
		}
	
	    override public function measureText(s:String):TextLineMetrics
		{
			textField.text = s;
			var lineMetrics:TextLineMetrics = textField.getLineMetrics(0);
			lineMetrics.width = textField.textWidth + 4;
			lineMetrics.height = textField.textHeight + 4;
			return lineMetrics;
		}
		
	}
}
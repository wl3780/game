package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	[SWF(frameRate="30", width="940", height="560")]
	public class AIMain extends Sprite
	{
		public function AIMain()
		{
			super();
			if (this.stage) {
				this.init(null);
			} else {
				this.addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		
		private function init(evt:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.stage.align = StageAlign.TOP_LEFT;
			this.stage.scaleMode = StageScaleMode.NO_SCALE;
		}
	}
}
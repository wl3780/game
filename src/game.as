package
{
	import com.adobe.crypto.MD5;
	import com.coder.engine.Engine;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.system.Capabilities;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuBuiltInItems;
	
	import modules.ModuleConst;
	import modules.network.NetworkModule;
	
	public class game extends Sprite
	{
		public function game()
		{
			trace(MD5.hash("1"));
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
			this.stage.quality = StageQuality.MEDIUM;
			
			var b:ContextMenuBuiltInItems = new ContextMenuBuiltInItems();
			b.play = b.print = b.loop = false;
			var menu:ContextMenu = new ContextMenu();
			menu.builtInItems = b;
			menu.hideBuiltInItems();
			this.contextMenu = menu;
			
			// 屏蔽右键方法，需要设置编译器版本
			var verArr:Array = Capabilities.version.slice(3).split(",");
			if (int(verArr[0]) > 11 || (int(verArr[0]) == 11 && int(verArr[1]) >= 2)) {
				this.stage.addEventListener("rightMouseDown", onRightDown);
				this.stage.addEventListener("rightMouseUp", onRightUp);
				this.stage.addEventListener(MouseEvent.RIGHT_CLICK, function(evt:MouseEvent):void {});
			}
			
			Engine.instance.setup(this, ModuleConst, "", NetworkModule, trace);
		}
		
		private function onRightDown(evt:MouseEvent):void
		{
		}
		
		private function onRightUp(evt:MouseEvent):void
		{
		}
	}
}
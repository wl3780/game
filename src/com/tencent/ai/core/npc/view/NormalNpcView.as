// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.npc.view.NormalNpcView

package com.tencent.ai.core.npc.view
{
    import com.tencent.ai.core.render.ElementViewHead;
    import com.tencent.ai.core.render.IFrameListener;
    import com.tencent.ai.core.render.BodyViewLayer;
    import com.tencent.ai.core.npc.INpcAssetManager;
    import com.tencent.ai.core.npc.res.NpcAsset;
    import com.tencent.ai.core.npc.BaseNpc;
    import flash.display.MovieClip;
    import com.tencent.ai.core.display.DisplaySystem;
    import com.tencent.ai.core.events.AssetLoadEvent;
    import flash.display.InteractiveObject;
    import flash.events.MouseEvent;
    import flash.display.Sprite;
    import com.tencent.ai.core.enum.MotionDef;
    import com.tencent.ai.core.events.NpcEvent;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.data.NpcStaticInfo;
    import com.tencent.ai.core.bubble.IBubbleManager;
    import com.tencent.ai.core.display.IDisplay;
    import com.tencent.ai.core.enum.BubbleType;
    import com.tencent.ai.core.enum.NpcStatus;
    import com.tencent.free.core.lib.CLASS;
    import flash.geom.Rectangle;
    import  ©init._SafeStr_816;

    public class NormalNpcView extends ElementViewHead implements IFrameListener 
    {

        private const FRAME_COUNT:int = 900;
        private const BUBBLE_LIFT_TIME:int = 180;

        protected var body:BodyViewLayer;
        protected var npcAssetManager:INpcAssetManager;
        protected var asset:NpcAsset;
        protected var target:BaseNpc;
        protected var m_status:MovieClip;
        private var frameCount:int;
        private var currentFrameCount:int;

        public function NormalNpcView(_arg_1:BaseNpc)
        {
            this.body = DisplaySystem.createBodyViewLayer();
            this.target = _arg_1;
            super(this.body);
        }

        override protected function initThis():void
        {
            super.initThis();
        }

        protected function onAssetLoadComplete(_arg_1:AssetLoadEvent):void
        {
            this.asset.removeEventListener(AssetLoadEvent.COMPLETE, this.onAssetLoadComplete);
            this.body.setMotionAssets(this.asset.motionAssets);
            setMotionID(m_motionID);
            setHeadText(null);
            this.adjustStatusIcon();
            (this.getDisplay() as InteractiveObject).addEventListener(MouseEvent.CLICK, this.onClick);
            (this.getDisplay() as Sprite).buttonMode = true;
            (this.getDisplay() as Sprite).useHandCursor = true;
            this.addFrameListener(MotionDef.L_FRAME_END, this);
        }

        private function onClick(_arg_1:MouseEvent):void
        {
            if (this.asset.motionAssets[1]){
                this.setMotionID(1);
            };
            var _local_2:NpcEvent = new NpcEvent(NpcEvent.NPC_CLICK);
            _local_2.npcID = this.asset.npcID;
            AICore.npcSystem.getNpcManager().dispatchEvent(_local_2);
            _arg_1.stopPropagation();
        }

        public function onFrameEvent(_arg_1:String):void
        {
            this.setMotionID((((Math.random() > 0.65)) ? 1 : 0));
        }

        public function setNpcAssetManager(_arg_1:INpcAssetManager):void
        {
            this.npcAssetManager = _arg_1;
        }

        public function loadAsset(_arg_1:int, _arg_2:NpcStaticInfo):void
        {
            this.m_motionID = 0;
            this.asset = this.npcAssetManager.getNpcAsset(_arg_1, _arg_2.assetURL);
            this.asset.addEventListener(AssetLoadEvent.COMPLETE, this.onAssetLoadComplete);
            this.asset.load();
            setHeadText((((("<a href='event:Hey,boy!'><font color='#ffff00'>" + _arg_2.rank) + "\n") + _arg_2.name) + "</font></a>"));
        }

        override public function render(_arg_1:int):void
        {
            var _local_2:NpcStaticInfo;
            var _local_3:IBubbleManager;
            var _local_4:int;
            var _local_5:IDisplay;
            var _local_6:String;
            super.render(_arg_1);
            if (!this.frameCount){
                this.frameCount = (((Math.random() * this.FRAME_COUNT) + this.BUBBLE_LIFT_TIME) + 2);
            };
            this.currentFrameCount++;
            if (this.currentFrameCount > this.frameCount){
                _local_2 = this.target.sceneNpcInfo.npcModel.staticInfo;
                _local_3 = AICore.bubble;
                _local_4 = _local_2.bubbleMessageList.length;
                _local_5 = this.target.getDisplay();
                if (((((((_local_3) && (_local_4))) && (_local_5.width))) && (_local_5.height))){
                    _local_6 = _local_2.bubbleMessageList[int((Math.random() * _local_4))];
                    _local_3.popUp(this.target, BubbleType.TEXT_BUBBLE, _local_6, this.BUBBLE_LIFT_TIME);
                };
                this.frameCount = 0;
                this.currentFrameCount = 0;
            };
        }

        override public function reset():void
        {
            this.body.clear();
            this.body.reset();
            this.body = null;
            this.m_motionID = -1;
            if (this.asset){
                this.asset.removeEventListener(AssetLoadEvent.COMPLETE, this.onAssetLoadComplete);
                this.asset = null;
            };
            this.npcAssetManager = null;
            this.target = null;
            this.removeStatus();
            super.reset();
        }

        private function removeStatus():void
        {
            var _local_1:int;
            var _local_2:Sprite;
            var _local_3:MovieClip;
            if (this.m_status){
                this.m_status.stop();
                _local_1 = 0;
                while (_local_1 < this.m_status.numChildren) {
                    _local_3 = (this.m_status.getChildAt(_local_1) as MovieClip);
                    if (_local_3){
                        _local_3.stop();
                    };
                    _local_1++;
                };
                _local_2 = (this.m_viewDisplay as Sprite);
                if (_local_2.contains(this.m_status)){
                    _local_2.removeChild(this.m_status);
                    this.m_status = null;
                };
            };
        }

        public function changeStatus(_arg_1:int):void
        {
            var _local_2:Sprite;
            this.removeStatus();
            if (_arg_1 != NpcStatus.NORMAL){
                this.m_status = (CLASS.current.tryNewInstance(("ai.commoneffect.assets.npcstatus.StatusAsset_" + _arg_1)) as MovieClip);
                if (this.m_status){
                    _local_2 = (this.m_viewDisplay as Sprite);
                    _local_2.addChild(this.m_status);
                    this.adjustStatusIcon();
                };
            };
        }

        private function adjustStatusIcon():void
        {
            var _local_1:Rectangle;
            var _local_2:Sprite;
            if (this.m_status){
                _local_1 = this.m_status.getBounds(this.m_status);
                this.m_status.x = int(((this.m_status.width * -0.5) - _local_1.x));
                this.m_status.y = int(((this.m_nameTxt.y - this.m_status.height) - _local_1.y));
                _local_2 = (this.getDisplay() as Sprite);
                _local_2.addChild(this.m_status);
            };
        }

        public /*  ©init. */ function _SafeStr_816()
        {
        }


    }
}//package com.tencent.ai.core.npc.view

// _SafeStr_816 = " NormalNpcView" (String#17120)



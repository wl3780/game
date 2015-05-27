// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.render.BodyViewMultiLayer

package com.tencent.ai.core.render
{
    import com.tencent.ai.core.script.IScriptArrayListener;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.display.ISprite;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.script.IScriptListener;
    import com.tencent.ai.core.display.DisplaySystem;
    import com.tencent.ai.core.data.AssetLayerInfo;
    import com.tencent.ai.core.utils.RectArea;
    import com.tencent.free.logging.warning;
    import com.tencent.ai.core.data.ScriptInfo;
    import com.tencent.ai.core.data.arg.script.ScriptArg;
    import com.tencent.ai.core.data.TingeInfo;
    import com.tencent.ai.core.display.IDisplay;
    import flash.geom.ColorTransform;
    import  ©init._SafeStr_1105;
    import __AS3__.vec.*;

    public class BodyViewMultiLayer implements IMotionView, IFrameListener, IScriptArrayListener 
    {

        private static var _layerPools:Vector.<ILayerRender> = new Vector.<ILayerRender>();

        protected var m_display:ISprite;
        protected var m_layerRenders:Vector.<ILayerRender>;
        protected var m_layerAssetsMap:Dictionary;
        protected var m_mainLayer:ILayerRender;
        protected var m_currentMotionID:int = -1;
        protected var m_layerCount:int = 0;
        protected var m_playing:Boolean = false;
        protected var m_frameListenersMap:Dictionary;
        protected var m_event:String;
        protected var m_scriptListenersList:Vector.<IScriptListener>;
        protected var m_scripts:Array;

        public function BodyViewMultiLayer(_arg_1:Vector.<LayerAsset>=null)
        {
            this.m_display = DisplaySystem.createSprite();
            this.createLayers();
            this.setLayerAssets(_arg_1);
            if (this.m_mainLayer != null){
                this.m_mainLayer.setScriptArrayListener(this);
            };
        }

        public static function GetLayerRender():ILayerRender
        {
            if (_layerPools.length == 0){
                return (DisplaySystem.createLayerRender());
            };
            return (_layerPools.pop());
        }

        public static function ReturnLayerRender(_arg_1:ILayerRender):void
        {
            _layerPools.push(_arg_1);
        }


        protected function createLayers():void
        {
            throw (new Error("[BitmapMovieClip] 为一抽象类不能直接使用!!"));
        }

        protected function updateLayerAssets():void
        {
            var _local_2:ILayerRender;
            var _local_3:LayerAsset;
            var _local_1:int;
            while (_local_1 < this.m_layerCount) {
                _local_2 = this.m_layerRenders[_local_1];
                if (_local_2 != null){
                    _local_2.clear();
                    _local_3 = this.m_layerAssetsMap[_local_2.layerID];
                    if (_local_3 != null){
                        _local_2.setMotionAssets(_local_3.motionAssets);
                    };
                };
                _local_1++;
            };
        }

        protected function broadcastScript(_arg_1:String, _arg_2:Object=null):void
        {
            if (this.m_scriptListenersList == null){
                return;
            };
            var _local_3:int = (this.m_scriptListenersList.length - 1);
            while (_local_3 >= 0) {
                this.m_scriptListenersList[_local_3].onScript(_arg_1, _arg_2);
                _local_3--;
            };
        }

        public function createLayers2(_arg_1:Vector.<AssetLayerInfo>, _arg_2:int=0):void
        {
            var _local_5:int;
            var _local_6:ILayerRender;
            var _local_3:int = (((_arg_1 == null)) ? 1 : _arg_1.length);
            var _local_4:int = this.m_layerRenders.length;
            if (_local_4 > _local_3){
                _local_5 = (_local_4 - _local_3);
                while (_local_5 > 0) {
                    _local_6 = this.m_layerRenders.pop();
                    this.m_display.removeDisplay(_local_6.getDisplay());
                    ReturnLayerRender(_local_6);
                    _local_5--;
                };
            } else {
                if (_local_4 < _local_3){
                    _local_5 = (_local_3 - _local_4);
                    while (_local_5 > 0) {
                        _local_6 = GetLayerRender();
                        _local_6.layerID = this.m_layerRenders.length;
                        this.m_display.addDisplay(_local_6.getDisplay());
                        this.m_layerRenders.push(_local_6);
                        _local_5--;
                    };
                };
            };
            this.m_layerCount = _local_3;
            if (this.m_mainLayer != null){
                this.m_mainLayer.setScriptArrayListener(null);
            };
            this.m_mainLayer = this.m_layerRenders[_arg_2];
            this.m_mainLayer.setScriptArrayListener(this);
        }

        public function getAC():RectArea
        {
            return (this.m_mainLayer.ac);
        }

        public function setLayerAssets(_arg_1:Vector.<LayerAsset>):void
        {
            if (_arg_1 == null){
                return;
            };
            var _local_2:int = _arg_1.length;
            var _local_3:int;
            while (_local_3 < _local_2) {
                this.addLayerAsset(_arg_1[_local_3]);
                _local_3++;
            };
            this.updateLayerAssets();
        }

        public function addLayerAsset(_arg_1:LayerAsset):void
        {
            if (_arg_1 == null){
                return;
            };
            var _local_2:int = _arg_1.layerID;
            if (this.m_layerAssetsMap[_local_2] != null){
                warning((("[BaseActorBody] 层ID:" + _arg_1.layerID) + "存在两个相同的资源!"));
            };
            this.m_layerAssetsMap[_local_2] = _arg_1;
        }

        public function update(_arg_1:Vector.<LayerAsset>):void
        {
            var _local_5:ILayerRender;
            var _local_2:Boolean = this.isPlaying();
            var _local_3:int = this.getMotionID();
            this.m_layerAssetsMap = new Dictionary();
            this.setLayerAssets(_arg_1);
            var _local_4:int;
            while (_local_4 < this.m_layerCount) {
                _local_5 = this.m_layerRenders[_local_4];
                if (_local_5 != null){
                    if (_local_2){
                        _local_5.playMotion(_local_3);
                    } else {
                        _local_5.stopMotion(_local_3);
                    };
                };
                _local_4++;
            };
            this.m_currentMotionID = _local_3;
        }

        public function setMotionID(_arg_1:int):void
        {
            var _local_3:ILayerRender;
            if (this.m_currentMotionID == _arg_1){
                return;
            };
            this.m_currentMotionID = _arg_1;
            var _local_2:int;
            while (_local_2 < this.m_layerCount) {
                _local_3 = this.m_layerRenders[_local_2];
                if (_local_3 != null){
                    _local_3.stopMotion(_arg_1);
                };
                _local_2++;
            };
        }

        public function getMotionID():int
        {
            return (this.m_currentMotionID);
        }

        public function get currentFrameIndex():int
        {
            return (this.m_mainLayer.currentFrameIndex);
        }

        public function get totalFrame():int
        {
            return (this.m_mainLayer.totalFrame);
        }

        public function setRotation(_arg_1:int):void
        {
            this.m_display.rotation = _arg_1;
        }

        public function getRotation():int
        {
            return (this.m_display.rotation);
        }

        public function setDirection(_arg_1:int):void
        {
            this.m_display.scaleX = _arg_1;
        }

        public function getDirection():int
        {
            return (this.m_display.scaleX);
        }

        public function setPlayParam(_arg_1:Number, _arg_2:Number):void
        {
            var _local_4:ILayerRender;
            var _local_3:int;
            while (_local_3 < this.m_layerCount) {
                _local_4 = this.m_layerRenders[_local_3];
                if (((!((_local_4 == null))) && (!(_local_4.isIdel)))){
                    _local_4.setPlayParam(_arg_1, _arg_2);
                };
                _local_3++;
            };
        }

        public function gotoAndPlay(_arg_1:Object=null, _arg_2:int=-1):void
        {
            var _local_4:ILayerRender;
            var _local_3:int;
            while (_local_3 < this.m_layerCount) {
                _local_4 = this.m_layerRenders[_local_3];
                if (((!((_local_4 == null))) && (!(_local_4.isIdel)))){
                    _local_4.gotoAndPlay(_arg_1, _arg_2);
                };
                _local_3++;
            };
            this.m_playing = true;
        }

        public function gotoAndStop(_arg_1:Object=null, _arg_2:int=-1):void
        {
            var _local_4:ILayerRender;
            var _local_3:int;
            while (_local_3 < this.m_layerCount) {
                _local_4 = this.m_layerRenders[_local_3];
                if (((!((_local_4 == null))) && (!(_local_4.isIdel)))){
                    _local_4.gotoAndStop(_arg_1, _arg_2);
                };
                _local_3++;
            };
            this.m_playing = false;
        }

        public function stop():void
        {
            var _local_2:ILayerRender;
            var _local_1:int;
            while (_local_1 < this.m_layerCount) {
                _local_2 = this.m_layerRenders[_local_1];
                if (((!((_local_2 == null))) && (!(_local_2.isIdel)))){
                    _local_2.stop();
                };
                _local_1++;
            };
            this.m_playing = false;
        }

        public function play():void
        {
            var _local_2:ILayerRender;
            var _local_1:int;
            while (_local_1 < this.m_layerCount) {
                _local_2 = this.m_layerRenders[_local_1];
                if (((!((_local_2 == null))) && (!(_local_2.isIdel)))){
                    _local_2.play();
                };
                _local_1++;
            };
            this.m_playing = true;
        }

        public function isPlaying():Boolean
        {
            return (this.m_playing);
        }

        public function render(_arg_1:int):void
        {
            var _local_3:ILayerRender;
            var _local_4:int;
            var _local_5:ScriptInfo;
            var _local_6:String;
            var _local_7:ScriptArg;
            var _local_2:int;
            while (_local_2 < this.m_layerCount) {
                _local_3 = this.m_layerRenders[_local_2];
                if (_local_3 != null){
                    _local_3.render(_arg_1);
                };
                _local_2++;
            };
            if ("" != this.m_event){
                this.fireEvent(this.m_event);
                this.m_event = "";
            };
            if (this.m_scripts != null){
                _local_4 = this.m_scripts.length;
                _local_2 = 0;
                while (_local_2 < _local_4) {
                    _local_5 = this.m_scripts[_local_2];
                    _local_6 = _local_5.cmd;
                    _local_7 = _local_5.arg;
                    this.broadcastScript(_local_6, _local_7);
                    _local_2++;
                };
                this.m_scripts = null;
            };
        }

        public function getMainLayer():ILayerRender
        {
            return (this.m_mainLayer);
        }

        public function addFrameListener(_arg_1:String, _arg_2:IFrameListener):void
        {
            if (this.m_frameListenersMap == null){
                this.m_frameListenersMap = new Dictionary();
            };
            var _local_3:Vector.<IFrameListener> = this.m_frameListenersMap[_arg_1];
            if (_local_3 == null){
                _local_3 = new Vector.<IFrameListener>();
                this.m_frameListenersMap[_arg_1] = _local_3;
                this.m_mainLayer.addFrameListener(_arg_1, this);
            };
            if (_local_3.indexOf(_arg_2) == -1){
                _local_3.push(_arg_2);
            };
        }

        public function removeFrameListener(_arg_1:String, _arg_2:IFrameListener):void
        {
            if (this.m_frameListenersMap == null){
                return;
            };
            var _local_3:Vector.<IFrameListener> = this.m_frameListenersMap[_arg_1];
            if (_local_3 == null){
                return;
            };
            var _local_4:int = _local_3.indexOf(_arg_2);
            if (_local_4 != -1){
                _local_3.splice(_local_4, 1);
            };
            if (_local_3.length == 0){
                this.m_mainLayer.removeFrameListener(_arg_1, this);
                this.m_frameListenersMap[_arg_1] = null;
            };
        }

        public function addScriptListener(_arg_1:IScriptListener):void
        {
            if (this.m_scriptListenersList == null){
                this.m_scriptListenersList = new Vector.<IScriptListener>();
            };
            if (this.m_scriptListenersList.indexOf(_arg_1) == -1){
                this.m_scriptListenersList.push(_arg_1);
            };
        }

        public function removeScriptListener(_arg_1:IScriptListener):void
        {
            if (this.m_scriptListenersList == null){
                return;
            };
            var _local_2:int = this.m_scriptListenersList.indexOf(_arg_1);
            if (_local_2 != -1){
                this.m_scriptListenersList.splice(_local_2, 1);
            };
        }

        public function getStateInfo():BPStateInfo
        {
            return (this.m_mainLayer.getStateInfo());
        }

        public function setStateInfo(_arg_1:BPStateInfo):void
        {
            var _local_3:ILayerRender;
            var _local_2:int;
            while (_local_2 < this.m_layerCount) {
                _local_3 = this.m_layerRenders[_local_2];
                if (((!((_local_3 == null))) && (!(_local_3.isIdel)))){
                    _local_3.setStateInfo(_arg_1);
                };
                _local_2++;
            };
            this.m_playing = _arg_1.isPlaying;
        }

        public function reset():void
        {
            var _local_2:ILayerRender;
            this.m_display.scaleX = 1;
            this.m_display.rotation = 0;
            this.setFilters(null);
            this.setColorTransform(TingeInfo.NULL);
            var _local_1:int;
            while (_local_1 < this.m_layerCount) {
                _local_2 = this.m_layerRenders[_local_1];
                if (_local_2 != null){
                    _local_2.clear();
                };
                _local_1++;
            };
            this.m_currentMotionID = -1;
            this.m_layerAssetsMap = new Dictionary();
            this.m_playing = false;
        }

        public function onFrameEvent(_arg_1:String):void
        {
            this.m_event = _arg_1;
        }

        public function onScripts(_arg_1:Array):void
        {
            this.m_scripts = _arg_1;
        }

        public function fireEvent(_arg_1:String):void
        {
            if (this.m_frameListenersMap == null){
                return;
            };
            var _local_2:Vector.<IFrameListener> = this.m_frameListenersMap[_arg_1];
            if (_local_2 == null){
                return;
            };
            var _local_3:int = (_local_2.length - 1);
            while (_local_3 >= 0) {
                _local_2[_local_3].onFrameEvent(_arg_1);
                _local_3--;
            };
        }

        public function getDisplay():IDisplay
        {
            return (this.m_display);
        }

        public function setFilters(_arg_1:Array):void
        {
            if (this.m_mainLayer){
                this.m_mainLayer.filters = _arg_1;
            };
        }

        public function setColorTransform(_arg_1:ColorTransform):void
        {
            if (this.m_mainLayer){
                this.m_mainLayer.transform.colorTransform = _arg_1;
            };
        }

        public /*  ©init. */ function _SafeStr_1105()
        {
        }


    }
}//package com.tencent.ai.core.render

// _SafeStr_1105 = " BodyViewMultiLayer" (String#15344)



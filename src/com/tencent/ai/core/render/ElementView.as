// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.render.ElementView

package com.tencent.ai.core.render
{
    import com.tencent.ai.core.display.IDisplay;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.element.IElementContainer;
    import com.tencent.ai.core.enum.Direction;
    import com.tencent.ai.core.enum.MotionDef;
    import com.tencent.ai.core.script.IScriptListener;
    import com.tencent.ai.core.utils.RectArea;
    import flash.geom.ColorTransform;
    import  ©init._SafeStr_1109;
    import __AS3__.vec.*;

    public class ElementView implements IElementView 
    {

        protected var m_bodyView:IMotionView;
        protected var m_bodyDisplay:IDisplay;
        protected var m_motionID:int;
        protected var m_dir:int;
        protected var m_borderStyles:Vector.<BorderStyle>;
        protected var m_blurStyles:Vector.<BlurStyle>;
        protected var m_adjustColorStyles:Vector.<AdjustColorStyle>;
        protected var m_bodyFilters:Array;
        protected var m_bodyColors:Vector.<ColorStyle>;
        protected var m_efListeners:Vector.<IFrameListener>;
        protected var m_parentContainer:IElementContainer;

        public function ElementView(_arg_1:IMotionView)
        {
            this.m_bodyView = _arg_1;
            this.initThis();
        }

        protected function initThis():void
        {
            this.m_bodyDisplay = this.m_bodyView.getDisplay();
            this.m_efListeners = new Vector.<IFrameListener>();
            this.m_motionID = -1;
            this.m_dir = Direction.RIGHT;
            this.m_bodyFilters = [];
            this.m_borderStyles = new Vector.<BorderStyle>();
            this.m_bodyColors = new Vector.<ColorStyle>();
            this.m_blurStyles = new Vector.<BlurStyle>();
            this.m_adjustColorStyles = new Vector.<AdjustColorStyle>();
            this.m_bodyColors.push(ColorStyle.DEFAULT);
        }

        protected function removeBodyFilters(_arg_1:Object):void
        {
            var _local_2:int = this.m_bodyFilters.indexOf(_arg_1);
            if (_local_2 != -1){
                this.m_bodyFilters.splice(_local_2, 1);
            };
        }

        public function setParentContainer(_arg_1:IElementContainer):void
        {
            this.m_parentContainer = _arg_1;
        }

        public function getParentContainer():IElementContainer
        {
            return (this.m_parentContainer);
        }

        public function gotoAndPlay(_arg_1:Object=null, _arg_2:int=-1):void
        {
            this.m_bodyView.gotoAndPlay(_arg_1, _arg_2);
        }

        public function gotoAndStop(_arg_1:Object=null, _arg_2:int=-1):void
        {
            this.m_bodyView.gotoAndStop(_arg_1, _arg_2);
        }

        public function setPlayParam(_arg_1:Number, _arg_2:Number):void
        {
            this.m_bodyView.setPlayParam(_arg_1, _arg_2);
        }

        public function stop():void
        {
            this.m_bodyView.stop();
        }

        public function play():void
        {
            this.m_bodyView.play();
        }

        public function isPlaying():Boolean
        {
            return (this.m_bodyView.isPlaying());
        }

        public function get currentFrameIndex():int
        {
            return (this.m_bodyView.currentFrameIndex);
        }

        public function get totalFrame():int
        {
            return (this.m_bodyView.totalFrame);
        }

        public function addFrameListener(_arg_1:String, _arg_2:IFrameListener):void
        {
            if (_arg_1 == MotionDef.L_ENTER_FRAME){
                if (((!((_arg_2 == null))) && ((this.m_efListeners.indexOf(_arg_2) == -1)))){
                    this.m_efListeners.push(_arg_2);
                };
            } else {
                this.m_bodyView.addFrameListener(_arg_1, _arg_2);
            };
        }

        public function removeFrameListener(_arg_1:String, _arg_2:IFrameListener):void
        {
            var _local_3:int;
            if (_arg_1 == MotionDef.L_ENTER_FRAME){
                _local_3 = this.m_efListeners.indexOf(_arg_2);
                if (_local_3 != -1){
                    this.m_efListeners.splice(_local_3, 1);
                };
            } else {
                this.m_bodyView.removeFrameListener(_arg_1, _arg_2);
            };
        }

        public function addScriptListener(_arg_1:IScriptListener):void
        {
            this.m_bodyView.addScriptListener(_arg_1);
        }

        public function removeScriptListener(_arg_1:IScriptListener):void
        {
            this.m_bodyView.removeScriptListener(_arg_1);
        }

        public function getStateInfo():BPStateInfo
        {
            return (this.m_bodyView.getStateInfo());
        }

        public function setStateInfo(_arg_1:BPStateInfo):void
        {
            this.m_bodyView.setStateInfo(_arg_1);
        }

        public function setMotionID(_arg_1:int):void
        {
            this.m_motionID = _arg_1;
            this.m_bodyView.setMotionID(this.m_motionID);
            this.gotoAndPlay(0);
        }

        public function getMotionID():int
        {
            return (this.m_motionID);
        }

        public function getHurtRects():Array
        {
            return (null);
        }

        public function getAttackRect():RectArea
        {
            return (null);
        }

        public function setFilters(_arg_1:Array):void
        {
        }

        public function setColorTransform(_arg_1:ColorTransform):void
        {
        }

        public function setDirection(_arg_1:int):void
        {
            this.m_dir = _arg_1;
            if (this.m_bodyView != null){
                this.m_bodyView.setDirection(_arg_1);
            };
        }

        public function getDirection():int
        {
            return (this.m_dir);
        }

        public function setRotation(_arg_1:int):void
        {
            this.m_bodyView.setRotation(_arg_1);
        }

        public function getRotation():int
        {
            return (this.m_bodyView.getRotation());
        }

        public function getBodyDisplay():IDisplay
        {
            return (this.m_bodyDisplay);
        }

        public function getDisplay():IDisplay
        {
            return (this.m_bodyDisplay);
        }

        public function setBodyBorderStyle(_arg_1:BorderStyle, _arg_2:Boolean=true):void
        {
            var _local_3:int;
            var _local_4:int;
            if (_arg_1 != null){
                this.m_bodyView.setFilters(null);
                _local_3 = (this.m_borderStyles.length - 1);
                _local_4 = -1;
                if (_arg_2){
                    if (this.m_borderStyles.indexOf(_arg_1) == -1){
                        if (_local_3 != -1){
                            this.removeBodyFilters(this.m_borderStyles[_local_3].filter);
                        };
                        this.m_borderStyles.push(_arg_1);
                        this.m_bodyFilters.push(_arg_1.filter);
                    };
                } else {
                    _local_4 = this.m_borderStyles.indexOf(_arg_1);
                    if (_local_4 != -1){
                        this.m_borderStyles.splice(_local_4, 1);
                        if (_local_4 == _local_3){
                            this.removeBodyFilters(_arg_1.filter);
                        };
                        _local_3 = (this.m_borderStyles.length - 1);
                        if (_local_3 != -1){
                            this.m_bodyFilters.push(this.m_borderStyles[_local_3].filter);
                        };
                    };
                };
                this.m_bodyView.setFilters(this.m_bodyFilters);
            };
        }

        public function setBodyBlurStyle(_arg_1:BlurStyle, _arg_2:Boolean=true):void
        {
            var _local_3:int;
            var _local_4:int;
            if (_arg_1 != null){
                this.m_bodyView.setFilters(null);
                _local_3 = (this.m_blurStyles.length - 1);
                _local_4 = -1;
                if (_arg_2){
                    if (this.m_blurStyles.indexOf(_arg_1) == -1){
                        if (_local_3 != -1){
                            this.removeBodyFilters(this.m_blurStyles[_local_3].filter);
                        };
                        this.m_blurStyles.push(_arg_1);
                        this.m_bodyFilters.push(_arg_1.filter);
                    };
                } else {
                    _local_4 = this.m_blurStyles.indexOf(_arg_1);
                    if (_local_4 != -1){
                        this.m_blurStyles.splice(_local_4, 1);
                        if (_local_4 == _local_3){
                            this.removeBodyFilters(_arg_1.filter);
                        };
                        _local_3 = (this.m_blurStyles.length - 1);
                        if (_local_3 != -1){
                            this.m_bodyFilters.push(this.m_blurStyles[_local_3].filter);
                        };
                    };
                };
                this.m_bodyView.setFilters(this.m_bodyFilters);
            };
        }

        public function setBodyAdjustColorStyle(_arg_1:AdjustColorStyle, _arg_2:Boolean=true):void
        {
            var _local_3:int;
            var _local_4:int;
            if (_arg_1 != null){
                this.m_bodyView.setFilters(null);
                _local_3 = (this.m_adjustColorStyles.length - 1);
                _local_4 = -1;
                if (_arg_2){
                    if (this.m_adjustColorStyles.indexOf(_arg_1) == -1){
                        if (_local_3 != -1){
                            this.removeBodyFilters(this.m_adjustColorStyles[_local_3].filter);
                        };
                        this.m_adjustColorStyles.push(_arg_1);
                        this.m_bodyFilters.push(_arg_1.filter);
                    };
                } else {
                    _local_4 = this.m_adjustColorStyles.indexOf(_arg_1);
                    if (_local_4 != -1){
                        this.m_adjustColorStyles.splice(_local_4, 1);
                        if (_local_4 == _local_3){
                            this.removeBodyFilters(_arg_1.filter);
                        };
                        _local_3 = (this.m_adjustColorStyles.length - 1);
                        if (_local_3 != -1){
                            this.m_bodyFilters.push(this.m_adjustColorStyles[_local_3].filter);
                        };
                    };
                };
                this.m_bodyView.setFilters(this.m_bodyFilters);
            };
        }

        public function setBodyColorStyle(_arg_1:ColorStyle, _arg_2:Boolean=true):void
        {
            var _local_3:int;
            var _local_4:int;
            if (_arg_1 != null){
                if (_arg_2){
                    if (this.m_bodyColors.indexOf(_arg_1) == -1){
                        this.m_bodyColors.push(_arg_1);
                        this.m_bodyView.setColorTransform(_arg_1.colorTF);
                    };
                } else {
                    _local_3 = (this.m_bodyColors.length - 1);
                    _local_4 = this.m_bodyColors.indexOf(_arg_1);
                    if (_local_4 != -1){
                        this.m_bodyColors.splice(_local_4, 1);
                        if (_local_4 == _local_3){
                            _local_3 = (this.m_bodyColors.length - 1);
                            if (_local_3 != -1){
                                this.m_bodyView.setColorTransform(this.m_bodyColors[_local_3].colorTF);
                            };
                        };
                    };
                };
            };
        }

        public function render(_arg_1:int):void
        {
            this.m_bodyView.render(_arg_1);
            var _local_2:int = (this.m_efListeners.length - 1);
            while (_local_2 >= 0) {
                this.m_efListeners[_local_2].onFrameEvent(MotionDef.L_ENTER_FRAME);
                _local_2--;
            };
        }

        public function renderChildren(_arg_1:int):void
        {
        }

        public function reset():void
        {
            this.m_borderStyles.length = 0;
            this.m_blurStyles.length = 0;
            this.m_blurStyles.length = 0;
            this.m_bodyFilters.length = 0;
            this.m_bodyView.reset();
            this.m_borderStyles.length = 0;
            this.setBodyColorStyle(ColorStyle.DEFAULT);
            this.m_motionID = -1;
            this.m_dir = Direction.RIGHT;
            this.m_efListeners.length = 0;
        }

        public /*  ©init. */ function _SafeStr_1109()
        {
        }


    }
}//package com.tencent.ai.core.render

// _SafeStr_1109 = " ElementView" (String#14054)



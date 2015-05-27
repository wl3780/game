// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.debug.HitAreaHelp

package com.tencent.ai.core.debug
{
    import com.tencent.ai.core.scene.IScene;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.render.IElementView;
    import flash.display.Graphics;
    import flash.geom.Rectangle;
    import flash.display.DisplayObject;
    import flash.display.DisplayObjectContainer;
    import com.tencent.ai.core.utils.RectArea;
    import com.tencent.ai.core.display.ISprite;
    import  ©init._SafeStr_363;
    import __AS3__.vec.*;

    public class HitAreaHelp 
    {

        private static var _INSTANCE:HitAreaHelp;

        protected var m_scene:IScene;
        protected var m_Canvas:Stage2dCanvas;
        protected var m_register_views:Vector.<IElementView>;
        protected var m_currentInterval:int;
        public var showArea:Boolean;
        public var intervalTime:int = 1;

        public function HitAreaHelp()
        {
            this.m_register_views = new Vector.<IElementView>();
            this.showArea = false;
            this.intervalTime = 1;
            this.m_currentInterval = this.intervalTime;
            this.m_Canvas = new Stage2dCanvas();
        }

        public static function getInstance():HitAreaHelp
        {
            if (_INSTANCE == null){
                _INSTANCE = new (HitAreaHelp)();
            };
            return (_INSTANCE);
        }

        public static function REGISTER_SCENE(_arg_1:IScene):void
        {
            getInstance().registerScene(_arg_1);
        }

        public static function REGISTER_VIEW(_arg_1:IElementView):void
        {
            getInstance().registerView(_arg_1);
        }


        protected function drawACArea(_arg_1:IElementView):void
        {
            var _local_5:Graphics;
            var _local_6:Rectangle;
            var _local_7:int;
            var _local_8:int;
            var _local_2:DisplayObject = DisplayObject(_arg_1.getDisplay());
            var _local_3:DisplayObjectContainer = _local_2.parent;
            var _local_4:RectArea = _arg_1.getAttackRect();
            if (((!((_local_4 == null))) && (!((_local_4.width == 0))))){
                _local_5 = this.m_Canvas.graphics;
                _local_6 = _local_3.scrollRect;
                _local_7 = (_local_4.x + _local_2.x);
                _local_8 = (_local_4.y + _local_2.y);
                if (_local_6 != null){
                    _local_7 = (_local_7 - _local_6.x);
                    _local_8 = (_local_8 - _local_6.y);
                };
                _local_5.beginFill(0xFF00, 0.3);
                _local_5.drawRect(_local_7, _local_8, _local_4.width, _local_4.height);
                _local_5.endFill();
            };
        }

        protected function drawHCArea(_arg_1:IElementView):void
        {
            var _local_6:RectArea;
            var _local_7:Graphics;
            var _local_8:Rectangle;
            var _local_9:int;
            var _local_10:int;
            var _local_2:DisplayObject = DisplayObject(_arg_1.getDisplay());
            var _local_3:DisplayObjectContainer = _local_2.parent;
            var _local_4:Array = _arg_1.getHurtRects();
            if ((((_local_4 == null)) || ((_local_4.length == 0)))){
                return;
            };
            var _local_5:int;
            while (_local_5 < _local_4.length) {
                _local_6 = _local_4[_local_5];
                if (((!((_local_6 == null))) && (!((_local_6.width == 0))))){
                    _local_7 = this.m_Canvas.graphics;
                    _local_8 = _local_3.scrollRect;
                    _local_9 = (_local_6.x + _local_2.x);
                    _local_10 = (_local_6.y + _local_2.y);
                    if (_local_8 != null){
                        _local_9 = (_local_9 - _local_8.x);
                        _local_10 = (_local_10 - _local_8.y);
                    };
                    _local_7.beginFill(0xFF0000, 0.3);
                    _local_7.drawRect(_local_9, _local_10, _local_6.width, _local_6.height);
                    _local_7.endFill();
                };
                _local_5++;
            };
        }

        public function registerView(_arg_1:IElementView):void
        {
            this.m_register_views.push(_arg_1);
        }

        public function registerScene(_arg_1:IScene):void
        {
            var _local_2:ISprite = (((this.m_scene == null)) ? null : ISprite(this.m_scene.getDisplay()));
            if (_local_2 != null){
                _local_2.removeDisplay(this.m_Canvas);
            };
            this.m_scene = _arg_1;
            if (_arg_1 != null){
                _local_2 = ISprite(this.m_scene.getDisplay());
                if (_local_2 != null){
                    _local_2.addDisplay(this.m_Canvas);
                };
            };
        }

        public function updateArea():void
        {
            var _local_1:int;
            var _local_2:IElementView;
            if (((((this.showArea) && (!((this.m_scene == null))))) && (!((this.m_Canvas == null))))){
                this.m_Canvas.graphics.clear();
                this.m_currentInterval = (this.m_currentInterval - 1);
                if (this.m_currentInterval <= 0){
                    this.m_currentInterval = this.intervalTime;
                    _local_1 = (this.m_register_views.length - 1);
                    while (_local_1 >= 0) {
                        _local_2 = this.m_register_views[_local_1];
                        if (_local_2.getParentContainer()){
                            this.drawACArea(_local_2);
                            this.drawHCArea(_local_2);
                        };
                        _local_1--;
                    };
                };
            };
        }

        public function clear():void
        {
            this.m_Canvas.graphics.clear();
        }

        public /*  ©init. */ function _SafeStr_363()
        {
        }


    }
}//package com.tencent.ai.core.debug

// _SafeStr_363 = " HitAreaHelp" (String#17012)



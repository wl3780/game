// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.render.ElementViewHead

package com.tencent.ai.core.render
{
    import flash.filters.GlowFilter;
    import flash.text.TextFormat;
    import com.tencent.ai.core.display.ITextField;
    import com.tencent.ai.core.display.ISprite;
    import com.tencent.ai.core.display.DisplaySystem;
    import com.tencent.ai.core.display.IDisplay;
    import flash.geom.Rectangle;
    import  ©init._SafeStr_1111;

    public class ElementViewHead extends ElementView 
    {

        public static var NULL_FILERS:Array = [];
        public static var NAME_GLOW_FILERS:Array = [new GlowFilter(0, 1, 3, 3, 10)];
        public static var NAME_TXT_FORMAT:TextFormat = new TextFormat("宋体", 12, 0xFFFFFF, null, null, null, null, null, "center", null, null, null, 4);

        protected var m_nameTxt:ITextField;
        protected var m_viewDisplay:ISprite;
        protected var m_txtFormat:TextFormat;

        public function ElementViewHead(_arg_1:IMotionView)
        {
            super(_arg_1);
        }

        override protected function initThis():void
        {
            super.initThis();
            this.m_nameTxt = DisplaySystem.createTextFiled();
            this.m_nameTxt.autoSize = "center";
            this.m_nameTxt.selectable = false;
            this.m_nameTxt.textColor = 0xFFFFFF;
            this.m_nameTxt.defaultTextFormat = NAME_TXT_FORMAT;
            this.m_nameTxt.filters = NAME_GLOW_FILERS;
            this.m_viewDisplay = DisplaySystem.createSprite();
            this.m_viewDisplay.addDisplay(m_bodyDisplay);
        }

        override public function getDisplay():IDisplay
        {
            return (this.m_viewDisplay);
        }

        public function setHeadVisible(_arg_1:Boolean):void
        {
            if (this.m_nameTxt != null){
                this.m_nameTxt.visible = _arg_1;
            };
        }

        public function getHeadVisible():Boolean
        {
            return ((((this.m_nameTxt == null)) ? (false) : this.m_nameTxt.visible));
        }

        public function setHeadTextStyle(_arg_1:TextFormat, _arg_2:Array=null, _arg_3:Boolean=false):void
        {
            if (_arg_3 != this.m_nameTxt.embedFonts){
                this.m_nameTxt.embedFonts = _arg_3;
            };
            if (this.m_txtFormat != _arg_1){
                this.m_txtFormat = _arg_1;
                this.m_nameTxt.defaultTextFormat = (((this.m_txtFormat)!=null) ? this.m_txtFormat : NAME_TXT_FORMAT);
            };
            if (_arg_2 == NULL_FILERS){
                this.m_nameTxt.filters = NAME_GLOW_FILERS;
            } else {
                this.m_nameTxt.filters = _arg_2;
            };
        }

        public function setHeadPureText(_arg_1:String, _arg_2:Boolean=true):void
        {
            if (_arg_1 != null){
                this.m_nameTxt.text = _arg_1;
                if (!this.m_viewDisplay.containsDisplay(this.m_nameTxt)){
                    this.m_viewDisplay.addDisplay(this.m_nameTxt);
                };
            } else {
                if (_arg_1 == ""){
                    if (this.m_viewDisplay.containsDisplay(this.m_nameTxt)){
                        this.m_viewDisplay.removeDisplay(this.m_nameTxt);
                    };
                };
            };
            if (_arg_2){
                this.update();
            };
        }

        public function setHeadText(_arg_1:String, _arg_2:Boolean=true):void
        {
            if (_arg_1 != null){
                this.m_nameTxt.htmlText = _arg_1;
                if (!this.m_viewDisplay.containsDisplay(this.m_nameTxt)){
                    this.m_viewDisplay.addDisplay(this.m_nameTxt);
                };
            } else {
                if (_arg_1 == ""){
                    if (this.m_viewDisplay.containsDisplay(this.m_nameTxt)){
                        this.m_viewDisplay.removeDisplay(this.m_nameTxt);
                    };
                };
            };
            if (_arg_2){
                this.update();
            };
        }

        public function getHeadPureText():String
        {
            return (this.m_nameTxt.text);
        }

        override public function reset():void
        {
            if (this.m_txtFormat != null){
                this.setHeadTextStyle(null, NULL_FILERS);
            };
            super.reset();
        }

        protected function update():void
        {
            var _local_1:int;
            var _local_2:Rectangle;
            if (this.getHeadVisible()){
                _local_1 = 0;
                if (m_bodyDisplay){
                    _local_2 = m_bodyDisplay.getDisplayBounds(this.m_viewDisplay);
                    _local_1 = (_local_2.y - 10);
                };
                this.m_nameTxt.x = (this.m_nameTxt.width * -0.5);
                this.m_nameTxt.y = (_local_1 - this.m_nameTxt.height);
            };
        }

        public /*  ©init. */ function _SafeStr_1111()
        {
        }


    }
}//package com.tencent.ai.core.render

// _SafeStr_1111 = " ElementViewHead" (String#14057)



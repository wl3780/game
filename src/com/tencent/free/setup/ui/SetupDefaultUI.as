// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.setup.ui.SetupDefaultUI

package com.tencent.free.setup.ui
{
    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import  ©init._SafeStr_60;

    public class SetupDefaultUI extends Sprite 
    {

        protected var m_root:Sprite;
        protected var m_tf:TextField;
        protected var m_label:String;
        protected var m_progress:int;
        protected var m_stageWidth:int;
        protected var m_stageHeight:int;
        protected var m_ignoreP:Boolean;

        public function SetupDefaultUI(_arg_1:Sprite, _arg_2:int, _arg_3:int)
        {
            this.setRootDisplay(_arg_1);
            this.m_stageWidth = _arg_2;
            this.m_stageHeight = _arg_3;
            this.initThis();
        }

        protected function initThis():void
        {
            if (this.m_root == null){
                return;
            };
            this.m_tf = new TextField();
            this.m_tf.autoSize = TextFieldAutoSize.CENTER;
            this.m_tf.textColor = 0x888888;
            addChild(this.m_tf);
            x = (this.m_stageWidth * 0.5);
            y = (this.m_stageHeight * 0.5);
            this.m_label = "...";
            this.m_progress = 0;
            this.m_ignoreP = false;
        }

        protected function updateLabel(_arg_1:uint=0):void
        {
            if (this.m_tf == null){
                return;
            };
            if (((!((_arg_1 == 0))) && (!((this.m_tf.textColor == _arg_1))))){
                this.m_tf.textColor = _arg_1;
            };
            this.m_tf.text = (this.m_label + ((this.m_ignoreP) ? "" : (("[" + this.m_progress) + "%]")));
            this.m_tf.x = (this.m_tf.width * -0.5);
            graphics.clear();
            graphics.lineStyle(1, 0xAAAAAA, 1);
            graphics.beginFill(0xEEEEEE, 1);
            graphics.drawRect((this.m_tf.x - 5), (this.m_tf.y - 5), (this.m_tf.width + 5), (this.m_tf.height + 7));
            graphics.endFill();
        }

        public function show():void
        {
            if (((!((this.m_root == null))) && (!(this.m_root.contains(this))))){
                this.m_root.addChild(this);
            };
        }

        public function hide():void
        {
            if (((!((this.m_root == null))) && (this.m_root.contains(this)))){
                this.m_root.removeChild(this);
            };
        }

        public function setRootDisplay(_arg_1:Sprite):void
        {
            this.m_root = _arg_1;
        }

        public function setMessage(_arg_1:String):void
        {
            this.m_label = _arg_1;
            this.updateLabel();
        }

        public function setError(_arg_1:String):void
        {
            this.m_label = _arg_1;
            this.updateLabel(0xFF0000);
        }

        public function setProgress(_arg_1:Number):void
        {
            this.m_progress = int((_arg_1 * 100));
            this.updateLabel();
        }

        public function set ignoreP(_arg_1:Boolean):void
        {
            this.m_ignoreP = _arg_1;
        }

        public function get ignoreP():Boolean
        {
            return (this.m_ignoreP);
        }

        public /*  ©init. */ function _SafeStr_60()
        {
        }


    }
}//package com.tencent.free.setup.ui

// _SafeStr_60 = " SetupDefaultUI" (String#1553)



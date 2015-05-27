// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.DupLoadingInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import com.tencent.ai.core.data.DupLoadingInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_601;

    public class DupLoadingInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var dupLoadingTips:Array;
        public var lostFocusTips:Array;
        private var dlinfo:DupLoadingInfo;

        public function DupLoadingInfoConfig()
        {
            super(20131120);
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            this.dlinfo = new DupLoadingInfo();
            this.dlinfo.decode(_local_2);
            this.dupLoadingTips = this.dlinfo.dupLoadingTips;
            this.lostFocusTips = this.dlinfo.lostFocusTips;
            return (false);
        }

        public function find(_arg_1:*):Object
        {
            return (null);
        }

        public function findAll():Object
        {
            return (this.dupLoadingTips);
        }

        override public function clearConfig():void
        {
            this.dupLoadingTips = null;
            this.lostFocusTips = null;
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            super.readConfig(_arg_1);
            if (!this.dlinfo){
                this.dlinfo = new DupLoadingInfo();
            };
            this.dlinfo.read(_arg_1);
            this.dupLoadingTips = this.dlinfo.dupLoadingTips;
            this.lostFocusTips = this.dlinfo.lostFocusTips;
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            super.writeConfig(_arg_1);
            this.dlinfo.write(_arg_1);
        }

        public /*  ©init. */ function _SafeStr_601()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_601 = " DupLoadingInfoConfig" (String#14072)



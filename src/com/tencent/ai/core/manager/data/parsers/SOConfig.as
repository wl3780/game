// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.SOConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import com.tencent.free.setup.GLOBAL_DEF;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_641;

    public class SOConfig extends BaseBinaryConfig implements IConfig 
    {

        private var _content:String;
        public var _all:Dictionary;

        public function SOConfig()
        {
            super(20131120);
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_4:String;
            this._content = (_arg_1 as String);
            this._content = this._content.replace(/\r\n/g, "\n");
            this._all = new Dictionary();
            var _local_2:Array = GLOBAL_DEF.REPLACE(this._content).split("\n");
            var _local_3:int;
            while (_local_3 < _local_2.length) {
                _local_4 = _local_2[_local_3];
                if (_local_4 != ""){
                    this._all[_local_4] = true;
                };
                _local_3++;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            if (this._all[_arg_1] == true){
                return (true);
            };
            return (false);
        }

        public function findAll():Object
        {
            return (this._all);
        }

        override public function clearConfig():void
        {
            this._content = "";
            this._all = null;
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            super.readConfig(_arg_1);
            var _local_2:String = XString.ReadString(_arg_1);
            this.parse(_local_2);
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            super.writeConfig(_arg_1);
            XString.WriteString(_arg_1, this._content);
        }

        public /*  ©init. */ function _SafeStr_641()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_641 = " SOConfig" (String#16535)



// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protect.PAttribData

package com.tencent.ai.core.protect
{
    import  ©init._SafeStr_857;

    public class PAttribData 
    {

        public var attribID:int = 0;
        public var attribName:String;
        public var attribType:String;
        public var attribResetValue:Object;
        public var attribRepair:Function;
        public var attribBind:Boolean = true;

        public function PAttribData(_arg_1:String, _arg_2:String, _arg_3:Object=null, _arg_4:int=0, _arg_5:Function=null, _arg_6:Boolean=true)
        {
            this.attribName = _arg_1;
            this.attribType = _arg_2;
            this.attribRepair = _arg_5;
            this.attribResetValue = _arg_3;
            this.attribID = _arg_4;
            this.attribBind = _arg_6;
        }

        public /*  ©init. */ function _SafeStr_857()
        {
        }


    }
}//package com.tencent.ai.core.protect

// _SafeStr_857 = " PAttribData" (String#15815)



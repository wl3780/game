// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.SpecialFuncInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.manager.data.DEFINE;
    import  ©init._SafeStr_336;

    public class SpecialFuncInfo implements IXMLSerialize 
    {

        public var id:int;
        public var funcID:int;
        public var execArg:String;
        public var probability:Number;
        public var statusEventInfo:StatusEventInfo;


        public function decode(_arg_1:XML):void
        {
            this.id = int(_arg_1.@id);
            this.funcID = int(_arg_1.@funcID);
            this.execArg = String(_arg_1.@execArg);
            this.probability = DEFINE.CAST_FLOAT(int(_arg_1.@p));
            var _local_2:XML = _arg_1.StatusEventInfo[0];
            if (_local_2 != null){
                this.statusEventInfo = new StatusEventInfo();
                this.statusEventInfo.decode(_local_2);
            };
        }

        public function encode()
        {
            return (null);
        }

        public /*  ©init. */ function _SafeStr_336()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_336 = " SpecialFuncInfo" (String#15662)



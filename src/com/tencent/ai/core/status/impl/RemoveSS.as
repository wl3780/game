// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.status.impl.RemoveSS

package com.tencent.ai.core.status.impl
{
    import com.tencent.ai.core.events.EventDispatcher2;
    import com.tencent.ai.core.status.ISpecialStatus;
    import com.tencent.ai.core.status.SSModel;
    import com.tencent.ai.core.data.SSTypeInfo;
    import  ©init._SafeStr_1275;

    public class RemoveSS extends EventDispatcher2 implements ISpecialStatus 
    {

        public static var INSTANCE:RemoveSS = new (RemoveSS)();

        public var removeSSType:int = -1;


        public function setTarget(_arg_1:Object):void
        {
        }

        public function getTarget():Object
        {
            return (null);
        }

        public function setModel(_arg_1:SSModel):void
        {
        }

        public function getModel():SSModel
        {
            return (null);
        }

        public function getTypeInfo():SSTypeInfo
        {
            return (null);
        }

        public function isBorn():Boolean
        {
            return (false);
        }

        public function dispose():void
        {
        }

        public function execute():void
        {
        }

        public function setRTParams(_arg_1:Object):void
        {
        }

        public function getRTParams():Object
        {
            return (null);
        }

        public function compare(_arg_1:ISpecialStatus):int
        {
            var _local_2:SSTypeInfo = _arg_1.getTypeInfo();
            if (_local_2.type == this.removeSSType){
                return (SSTypeInfo.COMPARE_CODE_YES);
            };
            return (SSTypeInfo.COMPARE_CODE_EXIST);
        }

        public /*  ©init. */ function _SafeStr_1275()
        {
        }


    }
}//package com.tencent.ai.core.status.impl

// _SafeStr_1275 = " RemoveSS" (String#15458)



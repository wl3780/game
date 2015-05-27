// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.mission.PhaseInfo

package com.tencent.ai.core.mission
{
    import flash.events.EventDispatcher;
    import com.tencent.ai.core.data.PhaseStaticInfo;
    import __AS3__.vec.Vector;
    import  ©init._SafeStr_685;

    public class PhaseInfo extends EventDispatcher 
    {

        public var id:uint;
        public var staticInfo:PhaseStaticInfo;
        public var conditions:Vector.<ICondition>;


        public function get isFinish():Boolean
        {
            return (false);
        }

        public function set isFinish(_arg_1:Boolean):void
        {
        }

        public /*  ©init. */ function _SafeStr_685()
        {
        }


    }
}//package com.tencent.ai.core.mission

// _SafeStr_685 = " PhaseInfo" (String#17117)



// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.mission.MissionInfo

package com.tencent.ai.core.mission
{
    import flash.events.EventDispatcher;
    import com.tencent.ai.core.data.MissionStaticInfo;
    import  ©init._SafeStr_683;

    public class MissionInfo extends EventDispatcher 
    {

        public var id:uint;
        public var staticInfo:MissionStaticInfo;
        public var isNew:Boolean = false;


        public function get state():int
        {
            return (-1);
        }

        public function set state(_arg_1:int):void
        {
        }

        public function get canTrigger():Boolean
        {
            return (false);
        }

        public function set canTrigger(_arg_1:Boolean):void
        {
        }

        public function get visible():Boolean
        {
            return (false);
        }

        public function set visible(_arg_1:Boolean):void
        {
        }

        public function get rank():int
        {
            return (-1);
        }

        public function set rank(_arg_1:int):void
        {
        }

        public function get phase():PhaseInfo
        {
            return (null);
        }

        public function get isLastPhase():Boolean
        {
            return (false);
        }

        public function set phase(_arg_1:PhaseInfo):void
        {
        }

        public /*  ©init. */ function _SafeStr_683()
        {
        }


    }
}//package com.tencent.ai.core.mission

// _SafeStr_683 = " MissionInfo" (String#13937)



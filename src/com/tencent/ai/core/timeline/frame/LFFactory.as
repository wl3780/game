// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.timeline.frame.LFFactory

package com.tencent.ai.core.timeline.frame
{
    import flash.utils.Dictionary;
    import com.tencent.ai.core.enum.LogicFrameType;
    import com.tencent.ai.core.timeline.ILogicFrame;
    import com.tencent.ai.core.timeline.LFParam;
    import  ©init._SafeStr_1300;

    public class LFFactory 
    {

        private static var _cls_maps:Dictionary;


        public static function getClassMap():Dictionary
        {
            if (_cls_maps == null){
                _cls_maps = new Dictionary();
                _cls_maps[LogicFrameType.LFT_DUP_SPAWN] = LF_DupSpawnFrame;
                _cls_maps[LogicFrameType.LFT_DUP_KILL_MONSTERS] = LF_DupKillMonstersFrame;
                _cls_maps[LogicFrameType.LFT_DUP_TIMER] = LF_DupTimerFrame;
                _cls_maps[LogicFrameType.LFT_ACTIVE_PLOT] = LF_ActivePlotFrame;
                _cls_maps[LogicFrameType.LFT_WAIT] = LF_WaitFrame;
            };
            return (_cls_maps);
        }

        protected static function newLF(_arg_1:int):ILogicFrame
        {
            var _local_2:Class = getClassMap()[_arg_1];
            return ((new (_local_2)() as ILogicFrame));
        }

        public static function registerLFClass(_arg_1:int, _arg_2:Class):void
        {
            getClassMap()[_arg_1] = _arg_2;
        }

        public static function createLF(_arg_1:LFParam):ILogicFrame
        {
            var _local_2:int = _arg_1.type;
            var _local_3:ILogicFrame = newLF(_local_2);
            _local_3.setParams(_arg_1);
            return (_local_3);
        }


        public /*  ©init. */ function _SafeStr_1300()
        {
        }


    }
}//package com.tencent.ai.core.timeline.frame

// _SafeStr_1300 = " LFFactory" (String#17522)



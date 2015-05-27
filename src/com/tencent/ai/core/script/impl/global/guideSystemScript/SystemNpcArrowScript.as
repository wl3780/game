// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.guideSystemScript.SystemNpcArrowScript

package com.tencent.ai.core.script.impl.global.guideSystemScript
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.npc.NpcModel;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.NpcDialogOptionInfo;
    import com.tencent.ai.core.data.arg.script.SystemNpcArrowArg;
    import com.tencent.ai.core.AICore;
    import flash.geom.Point;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1157;

    public class SystemNpcArrowScript implements IScript 
    {


        public function setTarget(_arg_1:Object):void
        {
        }

        public function getTarget():Object
        {
            return (null);
        }

        public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_4:NpcModel;
            var _local_5:Vector.<NpcDialogOptionInfo>;
            var _local_6:int;
            var _local_7:int;
            var _local_8:NpcDialogOptionInfo;
            var _local_9:int;
            var _local_10:int;
            var _local_11:int;
            var _local_12:int;
            var _local_13:int;
            var _local_3:SystemNpcArrowArg = (_arg_2 as SystemNpcArrowArg);
            if (_local_3.opreationType == "create"){
                _local_4 = AICore.npcSystem.getNpcModelManager().getNpcModelByID(_local_3.npcID);
                if (!_local_4){
                    throw (new Error((("找不到 NPC 。npcID=" + _local_3.npcID) + "。请检查配置表，看是不是opreation type一栏配错了。")));
                };
                _local_5 = _local_4.getDialogOptionInfos();
                _local_6 = _local_5.length;
                _local_7 = 0;
                while (_local_7 < _local_6) {
                    _local_8 = _local_5[_local_7];
                    if (_local_8.label == _local_3.optionLabel){
                        _local_11 = (_local_7 % 7);
                        _local_12 = (_local_11 / 4);
                        _local_13 = (_local_11 % 4);
                        if (_local_12 == 0){
                            _local_10 = 480;
                        } else {
                            _local_10 = 510;
                        };
                        switch (_local_13){
                            case 0:
                                _local_9 = 310;
                                break;
                            case 1:
                                _local_9 = 475;
                                break;
                            case 2:
                                _local_9 = 640;
                                break;
                            case 3:
                                _local_9 = 805;
                                break;
                        };
                        AICore.guideSystem.getAArrow(new Point(_local_9, _local_10), this.callBack, _local_3.direction, _local_3.showTime, "normal", _local_3.id);
                    };
                    _local_7++;
                };
            } else {
                AICore.guideSystem.deleteElementById(_local_3.id);
            };
        }

        private function callBack():void
        {
        }

        public function stop():void
        {
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_SYSTEM_ARROW);
        }

        public /*  ©init. */ function _SafeStr_1157()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global.guideSystemScript

// _SafeStr_1157 = " SystemNpcArrowScript" (String#17645)



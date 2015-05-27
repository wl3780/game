// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.npc.NpcModelManager

package com.tencent.ai.core.npc
{
    import flash.events.EventDispatcher;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.NpcStaticInfo;
    import com.tencent.ai.core.AICore;
    import com.tencent.free.logging.error;
    import  ©init._SafeStr_819;

    public class NpcModelManager extends EventDispatcher 
    {

        private var _npcModelHash:Dictionary;

        public function NpcModelManager()
        {
            this._npcModelHash = new Dictionary();
        }

        public function getNpcModelByID(_arg_1:int):NpcModel
        {
            var _local_3:NpcStaticInfo;
            var _local_2:NpcModel = this._npcModelHash[_arg_1];
            if (!_local_2){
                _local_3 = AICore.data.getNpcStaticInfo(_arg_1);
                if (_local_3){
                    _local_2 = new NpcModel(_local_3);
                    this._npcModelHash[_arg_1] = _local_2;
                } else {
                    error((("该 NPC 不存在，ID 为：" + _arg_1) + "。"));
                };
            };
            return (_local_2);
        }

        public /*  ©init. */ function _SafeStr_819()
        {
        }


    }
}//package com.tencent.ai.core.npc

// _SafeStr_819 = " NpcModelManager" (String#13772)



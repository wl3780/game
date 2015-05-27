// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.ActionEventHandler

package com.tencent.ai.core.monster.ai
{
    import com.tencent.ai.core.actor.model.ActorModel;
    import com.tencent.ai.core.actor.BaseActor;
    import  ©init._SafeStr_758;

    public class ActionEventHandler 
    {

        public var targetModel:ActorModel;


        public function setTarget(_arg_1:BaseActor):void
        {
            this.targetModel = _arg_1.getModel();
        }

        public function addEvent():void
        {
        }

        public function checkTheId():Boolean
        {
            var _local_1:int = this.targetModel.actionID;
            if ((((((_local_1 == 0)) || ((_local_1 == 1)))) || ((_local_1 == 2)))){
                return (true);
            };
            return (false);
        }

        public function checkIsHurted():Boolean
        {
            var _local_1:int = this.targetModel.actionID;
            if ((((_local_1 == 6)) || ((_local_1 == 7)))){
                return (true);
            };
            return (false);
        }

        public function checkIsJumping():Boolean
        {
            var _local_1:int = this.targetModel.actionID;
            if (_local_1 == 3){
                return (true);
            };
            return (false);
        }

        public function reset():void
        {
        }

        public /*  ©init. */ function _SafeStr_758()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai

// _SafeStr_758 = " ActionEventHandler" (String#15785)



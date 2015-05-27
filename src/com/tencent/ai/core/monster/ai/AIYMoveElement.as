// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.AIYMoveElement

package com.tencent.ai.core.monster.ai
{
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.element.InteractElement;
    import com.tencent.ai.core.enum.VKeyDef;
    import  ©init._SafeStr_769;

    public class AIYMoveElement 
    {

        public var target:BaseActor;
        public var monsterIQ:int;
        public var monsterTemper:int;
        public var aimY:int = 0;
        public var aimElement:InteractElement;
        protected var movekeys:Array;
        protected var currentYKey:Array;
        private var hasPressY:Boolean = false;

        public function AIYMoveElement()
        {
            this.movekeys = [[VKeyDef.GO_UP, VKeyDef.STOP_UP], [VKeyDef.GO_DOWN, VKeyDef.STOP_DOWN], [VKeyDef.GO_LEFT, VKeyDef.STOP_LEFT], [VKeyDef.GO_RIGHT, VKeyDef.STOP_RIGHT], [VKeyDef.GO_Y_DOWN, VKeyDef.STOP_Y_DOWN], [VKeyDef.GO_Y_UP, VKeyDef.STOP_Y_UP]];
            super();
        }

        protected function yClose(_arg_1:int, _arg_2:int):Boolean
        {
            var _local_3:int = (this.target.getModel().jumpV / 100);
            if (_arg_2 <= (_local_3 * _local_3)){
                if (this.currentYKey != null){
                    this.target.inputVKey(this.currentYKey[1]);
                };
                this.currentYKey = null;
                return (true);
            };
            if (_arg_2 <= 100){
                if (this.currentYKey != null){
                    this.target.inputVKey(this.currentYKey[1]);
                };
                this.currentYKey = null;
                return (true);
            };
            if (_arg_1 > 0){
                if (((!((this.currentYKey == null))) && (!((this.currentYKey == this.movekeys[5]))))){
                    this.target.inputVKey(this.currentYKey[1]);
                };
                this.currentYKey = this.movekeys[5];
                this.target.inputVKey(this.currentYKey[0]);
            } else {
                if (_arg_1 < 0){
                    if (((!((this.currentYKey == null))) && (!((this.currentYKey == this.movekeys[4]))))){
                        this.target.inputVKey(this.currentYKey[1]);
                    };
                    this.currentYKey = this.movekeys[4];
                    this.target.inputVKey(this.currentYKey[0]);
                };
            };
            return (false);
        }

        public function hasAim():Boolean
        {
            return (((!((this.aimElement == null))) && (!(this.aimElement.getIsDead()))));
        }

        public function setAimElement(_arg_1:InteractElement):void
        {
            this.aimElement = _arg_1;
        }

        public function setAttackParams(_arg_1:int):void
        {
            this.aimY = _arg_1;
        }

        public function onMoving():Boolean
        {
            var _local_1:int = (this.aimY - this.target.mapY);
            var _local_2:int = (_local_1 * _local_1);
            var _local_3:Boolean = this.yClose(_local_1, _local_2);
            if (_local_3){
                this.cancel();
                return (true);
            };
            return (false);
        }

        public function cancel():void
        {
            if (this.target != null){
                this.target.inputVKey(this.movekeys[0][1]);
                this.target.inputVKey(this.movekeys[1][1]);
                this.target.inputVKey(this.movekeys[2][1]);
                this.target.inputVKey(this.movekeys[3][1]);
                this.target.inputVKey(this.movekeys[4][1]);
                this.target.inputVKey(this.movekeys[5][1]);
            };
            this.currentYKey = null;
            this.hasPressY = false;
            this.hasPressY = false;
        }

        public function reset():void
        {
            if (this.target != null){
                this.target.inputVKey(this.movekeys[0][1]);
                this.target.inputVKey(this.movekeys[1][1]);
                this.target.inputVKey(this.movekeys[2][1]);
                this.target.inputVKey(this.movekeys[3][1]);
                this.target.inputVKey(this.movekeys[4][1]);
                this.target.inputVKey(this.movekeys[5][1]);
            };
            this.currentYKey = null;
            this.hasPressY = false;
            this.target = null;
            this.aimElement = null;
        }

        public /*  ©init. */ function _SafeStr_769()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai

// _SafeStr_769 = " AIYMoveElement" (String#17564)



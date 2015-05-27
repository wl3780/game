// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.AIZChaseElement

package com.tencent.ai.core.monster.ai
{
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.element.InteractElement;
    import com.tencent.ai.core.enum.VKeyDef;
    import com.tencent.ai.core.enum.Constants;
    import  ©init._SafeStr_770;

    public class AIZChaseElement 
    {

        public var target:BaseActor;
        public var chasetRR:int;
        public var monsterIQ:int;
        public var scene:IScene;
        public var aimElement:InteractElement;
        protected var movekeys:Array;
        protected var attackXDis:int;
        protected var attackZDis:int;
        protected var currentZKey:Array;
        protected var currentXKey:Array;
        private var hasPressZ:Boolean = false;
        private var hasPressX:Boolean = false;
        private var hasChased:Boolean = false;
        private var tempZKey:Array;
        private var tempXKey:Array;

        public function AIZChaseElement()
        {
            this.movekeys = [[VKeyDef.GO_UP, VKeyDef.STOP_UP], [VKeyDef.GO_DOWN, VKeyDef.STOP_DOWN], [VKeyDef.GO_LEFT, VKeyDef.STOP_LEFT], [VKeyDef.GO_RIGHT, VKeyDef.STOP_RIGHT]];
            super();
        }

        protected function zClose(_arg_1:int, _arg_2:int):Boolean
        {
            if (_arg_2 <= this.attackZDis){
                return (true);
            };
            return (false);
        }

        protected function xClose(_arg_1:int, _arg_2:int):Boolean
        {
            if (_arg_2 <= this.attackXDis){
                return (true);
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

        public function setAttackParams(_arg_1:int, _arg_2:int):void
        {
            this.attackXDis = _arg_1;
            this.attackZDis = _arg_2;
        }

        public function onChasing():Boolean
        {
            if ((((this.aimElement == null)) || (this.aimElement.getIsDead()))){
                return (false);
            };
            if (this.hasChased == true){
                return (true);
            };
            var _local_1:int = (this.aimElement.mapX - this.target.mapX);
            var _local_2:int = (this.aimElement.mapZ - this.target.mapZ);
            var _local_3:int = (_local_1 * _local_1);
            var _local_4:int = (_local_2 * _local_2);
            if ((_local_3 + _local_4) > (this.chasetRR + 90000)){
                this.cancel();
                return (false);
            };
            var _local_5:Boolean = this.xClose(_local_1, _local_3);
            var _local_6:Boolean = this.zClose(_local_2, _local_4);
            var _local_7:Boolean = true;
            var _local_8:int = Constants.WALK_SIZE;
            var _local_9:Boolean = true;
            var _local_10:int;
            if (((_local_5) && (_local_6))){
                this.cancel();
                this.hasChased = true;
                return (true);
            };
            if (!_local_6){
                if (_local_2 > 0){
                    this.currentZKey = this.movekeys[1];
                    this.tempZKey = this.currentZKey;
                    this.target.inputVKey(this.currentZKey[0]);
                } else {
                    this.currentZKey = this.movekeys[0];
                    this.tempZKey = this.currentZKey;
                    this.target.inputVKey(this.currentZKey[0]);
                };
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
            };
            this.currentXKey = null;
            this.currentZKey = null;
            this.hasPressX = false;
            this.hasPressZ = false;
            this.hasChased = false;
        }

        public function reset():void
        {
            if (this.target != null){
                this.target.inputVKey(this.movekeys[0][1]);
                this.target.inputVKey(this.movekeys[1][1]);
                this.target.inputVKey(this.movekeys[2][1]);
                this.target.inputVKey(this.movekeys[3][1]);
            };
            this.currentXKey = null;
            this.currentZKey = null;
            this.hasPressX = false;
            this.hasPressZ = false;
            this.hasChased = false;
            this.tempZKey = null;
            this.tempXKey = null;
            this.target = null;
            this.scene = null;
            this.aimElement = null;
        }

        public /*  ©init. */ function _SafeStr_770()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai

// _SafeStr_770 = " AIZChaseElement" (String#14594)



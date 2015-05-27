// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.AIRunAwayElement

package com.tencent.ai.core.monster.ai
{
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.element.InteractElement;
    import com.tencent.ai.core.enum.VKeyDef;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.enum.Constants;
    import  ©init._SafeStr_765;

    public class AIRunAwayElement 
    {

        public var target:BaseActor;
        public var scene:IScene;
        public var aimElement:InteractElement;
        protected var movekeys:Array;
        protected var runMapX:int;
        protected var runMapZ:int;
        protected var currentZKey:Array;
        protected var currentXKey:Array;
        private var hasPressZ:Boolean = false;
        private var hasPressX:Boolean = false;

        public function AIRunAwayElement()
        {
            this.movekeys = [[VKeyDef.GO_UP, VKeyDef.STOP_UP], [VKeyDef.GO_DOWN, VKeyDef.STOP_DOWN], [VKeyDef.GO_LEFT, VKeyDef.STOP_LEFT], [VKeyDef.GO_RIGHT, VKeyDef.STOP_RIGHT]];
            super();
        }

        protected function zClose(_arg_1:int, _arg_2:int):Boolean
        {
            if (_arg_2 <= 900){
                this.runMapZ = this.target.mapZ;
                if (((!((this.currentZKey == null))) && ((this.hasPressZ == true)))){
                    this.target.inputVKey(this.currentZKey[1]);
                    this.currentZKey = null;
                    this.hasPressZ = false;
                };
                return (true);
            };
            return (false);
        }

        protected function xClose(_arg_1:int, _arg_2:int):Boolean
        {
            if (_arg_2 <= 900){
                this.runMapX = this.target.mapX;
                if (((!((this.currentXKey == null))) && ((this.hasPressX == true)))){
                    this.target.inputVKey(this.currentXKey[1]);
                    this.currentXKey = null;
                    this.hasPressX = false;
                };
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

        public function randomRunPos():void
        {
            if (this.aimElement.mapX <= this.target.mapX){
                this.runMapX = ((this.target.mapX + (DEFINE.RANDOM_FLOAT() * 1500)) - 150);
            } else {
                this.runMapX = ((this.target.mapX - (DEFINE.RANDOM_FLOAT() * 1500)) + 150);
            };
            if (this.aimElement.mapZ <= this.target.mapZ){
                this.runMapZ = ((this.target.mapZ + (DEFINE.RANDOM_FLOAT() * 500)) - 50);
            } else {
                this.runMapZ = ((this.target.mapZ - (DEFINE.RANDOM_FLOAT() * 500)) + 50);
            };
        }

        public function onAvoiding():Boolean
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_1:Boolean = true;
            if ((((this.aimElement == null)) || (this.aimElement.getIsDead()))){
                this.cancel();
                return (true);
            };
            _local_2 = (this.runMapX - this.target.mapX);
            _local_3 = (this.runMapZ - this.target.mapZ);
            _local_4 = (_local_2 * _local_2);
            _local_5 = (_local_3 * _local_3);
            var _local_6:Boolean = this.xClose(_local_2, _local_4);
            var _local_7:Boolean = this.zClose(_local_3, _local_5);
            if (((_local_6) && (_local_7))){
                this.cancel();
                return (true);
            };
            if (_local_3 > 30){
                this.currentZKey = this.movekeys[1];
            };
            if (_local_3 < -30){
                this.currentZKey = this.movekeys[0];
            };
            if (_local_2 > 30){
                this.currentXKey = this.movekeys[3];
            };
            if (_local_2 < -30){
                this.currentXKey = this.movekeys[2];
            };
            _local_1 = this.scene.isWalkable((this.target.mapX + Constants.WALK_SIZE), this.target.mapZ);
            if ((((_local_1 == false)) && ((this.currentXKey == this.movekeys[3])))){
                this.runMapX = this.target.mapX;
                if (this.currentXKey != null){
                    this.target.inputVKey(this.currentXKey[1]);
                    this.currentXKey = null;
                    this.hasPressX = false;
                };
            };
            _local_1 = this.scene.isWalkable((this.target.mapX - Constants.WALK_SIZE), this.target.mapZ);
            if ((((_local_1 == false)) && ((this.currentXKey == this.movekeys[2])))){
                this.runMapX = this.target.mapX;
                if (this.currentXKey != null){
                    this.target.inputVKey(this.currentXKey[1]);
                    this.currentXKey = null;
                    this.hasPressX = false;
                };
            };
            _local_1 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ + Constants.WALK_SIZE));
            if ((((_local_1 == false)) && ((this.currentZKey == this.movekeys[1])))){
                this.runMapZ = this.target.mapZ;
                if (this.currentZKey != null){
                    this.target.inputVKey(this.currentZKey[1]);
                    this.currentZKey = null;
                    this.hasPressZ = false;
                };
            };
            _local_1 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ - Constants.WALK_SIZE));
            if ((((_local_1 == false)) && ((this.currentZKey == this.movekeys[0])))){
                this.runMapZ = this.target.mapZ;
                if (this.currentZKey != null){
                    this.target.inputVKey(this.currentZKey[1]);
                    this.currentZKey = null;
                    this.hasPressZ = false;
                };
            };
            if (this.currentZKey != null){
                this.target.inputVKey(this.currentZKey[0]);
                this.hasPressZ = true;
            };
            if (this.currentXKey != null){
                this.target.inputVKey(this.currentXKey[0]);
                this.hasPressX = true;
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
            this.target = null;
            this.scene = null;
            this.aimElement = null;
        }

        public /*  ©init. */ function _SafeStr_765()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai

// _SafeStr_765 = " AIRunAwayElement" (String#16373)



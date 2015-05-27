// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.AIXRunElement

package com.tencent.ai.core.monster.ai
{
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.enum.VKeyDef;
    import  ©init._SafeStr_768;

    public class AIXRunElement 
    {

        public var target:BaseActor;
        public var moveMapX:int;
        public var directX:uint = 0;
        public var scene:IScene;
        protected var movekeys:Array;
        protected var currentXKey:Array;
        private var hasPressX:Boolean = false;

        public function AIXRunElement()
        {
            this.movekeys = [[VKeyDef.GO_UP, VKeyDef.STOP_UP], [VKeyDef.GO_DOWN, VKeyDef.STOP_DOWN], [VKeyDef.GO_LEFT, VKeyDef.STOP_LEFT], [VKeyDef.GO_RIGHT, VKeyDef.STOP_RIGHT]];
            super();
        }

        protected function xClose():Boolean
        {
            if ((((this.target.mapX >= this.moveMapX)) && ((this.directX == 0)))){
                return (true);
            };
            if ((((this.target.mapX <= this.moveMapX)) && ((this.directX == 1)))){
                return (true);
            };
            if ((((this.directX == 0)) && (!((this.currentXKey == this.movekeys[3]))))){
                if (this.currentXKey != null){
                    this.target.inputVKey(this.currentXKey[1]);
                };
                this.currentXKey = this.movekeys[3];
            } else {
                if ((((this.directX == 1)) && (!((this.currentXKey == this.movekeys[2]))))){
                    if (this.currentXKey != null){
                        this.target.inputVKey(this.currentXKey[1]);
                    };
                    this.currentXKey = this.movekeys[2];
                };
            };
            this.target.inputVKey(this.currentXKey[0]);
            return (false);
        }

        public function onMoving():Boolean
        {
            var _local_1:Boolean = this.xClose();
            if (_local_1){
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
            };
            this.currentXKey = null;
            this.hasPressX = false;
            this.hasPressX = false;
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
            this.hasPressX = false;
            this.target = null;
        }

        public /*  ©init. */ function _SafeStr_768()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai

// _SafeStr_768 = " AIXRunElement" (String#17471)



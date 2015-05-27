// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.AITimeChaseElement

package com.tencent.ai.core.monster.ai
{
    import com.tencent.ai.core.monster.BaseMonster;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.element.InteractElement;
    import com.tencent.ai.core.enum.VKeyDef;
    import com.tencent.ai.core.enum.Constants;
    import com.tencent.ai.core.manager.data.DEFINE;
    import  ©init._SafeStr_767;

    public class AITimeChaseElement 
    {

        public var target:BaseMonster;
        public var chasetRR:int;
        public var monsterIQ:int;
        public var scene:IScene;
        public var aimElement:InteractElement;
        protected var movekeys:Array;
        protected var attackXDis:int;
        protected var attackZDis:int;
        protected var currentZKey:Array;
        protected var currentXKey:Array;
        protected var brain:IMonsterBrain;
        private var hasPressZ:Boolean = false;
        private var hasPressX:Boolean = false;
        private var hasChased:Boolean = false;
        private var tempZKey:Array;
        private var tempXKey:Array;
        private var enlarge:int = 90000;

        public function AITimeChaseElement()
        {
            this.movekeys = [[VKeyDef.GO_UP, VKeyDef.STOP_UP], [VKeyDef.GO_DOWN, VKeyDef.STOP_DOWN], [VKeyDef.GO_LEFT, VKeyDef.STOP_LEFT], [VKeyDef.GO_RIGHT, VKeyDef.STOP_RIGHT]];
            super();
        }

        protected function zClose(_arg_1:int, _arg_2:int):Boolean
        {
            if (_arg_2 <= this.attackZDis){
                return (true);
            };
            var _local_3:Number = (this.target.getModel().walkV * 0.005);
            if (_arg_2 <= (_local_3 * _local_3)){
                return (true);
            };
            return (false);
        }

        protected function xClose(_arg_1:int, _arg_2:int):Boolean
        {
            if (_arg_2 <= this.attackXDis){
                return (true);
            };
            if (_arg_2 <= 400){
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
            if (_arg_2 > 225){
                this.attackZDis = 225;
            };
            this.hasChased = false;
        }

        public function onChasing():Boolean
        {
            var _local_19:int;
            if ((this.target.getAIComponent() as IMonsterBrain).getRageNum() <= 0){
                this.enlarge = 90000;
            } else {
                this.enlarge = 100000000;
            };
            if (this.aimElement == null){
                this.cancel();
                return (false);
            };
            if (this.aimElement.getIsDead()){
                return (false);
            };
            if (this.hasChased == true){
                return (true);
            };
            var _local_1:int = (this.aimElement.mapX - this.target.mapX);
            var _local_2:int = (this.aimElement.mapZ - this.target.mapZ);
            var _local_3:int = (_local_1 * _local_1);
            var _local_4:int = (_local_2 * _local_2);
            if ((_local_3 + _local_4) > (this.chasetRR + this.enlarge)){
                this.cancel();
                return (false);
            };
            var _local_5:Boolean = this.xClose(_local_1, _local_3);
            var _local_6:Boolean = this.zClose(_local_2, _local_4);
            var _local_7:Boolean = true;
            var _local_8:Boolean = true;
            var _local_9:Boolean = true;
            var _local_10:Boolean = true;
            var _local_11:Boolean = true;
            var _local_12:Boolean = true;
            var _local_13:Boolean = true;
            var _local_14:Boolean = true;
            var _local_15:Boolean = true;
            var _local_16:int = Constants.WALK_SIZE;
            var _local_17:Boolean = true;
            var _local_18:int;
            if (((_local_5) && (_local_6))){
                _local_19 = Math.abs((_local_1 / Constants.WALK_SIZE));
                _local_18 = 0;
                while (_local_18 < _local_19) {
                    if (_local_1 > 0){
                        _local_15 = this.scene.isWalkable((this.target.mapX + _local_16), this.target.mapZ);
                    };
                    if (_local_1 < 0){
                        _local_15 = this.scene.isWalkable((this.target.mapX - _local_16), this.target.mapZ);
                    };
                    if (_local_15 == false){
                        _local_17 = false;
                    };
                    _local_16 = (_local_16 + Constants.WALK_SIZE);
                    _local_18++;
                };
                if ((((_local_17 == true)) || (((DEFINE.RANDOM_FLOAT() * 10) < 2)))){
                    this.cancel();
                    this.hasChased = true;
                    return (true);
                };
            };
            _local_7 = this.scene.isWalkable((this.target.mapX + Constants.WALK_SIZE), this.target.mapZ);
            _local_8 = this.scene.isWalkable((this.target.mapX + Constants.WALK_SIZE), (this.target.mapZ + Constants.WALK_SIZE));
            _local_9 = this.scene.isWalkable((this.target.mapX + Constants.WALK_SIZE), (this.target.mapZ - Constants.WALK_SIZE));
            _local_10 = this.scene.isWalkable((this.target.mapX - Constants.WALK_SIZE), this.target.mapZ);
            _local_11 = this.scene.isWalkable((this.target.mapX - Constants.WALK_SIZE), (this.target.mapZ + Constants.WALK_SIZE));
            _local_12 = this.scene.isWalkable((this.target.mapX - Constants.WALK_SIZE), (this.target.mapZ - Constants.WALK_SIZE));
            _local_13 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ + Constants.WALK_SIZE));
            _local_14 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ - Constants.WALK_SIZE));
            if (((((((((((((((_local_7) && (_local_8))) && (_local_9))) && (_local_10))) && (_local_11))) && (_local_12))) && (_local_13))) && (_local_14))){
                if (_local_6){
                    if (this.currentZKey != null){
                        this.target.inputVKey(this.currentZKey[1]);
                        this.currentZKey = null;
                    };
                } else {
                    if ((((_local_2 > 0)) && ((_local_4 > this.attackZDis)))){
                        this.currentZKey = this.movekeys[1];
                        this.tempZKey = this.currentZKey;
                        this.target.inputVKey(this.currentZKey[0]);
                    } else {
                        if ((((_local_2 < 0)) && ((_local_4 > this.attackZDis)))){
                            this.currentZKey = this.movekeys[0];
                            this.tempZKey = this.currentZKey;
                            this.target.inputVKey(this.currentZKey[0]);
                        };
                    };
                };
                if (_local_5){
                    if (this.currentXKey != null){
                        this.target.inputVKey(this.currentXKey[1]);
                        this.currentXKey = null;
                    };
                } else {
                    if ((((_local_1 > 0)) && ((_local_3 > this.attackXDis)))){
                        this.currentXKey = this.movekeys[3];
                        this.tempXKey = this.currentXKey;
                        if (_local_3 > 400){
                            this.target.inputVKey(this.currentXKey[0]);
                        };
                    } else {
                        if ((((_local_1 < 0)) && ((_local_3 > this.attackXDis)))){
                            this.currentXKey = this.movekeys[2];
                            this.tempXKey = this.currentXKey;
                            if (_local_3 > 400){
                                this.target.inputVKey(this.currentXKey[0]);
                            };
                        };
                    };
                };
                return (false);
            };
            if (((((((((((_local_7) && (_local_8))) && (_local_9))) && (_local_13))) && (_local_14))) && ((_local_1 >= 0)))){
                if (_local_6){
                    if (this.currentZKey != null){
                        this.target.inputVKey(this.currentZKey[1]);
                        this.currentZKey = null;
                    };
                } else {
                    if ((((_local_2 > 0)) && ((_local_4 > this.attackZDis)))){
                        this.currentZKey = this.movekeys[1];
                        this.tempZKey = this.currentZKey;
                        this.target.inputVKey(this.currentZKey[0]);
                    } else {
                        if ((((_local_2 < 0)) && ((_local_4 > this.attackZDis)))){
                            this.currentZKey = this.movekeys[0];
                            this.tempZKey = this.currentZKey;
                            this.target.inputVKey(this.currentZKey[0]);
                        };
                    };
                };
                this.currentXKey = this.movekeys[3];
                this.tempXKey = this.currentXKey;
                if (_local_3 > 400){
                    this.target.inputVKey(this.currentXKey[0]);
                };
                return (false);
            };
            if (((((((((((_local_10) && (_local_11))) && (_local_12))) && (_local_13))) && (_local_14))) && ((_local_1 <= 0)))){
                if (_local_6){
                    if (this.currentZKey != null){
                        this.target.inputVKey(this.currentZKey[1]);
                        this.currentZKey = null;
                    };
                } else {
                    if ((((_local_2 > 0)) && ((_local_4 > this.attackZDis)))){
                        this.currentZKey = this.movekeys[1];
                        this.tempZKey = this.currentZKey;
                        this.target.inputVKey(this.currentZKey[0]);
                    } else {
                        if ((((_local_2 < 0)) && ((_local_4 > this.attackZDis)))){
                            this.currentZKey = this.movekeys[0];
                            this.tempZKey = this.currentZKey;
                            this.target.inputVKey(this.currentZKey[0]);
                        };
                    };
                };
                this.currentXKey = this.movekeys[2];
                this.tempXKey = this.currentXKey;
                if (_local_3 > 400){
                    this.target.inputVKey(this.currentXKey[0]);
                };
                return (false);
            };
            if ((((this.currentXKey == null)) && ((this.currentZKey == null)))){
                if (_local_1 > 0){
                    this.currentXKey = this.movekeys[3];
                    this.tempXKey = this.currentXKey;
                    if (_local_3 > 400){
                        this.target.inputVKey(this.currentXKey[0]);
                    };
                } else {
                    this.currentXKey = this.movekeys[2];
                    this.tempXKey = this.currentXKey;
                    if (_local_3 > 400){
                        this.target.inputVKey(this.currentXKey[0]);
                    };
                };
                if (_local_2 > 0){
                    this.currentZKey = this.movekeys[1];
                    this.tempZKey = this.currentZKey;
                    this.target.inputVKey(this.currentZKey[0]);
                } else {
                    this.currentZKey = this.movekeys[0];
                    this.tempZKey = this.currentZKey;
                    this.target.inputVKey(this.currentZKey[0]);
                };
            } else {
                if ((((this.currentXKey == this.movekeys[3])) && ((this.currentZKey == null)))){
                    _local_7 = this.scene.isWalkable((this.target.mapX + Constants.WALK_SIZE), this.target.mapZ);
                    if (!_local_7){
                        _local_16 = Constants.WALK_SIZE;
                        _local_17 = true;
                        _local_18 = 0;
                        _local_18 = 0;
                        while (_local_18 < 5) {
                            _local_15 = this.scene.isWalkable((this.target.mapX - _local_16), this.target.mapZ);
                            if (_local_15 == false){
                                _local_17 = false;
                            };
                            _local_16 = (_local_16 + Constants.WALK_SIZE);
                            _local_18++;
                        };
                        if (((_local_17) && ((_local_1 < 0)))){
                            this.currentXKey = this.movekeys[2];
                            if (_local_3 > 400){
                                this.target.inputVKey(this.currentXKey[0]);
                            };
                        } else {
                            this.currentZKey = this.tempZKey;
                            if (this.currentZKey == null){
                                if ((DEFINE.RANDOM_FLOAT() * 2) > 1){
                                    this.currentZKey = this.movekeys[1];
                                } else {
                                    this.currentZKey = this.movekeys[0];
                                };
                            };
                            this.target.inputVKey(this.currentZKey[0]);
                        };
                    };
                } else {
                    if ((((this.currentXKey == this.movekeys[2])) && ((this.currentZKey == null)))){
                        _local_7 = this.scene.isWalkable((this.target.mapX - Constants.WALK_SIZE), this.target.mapZ);
                        if (!_local_7){
                            _local_16 = Constants.WALK_SIZE;
                            _local_17 = true;
                            _local_18 = 0;
                            _local_18 = 0;
                            while (_local_18 < 5) {
                                _local_15 = this.scene.isWalkable((this.target.mapX + _local_16), this.target.mapZ);
                                if (_local_15 == false){
                                    _local_17 = false;
                                };
                                _local_16 = (_local_16 + Constants.WALK_SIZE);
                                _local_18++;
                            };
                            if (((_local_17) && ((_local_1 > 0)))){
                                this.currentXKey = this.movekeys[3];
                                if (_local_3 > 400){
                                    this.target.inputVKey(this.currentXKey[0]);
                                };
                            } else {
                                this.currentZKey = this.tempZKey;
                                if (this.currentZKey == null){
                                    if ((DEFINE.RANDOM_FLOAT() * 2) > 1){
                                        this.currentZKey = this.movekeys[1];
                                    } else {
                                        this.currentZKey = this.movekeys[0];
                                    };
                                };
                                this.target.inputVKey(this.currentZKey[0]);
                            };
                        };
                    } else {
                        if ((((this.currentXKey == null)) && ((this.currentZKey == this.movekeys[1])))){
                            _local_7 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ + Constants.WALK_SIZE));
                            if (!_local_7){
                                _local_16 = Constants.WALK_SIZE;
                                _local_17 = true;
                                _local_18 = 0;
                                _local_18 = 0;
                                while (_local_18 < 5) {
                                    _local_15 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ - _local_16));
                                    if (_local_15 == false){
                                        _local_17 = false;
                                    };
                                    _local_16 = (_local_16 + Constants.WALK_SIZE);
                                    _local_18++;
                                };
                                if (((_local_17) && ((_local_2 < 0)))){
                                    this.currentZKey = this.movekeys[0];
                                    this.target.inputVKey(this.currentZKey[0]);
                                } else {
                                    this.currentXKey = this.tempXKey;
                                    if (this.currentXKey == null){
                                        if ((DEFINE.RANDOM_FLOAT() * 2) > 1){
                                            this.currentXKey = this.movekeys[3];
                                        } else {
                                            this.currentXKey = this.movekeys[2];
                                        };
                                    };
                                    if (_local_3 > 400){
                                        this.target.inputVKey(this.currentXKey[0]);
                                    };
                                };
                            };
                        } else {
                            if ((((this.currentXKey == null)) && ((this.currentZKey == this.movekeys[0])))){
                                _local_7 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ - Constants.WALK_SIZE));
                                if (!_local_7){
                                    _local_16 = Constants.WALK_SIZE;
                                    _local_17 = true;
                                    _local_18 = 0;
                                    _local_18 = 0;
                                    while (_local_18 < 5) {
                                        _local_15 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ + _local_16));
                                        if (_local_15 == false){
                                            _local_17 = false;
                                        };
                                        _local_16 = (_local_16 + Constants.WALK_SIZE);
                                        _local_18++;
                                    };
                                    if (((_local_17) && ((_local_2 > 0)))){
                                        this.currentZKey = this.movekeys[1];
                                        this.target.inputVKey(this.currentZKey[0]);
                                    } else {
                                        this.currentXKey = this.tempXKey;
                                        if (this.currentXKey == null){
                                            if ((DEFINE.RANDOM_FLOAT() * 2) > 1){
                                                this.currentXKey = this.movekeys[3];
                                            } else {
                                                this.currentXKey = this.movekeys[2];
                                            };
                                        };
                                        if (_local_3 > 400){
                                            this.target.inputVKey(this.currentXKey[0]);
                                        };
                                    };
                                };
                            } else {
                                if ((((this.currentXKey == this.movekeys[3])) && ((this.currentZKey == this.movekeys[1])))){
                                    _local_7 = this.scene.isWalkable((this.target.mapX + Constants.WALK_SIZE), this.target.mapZ);
                                    _local_8 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ + Constants.WALK_SIZE));
                                    if (((!(_local_7)) && (!(_local_8)))){
                                        _local_10 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ - Constants.WALK_SIZE));
                                        if ((DEFINE.RANDOM_FLOAT() * 2) > 1){
                                            this.tempXKey = this.currentXKey;
                                            if (this.currentXKey != null){
                                                this.target.inputVKey(this.currentXKey[1]);
                                            };
                                            this.currentXKey = null;
                                            this.currentZKey = this.movekeys[0];
                                            this.target.inputVKey(this.currentZKey[0]);
                                        } else {
                                            this.tempZKey = this.currentZKey;
                                            if (this.currentZKey != null){
                                                this.target.inputVKey(this.currentZKey[1]);
                                            };
                                            this.currentZKey = null;
                                            this.currentXKey = this.movekeys[2];
                                            if (_local_3 > 400){
                                                this.target.inputVKey(this.currentXKey[0]);
                                            };
                                        };
                                    };
                                } else {
                                    if ((((this.currentXKey == this.movekeys[3])) && ((this.currentZKey == this.movekeys[0])))){
                                        _local_7 = this.scene.isWalkable((this.target.mapX + Constants.WALK_SIZE), this.target.mapZ);
                                        _local_8 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ - Constants.WALK_SIZE));
                                        if (((!(_local_7)) && (!(_local_8)))){
                                            _local_10 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ + Constants.WALK_SIZE));
                                            if ((DEFINE.RANDOM_FLOAT() * 2) > 1){
                                                this.tempXKey = this.currentXKey;
                                                if (this.currentXKey != null){
                                                    this.target.inputVKey(this.currentXKey[1]);
                                                };
                                                this.currentXKey = null;
                                                this.currentZKey = this.movekeys[1];
                                                this.target.inputVKey(this.currentZKey[0]);
                                            } else {
                                                this.tempZKey = this.currentZKey;
                                                if (this.currentZKey != null){
                                                    this.target.inputVKey(this.currentZKey[1]);
                                                };
                                                this.currentZKey = null;
                                                this.currentXKey = this.movekeys[2];
                                                if (_local_3 > 400){
                                                    this.target.inputVKey(this.currentXKey[0]);
                                                };
                                            };
                                        };
                                    } else {
                                        if ((((this.currentXKey == this.movekeys[2])) && ((this.currentZKey == this.movekeys[1])))){
                                            _local_7 = this.scene.isWalkable((this.target.mapX - Constants.WALK_SIZE), this.target.mapZ);
                                            _local_8 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ + Constants.WALK_SIZE));
                                            if (((!(_local_7)) && (!(_local_8)))){
                                                _local_10 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ - Constants.WALK_SIZE));
                                                if ((DEFINE.RANDOM_FLOAT() * 2) > 1){
                                                    this.tempXKey = this.currentXKey;
                                                    if (this.currentXKey != null){
                                                        this.target.inputVKey(this.currentXKey[1]);
                                                    };
                                                    this.currentXKey = null;
                                                    this.currentZKey = this.movekeys[0];
                                                    this.target.inputVKey(this.currentZKey[0]);
                                                } else {
                                                    this.tempZKey = this.currentZKey;
                                                    if (this.currentZKey != null){
                                                        this.target.inputVKey(this.currentZKey[1]);
                                                    };
                                                    this.currentZKey = null;
                                                    this.currentXKey = this.movekeys[3];
                                                    if (_local_3 > 400){
                                                        this.target.inputVKey(this.currentXKey[0]);
                                                    };
                                                };
                                            };
                                        } else {
                                            if ((((this.currentXKey == this.movekeys[2])) && ((this.currentZKey == this.movekeys[0])))){
                                                _local_7 = this.scene.isWalkable((this.target.mapX - Constants.WALK_SIZE), this.target.mapZ);
                                                _local_8 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ - Constants.WALK_SIZE));
                                                if (((!(_local_7)) && (!(_local_8)))){
                                                    _local_10 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ + Constants.WALK_SIZE));
                                                    if ((DEFINE.RANDOM_FLOAT() * 2) > 1){
                                                        this.tempXKey = this.currentXKey;
                                                        if (this.currentXKey != null){
                                                            this.target.inputVKey(this.currentXKey[1]);
                                                        };
                                                        this.currentXKey = null;
                                                        this.currentZKey = this.movekeys[1];
                                                        this.target.inputVKey(this.currentZKey[0]);
                                                    } else {
                                                        this.tempZKey = this.currentZKey;
                                                        if (this.currentZKey != null){
                                                            this.target.inputVKey(this.currentZKey[1]);
                                                        };
                                                        this.currentZKey = null;
                                                        this.currentXKey = this.movekeys[3];
                                                        if (_local_3 > 400){
                                                            this.target.inputVKey(this.currentXKey[0]);
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
            if (this.currentXKey != null){
                this.target.inputVKey(this.currentXKey[0]);
            };
            if (this.currentZKey != null){
                this.target.inputVKey(this.currentZKey[0]);
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

        public /*  ©init. */ function _SafeStr_767()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai

// _SafeStr_767 = " AITimeChaseElement" (String#17456)



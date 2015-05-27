// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.AI3DChaseElement

package com.tencent.ai.core.monster.ai
{
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.combat.ICombatScene;
    import com.tencent.ai.core.element.InteractElement;
    import com.tencent.ai.core.enum.VKeyDef;
    import com.tencent.ai.core.enum.Constants;
    import com.tencent.ai.core.manager.data.DEFINE;
    import  ©init._SafeStr_760;

    public class AI3DChaseElement 
    {

        public var target:BaseActor;
        public var chasetRR:int;
        public var monsterIQ:int;
        public var scene:ICombatScene;
        public var aimElement:InteractElement;
        public var aimY:int = 0;
        protected var movekeys:Array;
        protected var attackXDis:int;
        protected var attackZDis:int;
        protected var attackYDis:int;
        protected var currentZKey:Array;
        protected var currentXKey:Array;
        protected var currentYKey:Array;
        private var hasPressZ:Boolean = false;
        private var hasPressX:Boolean = false;
        private var hasPressY:Boolean = false;
        private var hasChased:Boolean = false;
        private var tempZKey:Array;
        private var tempXKey:Array;
        private var enlarge:int = 90000;

        public function AI3DChaseElement()
        {
            this.movekeys = [[VKeyDef.GO_UP, VKeyDef.STOP_UP], [VKeyDef.GO_DOWN, VKeyDef.STOP_DOWN], [VKeyDef.GO_LEFT, VKeyDef.STOP_LEFT], [VKeyDef.GO_RIGHT, VKeyDef.STOP_RIGHT], [VKeyDef.GO_Y_DOWN, VKeyDef.STOP_Y_DOWN], [VKeyDef.GO_Y_UP, VKeyDef.STOP_Y_UP]];
            super();
        }

        protected function yClose(_arg_1:int, _arg_2:int):Boolean
        {
            var _local_3:int = (this.aimElement.mapY - this.target.mapY);
            var _local_4:int = (_local_3 * _local_3);
            if ((((_arg_2 <= 100)) || ((_local_4 <= this.attackYDis)))){
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

        public function setAttackParams(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int):void
        {
            this.attackXDis = _arg_1;
            this.attackZDis = _arg_2;
            this.attackYDis = _arg_3;
            this.aimY = _arg_4;
            this.hasChased = false;
        }

        public function onChasing():Boolean
        {
            var _local_21:int;
            var _local_22:int;
            if ((this.target.getAIComponent() as IMonsterBrain).getRageNum() <= 0){
                this.enlarge = 90000;
            } else {
                this.enlarge = 100000000;
            };
            if (this.aimElement == null){
                this.cancel();
                this.hasChased = true;
                return (true);
            };
            if (this.aimElement.getIsDead()){
                return (false);
            };
            if (this.hasChased == true){
                return (true);
            };
            var _local_1:int = (this.aimElement.mapX - this.target.mapX);
            var _local_2:int = (this.aimElement.mapZ - this.target.mapZ);
            var _local_3:int = (this.aimY - this.target.mapY);
            var _local_4:int = (_local_1 * _local_1);
            var _local_5:int = (_local_2 * _local_2);
            var _local_6:int = (_local_3 * _local_3);
            if ((_local_4 + _local_5) > (this.chasetRR + this.enlarge)){
                this.cancel();
                return (false);
            };
            var _local_7:Boolean = this.xClose(_local_1, _local_4);
            var _local_8:Boolean = this.zClose(_local_2, _local_5);
            var _local_9:Boolean = this.yClose(_local_3, _local_6);
            var _local_10:Boolean = true;
            var _local_11:Boolean = true;
            var _local_12:Boolean = true;
            var _local_13:Boolean = true;
            var _local_14:Boolean = true;
            var _local_15:Boolean = true;
            var _local_16:Boolean = true;
            var _local_17:Boolean = true;
            var _local_18:Boolean = true;
            var _local_19:int = Constants.WALK_SIZE;
            var _local_20:Boolean = true;
            if (((((_local_7) && (_local_8))) && (_local_9))){
                _local_21 = Math.abs((_local_1 / Constants.WALK_SIZE));
                _local_22 = 0;
                while (_local_22 < _local_21) {
                    if (_local_1 > 0){
                        _local_18 = this.scene.isWalkable((this.target.mapX + _local_19), this.target.mapZ);
                    };
                    if (_local_1 < 0){
                        _local_18 = this.scene.isWalkable((this.target.mapX - _local_19), this.target.mapZ);
                    };
                    if (_local_18 == false){
                        _local_20 = false;
                    };
                    _local_19 = (_local_19 + Constants.WALK_SIZE);
                    _local_22++;
                };
                if ((((_local_20 == true)) || (((DEFINE.RANDOM_FLOAT() * 10) < 2)))){
                    this.cancel();
                    this.hasChased = true;
                    return (true);
                };
            };
            _local_10 = this.scene.isWalkable((this.target.mapX + Constants.WALK_SIZE), this.target.mapZ);
            _local_11 = this.scene.isWalkable((this.target.mapX + Constants.WALK_SIZE), (this.target.mapZ + Constants.WALK_SIZE));
            _local_12 = this.scene.isWalkable((this.target.mapX + Constants.WALK_SIZE), (this.target.mapZ - Constants.WALK_SIZE));
            _local_13 = this.scene.isWalkable((this.target.mapX - Constants.WALK_SIZE), this.target.mapZ);
            _local_14 = this.scene.isWalkable((this.target.mapX - Constants.WALK_SIZE), (this.target.mapZ + Constants.WALK_SIZE));
            _local_15 = this.scene.isWalkable((this.target.mapX - Constants.WALK_SIZE), (this.target.mapZ - Constants.WALK_SIZE));
            _local_16 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ + Constants.WALK_SIZE));
            _local_17 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ - Constants.WALK_SIZE));
            if (((((((((((((((_local_10) && (_local_11))) && (_local_12))) && (_local_13))) && (_local_14))) && (_local_15))) && (_local_16))) && (_local_17))){
                if (_local_8){
                    if (this.currentZKey != null){
                        this.target.inputVKey(this.currentZKey[1]);
                        this.currentZKey = null;
                    };
                } else {
                    if ((((_local_2 > 0)) && ((_local_5 > this.attackZDis)))){
                        this.currentZKey = this.movekeys[1];
                        this.tempZKey = this.currentZKey;
                        this.target.inputVKey(this.currentZKey[0]);
                    } else {
                        if ((((_local_2 < 0)) && ((_local_5 > this.attackZDis)))){
                            this.currentZKey = this.movekeys[0];
                            this.tempZKey = this.currentZKey;
                            this.target.inputVKey(this.currentZKey[0]);
                        };
                    };
                };
                if (_local_7){
                    if (this.currentXKey != null){
                        this.target.inputVKey(this.currentXKey[1]);
                        this.currentXKey = null;
                    };
                } else {
                    if ((((_local_1 > 0)) && ((_local_4 > this.attackXDis)))){
                        this.currentXKey = this.movekeys[3];
                        this.tempXKey = this.currentXKey;
                        if (_local_4 > 400){
                            this.target.inputVKey(this.currentXKey[0]);
                        };
                    } else {
                        if ((((_local_1 < 0)) && ((_local_4 > this.attackXDis)))){
                            this.currentXKey = this.movekeys[2];
                            this.tempXKey = this.currentXKey;
                            if (_local_4 > 400){
                                this.target.inputVKey(this.currentXKey[0]);
                            };
                        };
                    };
                };
                return (false);
            };
            if (((((((((((_local_10) && (_local_11))) && (_local_12))) && (_local_16))) && (_local_17))) && ((_local_1 >= 0)))){
                if (_local_8){
                    if (this.currentZKey != null){
                        this.target.inputVKey(this.currentZKey[1]);
                        this.currentZKey = null;
                    };
                } else {
                    if ((((_local_2 > 0)) && ((_local_5 > this.attackZDis)))){
                        this.currentZKey = this.movekeys[1];
                        this.tempZKey = this.currentZKey;
                        this.target.inputVKey(this.currentZKey[0]);
                    } else {
                        if ((((_local_2 < 0)) && ((_local_5 > this.attackZDis)))){
                            this.currentZKey = this.movekeys[0];
                            this.tempZKey = this.currentZKey;
                            this.target.inputVKey(this.currentZKey[0]);
                        };
                    };
                };
                this.currentXKey = this.movekeys[3];
                this.tempXKey = this.currentXKey;
                if (_local_4 > 400){
                    this.target.inputVKey(this.currentXKey[0]);
                };
                return (false);
            };
            if (((((((((((_local_13) && (_local_14))) && (_local_15))) && (_local_16))) && (_local_17))) && ((_local_1 <= 0)))){
                if (_local_8){
                    if (this.currentZKey != null){
                        this.target.inputVKey(this.currentZKey[1]);
                        this.currentZKey = null;
                    };
                } else {
                    if ((((_local_2 > 0)) && ((_local_5 > this.attackZDis)))){
                        this.currentZKey = this.movekeys[1];
                        this.tempZKey = this.currentZKey;
                        this.target.inputVKey(this.currentZKey[0]);
                    } else {
                        if ((((_local_2 < 0)) && ((_local_5 > this.attackZDis)))){
                            this.currentZKey = this.movekeys[0];
                            this.tempZKey = this.currentZKey;
                            this.target.inputVKey(this.currentZKey[0]);
                        };
                    };
                };
                this.currentXKey = this.movekeys[2];
                this.tempXKey = this.currentXKey;
                if (_local_4 > 400){
                    this.target.inputVKey(this.currentXKey[0]);
                };
                return (false);
            };
            if ((((this.currentXKey == null)) && ((this.currentZKey == null)))){
                if (_local_1 > 0){
                    this.currentXKey = this.movekeys[3];
                    this.tempXKey = this.currentXKey;
                    if (_local_4 > 400){
                        this.target.inputVKey(this.currentXKey[0]);
                    };
                } else {
                    this.currentXKey = this.movekeys[2];
                    this.tempXKey = this.currentXKey;
                    if (_local_4 > 400){
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
                    _local_10 = this.scene.isWalkable((this.target.mapX + Constants.WALK_SIZE), this.target.mapZ);
                    if (!_local_10){
                        _local_19 = Constants.WALK_SIZE;
                        _local_20 = true;
                        _local_22 = 0;
                        _local_22 = 0;
                        while (_local_22 < 5) {
                            _local_18 = this.scene.isWalkable((this.target.mapX - _local_19), this.target.mapZ);
                            if (_local_18 == false){
                                _local_20 = false;
                            };
                            _local_19 = (_local_19 + Constants.WALK_SIZE);
                            _local_22++;
                        };
                        if (((_local_20) && ((_local_1 < 0)))){
                            this.currentXKey = this.movekeys[2];
                            if (_local_4 > 400){
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
                        _local_10 = this.scene.isWalkable((this.target.mapX - Constants.WALK_SIZE), this.target.mapZ);
                        if (!_local_10){
                            _local_19 = Constants.WALK_SIZE;
                            _local_20 = true;
                            _local_22 = 0;
                            _local_22 = 0;
                            while (_local_22 < 5) {
                                _local_18 = this.scene.isWalkable((this.target.mapX + _local_19), this.target.mapZ);
                                if (_local_18 == false){
                                    _local_20 = false;
                                };
                                _local_19 = (_local_19 + Constants.WALK_SIZE);
                                _local_22++;
                            };
                            if (((_local_20) && ((_local_1 > 0)))){
                                this.currentXKey = this.movekeys[3];
                                if (_local_4 > 400){
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
                            _local_10 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ + Constants.WALK_SIZE));
                            if (!_local_10){
                                _local_19 = Constants.WALK_SIZE;
                                _local_20 = true;
                                _local_22 = 0;
                                _local_22 = 0;
                                while (_local_22 < 5) {
                                    _local_18 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ - _local_19));
                                    if (_local_18 == false){
                                        _local_20 = false;
                                    };
                                    _local_19 = (_local_19 + Constants.WALK_SIZE);
                                    _local_22++;
                                };
                                if (((_local_20) && ((_local_2 < 0)))){
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
                                    if (_local_4 > 400){
                                        this.target.inputVKey(this.currentXKey[0]);
                                    };
                                };
                            };
                        } else {
                            if ((((this.currentXKey == null)) && ((this.currentZKey == this.movekeys[0])))){
                                _local_10 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ - Constants.WALK_SIZE));
                                if (!_local_10){
                                    _local_19 = Constants.WALK_SIZE;
                                    _local_20 = true;
                                    _local_22 = 0;
                                    _local_22 = 0;
                                    while (_local_22 < 5) {
                                        _local_18 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ + _local_19));
                                        if (_local_18 == false){
                                            _local_20 = false;
                                        };
                                        _local_19 = (_local_19 + Constants.WALK_SIZE);
                                        _local_22++;
                                    };
                                    if (((_local_20) && ((_local_2 > 0)))){
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
                                        if (_local_4 > 400){
                                            this.target.inputVKey(this.currentXKey[0]);
                                        };
                                    };
                                };
                            } else {
                                if ((((this.currentXKey == this.movekeys[3])) && ((this.currentZKey == this.movekeys[1])))){
                                    _local_10 = this.scene.isWalkable((this.target.mapX + Constants.WALK_SIZE), this.target.mapZ);
                                    _local_11 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ + Constants.WALK_SIZE));
                                    if (((!(_local_10)) && (!(_local_11)))){
                                        _local_13 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ - Constants.WALK_SIZE));
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
                                            if (_local_4 > 400){
                                                this.target.inputVKey(this.currentXKey[0]);
                                            };
                                        };
                                    };
                                } else {
                                    if ((((this.currentXKey == this.movekeys[3])) && ((this.currentZKey == this.movekeys[0])))){
                                        _local_10 = this.scene.isWalkable((this.target.mapX + Constants.WALK_SIZE), this.target.mapZ);
                                        _local_11 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ - Constants.WALK_SIZE));
                                        if (((!(_local_10)) && (!(_local_11)))){
                                            _local_13 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ + Constants.WALK_SIZE));
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
                                                if (_local_4 > 400){
                                                    this.target.inputVKey(this.currentXKey[0]);
                                                };
                                            };
                                        };
                                    } else {
                                        if ((((this.currentXKey == this.movekeys[2])) && ((this.currentZKey == this.movekeys[1])))){
                                            _local_10 = this.scene.isWalkable((this.target.mapX - Constants.WALK_SIZE), this.target.mapZ);
                                            _local_11 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ + Constants.WALK_SIZE));
                                            if (((!(_local_10)) && (!(_local_11)))){
                                                _local_13 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ - Constants.WALK_SIZE));
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
                                                    if (_local_4 > 400){
                                                        this.target.inputVKey(this.currentXKey[0]);
                                                    };
                                                };
                                            };
                                        } else {
                                            if ((((this.currentXKey == this.movekeys[2])) && ((this.currentZKey == this.movekeys[0])))){
                                                _local_10 = this.scene.isWalkable((this.target.mapX - Constants.WALK_SIZE), this.target.mapZ);
                                                _local_11 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ - Constants.WALK_SIZE));
                                                if (((!(_local_10)) && (!(_local_11)))){
                                                    _local_13 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ + Constants.WALK_SIZE));
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
                                                        if (_local_4 > 400){
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
                this.target.inputVKey(this.movekeys[4][1]);
                this.target.inputVKey(this.movekeys[5][1]);
            };
            this.currentXKey = null;
            this.currentZKey = null;
            this.currentYKey = null;
            this.hasPressX = false;
            this.hasPressZ = false;
            this.hasPressY = false;
            this.hasChased = false;
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
            this.currentXKey = null;
            this.currentZKey = null;
            this.currentYKey = null;
            this.hasPressX = false;
            this.hasPressZ = false;
            this.hasPressY = false;
            this.hasChased = false;
            this.tempZKey = null;
            this.tempXKey = null;
            this.target = null;
            this.scene = null;
            this.aimElement = null;
        }

        public /*  ©init. */ function _SafeStr_760()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai

// _SafeStr_760 = " AI3DChaseElement" (String#15398)



// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.AI3DAvoidElement

package com.tencent.ai.core.monster.ai
{
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.combat.ICombatScene;
    import com.tencent.ai.core.element.InteractElement;
    import com.tencent.ai.core.enum.VKeyDef;
    import com.tencent.free.logging.debug;
    import com.tencent.ai.core.enum.Constants;
    import com.tencent.ai.core.manager.data.DEFINE;
    import  ©init._SafeStr_759;

    public class AI3DAvoidElement 
    {

        public var target:BaseActor;
        public var avoidRR:int;
        public var monsterIQ:int;
        public var monsterTemper:int;
        public var scene:ICombatScene;
        public var aimY:int = 0;
        public var aimElement:InteractElement;
        protected var movekeys:Array;
        protected var attackXDis:int;
        protected var attackZDis:int;
        protected var attackYDis:int;
        protected var runMapX:int;
        protected var runMapZ:int;
        protected var currentZKey:Array;
        protected var currentXKey:Array;
        protected var currentYKey:Array;
        private var hasPressZ:Boolean = false;
        private var hasPressX:Boolean = false;
        private var hasPressY:Boolean = false;
        private var hasAvoided:Boolean = false;
        private var hasChased:Boolean = false;
        private var tempZKey:Array;
        private var tempXKey:Array;

        public function AI3DAvoidElement()
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
            if (_arg_2 <= 400){
                if (((!((this.currentZKey == null))) && ((this.hasPressZ == true)))){
                    this.target.inputVKey(this.currentZKey[1]);
                    this.hasPressZ = false;
                };
                return (true);
            };
            if (_arg_1 > 0){
                this.currentZKey = this.movekeys[1];
            } else {
                if (_arg_1 < 0){
                    this.currentZKey = this.movekeys[0];
                };
            };
            if (((!((this.currentZKey == null))) && ((this.hasPressZ == false)))){
                this.target.inputVKey(this.currentZKey[0]);
                this.hasPressZ = true;
            };
            return (false);
        }

        protected function xClose(_arg_1:int, _arg_2:int):Boolean
        {
            if (_arg_2 <= 400){
                if (((!((this.currentXKey == null))) && ((this.hasPressX == true)))){
                    this.target.inputVKey(this.currentXKey[1]);
                    this.hasPressX = false;
                };
                return (true);
            };
            if (_arg_1 > 0){
                this.currentXKey = this.movekeys[3];
            } else {
                if (_arg_1 < 0){
                    this.currentXKey = this.movekeys[2];
                };
            };
            if (((!((this.currentXKey == null))) && ((this.hasPressX == false)))){
                this.target.inputVKey(this.currentXKey[0]);
                this.hasPressX = true;
            };
            return (false);
        }

        protected function zClose2(_arg_1:int, _arg_2:int):Boolean
        {
            if (_arg_2 <= this.attackZDis){
                return (true);
            };
            return (false);
        }

        protected function xClose2(_arg_1:int, _arg_2:int):Boolean
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

        public function setAttackParams(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int):void
        {
            debug("[AI3DAvoidElement] 设置立体躲避元素参数");
            this.attackXDis = _arg_1;
            this.attackZDis = _arg_2;
            this.attackYDis = _arg_3;
            this.aimY = _arg_4;
            this.randomRunPos();
        }

        public function randomRunPos():void
        {
            if (this.aimElement.mapX <= this.target.mapX){
                this.runMapX = (this.aimElement.mapX - this.attackXDis);
            } else {
                this.runMapX = (this.aimElement.mapX + this.attackXDis);
            };
            if (this.aimElement.mapZ <= this.target.mapZ){
                this.runMapZ = (this.aimElement.mapZ - this.attackZDis);
            } else {
                this.runMapZ = (this.aimElement.mapZ + this.attackZDis);
            };
        }

        public function onAvoiding():Boolean
        {
            var _local_10:int;
            var _local_11:int;
            var _local_12:int;
            var _local_13:int;
            var _local_14:int;
            var _local_15:int;
            var _local_16:Boolean;
            var _local_17:Boolean;
            var _local_18:Boolean;
            var _local_19:Boolean;
            var _local_20:Boolean;
            var _local_21:Boolean;
            var _local_22:int;
            var _local_23:Boolean;
            var _local_24:int;
            var _local_25:int;
            var _local_1:Boolean = true;
            var _local_2:Boolean = true;
            var _local_3:Boolean = true;
            var _local_4:Boolean = true;
            var _local_5:Boolean = true;
            var _local_6:Boolean = true;
            var _local_7:Boolean = true;
            var _local_8:Boolean = true;
            var _local_9:Boolean = true;
            if (this.hasAvoided == false){
                if ((((this.aimElement == null)) || (this.aimElement.getIsDead()))){
                    this.cancel();
                    return (false);
                };
                _local_10 = (this.runMapX - this.target.mapX);
                _local_12 = (this.runMapZ - this.target.mapZ);
                _local_11 = (this.aimY - this.target.mapY);
                _local_13 = (_local_10 * _local_10);
                _local_15 = (_local_12 * _local_12);
                _local_14 = (_local_11 * _local_11);
                _local_16 = this.xClose(_local_10, _local_13);
                _local_17 = this.zClose(_local_12, _local_15);
                _local_18 = this.yClose(_local_11, _local_14);
                if (((((_local_16) && (_local_17))) && (_local_18))){
                    this.cancel();
                };
                if ((((_local_12 > 0)) && ((_local_15 > this.attackZDis)))){
                    this.currentZKey = this.movekeys[1];
                };
                if ((((_local_12 < 0)) && ((_local_15 > this.attackZDis)))){
                    this.currentZKey = this.movekeys[0];
                };
                if ((((_local_10 > 0)) && ((_local_13 > this.attackXDis)))){
                    this.currentXKey = this.movekeys[3];
                };
                if ((((_local_10 < 0)) && ((_local_13 > this.attackXDis)))){
                    this.currentXKey = this.movekeys[2];
                };
                _local_1 = this.scene.isWalkable((this.target.mapX + Constants.WALK_SIZE), this.target.mapZ);
                if ((((((_local_1 == false)) && ((this.hasPressX == true)))) && ((this.currentXKey == this.movekeys[3])))){
                    this.runMapX = this.target.mapX;
                    this.cancel();
                };
                _local_1 = this.scene.isWalkable((this.target.mapX - Constants.WALK_SIZE), this.target.mapZ);
                if ((((((_local_1 == false)) && ((this.hasPressX == true)))) && ((this.currentXKey == this.movekeys[2])))){
                    this.runMapX = this.target.mapX;
                    this.cancel();
                };
                _local_1 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ + Constants.WALK_SIZE));
                if ((((((_local_1 == false)) && ((this.hasPressZ == true)))) && ((this.currentZKey == this.movekeys[1])))){
                    this.runMapZ = this.target.mapZ;
                    this.cancel();
                };
                _local_1 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ - Constants.WALK_SIZE));
                if ((((((_local_1 == false)) && ((this.hasPressZ == true)))) && ((this.currentZKey == this.movekeys[0])))){
                    this.runMapZ = this.target.mapZ;
                    this.cancel();
                };
                if (this.currentZKey != null){
                    this.target.inputVKey(this.currentZKey[0]);
                    this.hasPressZ = true;
                };
                if (this.currentXKey != null){
                    this.target.inputVKey(this.currentXKey[0]);
                    this.hasPressX = true;
                };
            };
            if (this.hasAvoided == true){
                if ((((this.aimElement == null)) || (this.aimElement.getIsDead()))){
                    return (false);
                };
                if (this.hasChased == true){
                    return (true);
                };
                _local_10 = (this.aimElement.mapX - this.target.mapX);
                _local_12 = (this.aimElement.mapZ - this.target.mapZ);
                _local_13 = (_local_10 * _local_10);
                _local_15 = (_local_12 * _local_12);
                _local_19 = this.xClose2(_local_10, _local_13);
                _local_20 = this.zClose2(_local_12, _local_15);
                _local_21 = this.yClose(_local_11, _local_14);
                _local_22 = Constants.WALK_SIZE;
                _local_23 = true;
                if (((((_local_19) && (_local_20))) && (_local_21))){
                    _local_24 = Math.abs((_local_10 / Constants.WALK_SIZE));
                    _local_25 = 0;
                    while (_local_25 < _local_24) {
                        if (_local_10 > 0){
                            _local_9 = this.scene.isWalkable((this.target.mapX + _local_22), this.target.mapZ);
                        };
                        if (_local_10 < 0){
                            _local_9 = this.scene.isWalkable((this.target.mapX - _local_22), this.target.mapZ);
                        };
                        if (_local_9 == false){
                            _local_23 = false;
                        };
                        _local_22 = (_local_22 + Constants.WALK_SIZE);
                        _local_25++;
                    };
                    if (_local_23 == true){
                        this.cancel();
                        this.hasChased = true;
                        return (true);
                    };
                };
                _local_1 = this.scene.isWalkable((this.target.mapX + Constants.WALK_SIZE), this.target.mapZ);
                _local_2 = this.scene.isWalkable((this.target.mapX + Constants.WALK_SIZE), (this.target.mapZ + Constants.WALK_SIZE));
                _local_3 = this.scene.isWalkable((this.target.mapX + Constants.WALK_SIZE), (this.target.mapZ - Constants.WALK_SIZE));
                _local_4 = this.scene.isWalkable((this.target.mapX - Constants.WALK_SIZE), this.target.mapZ);
                _local_5 = this.scene.isWalkable((this.target.mapX - Constants.WALK_SIZE), (this.target.mapZ + Constants.WALK_SIZE));
                _local_6 = this.scene.isWalkable((this.target.mapX - Constants.WALK_SIZE), (this.target.mapZ - Constants.WALK_SIZE));
                _local_7 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ + Constants.WALK_SIZE));
                _local_8 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ - Constants.WALK_SIZE));
                if (((((((((((((((_local_1) && (_local_2))) && (_local_3))) && (_local_4))) && (_local_5))) && (_local_6))) && (_local_7))) && (_local_8))){
                    if (_local_17){
                        if (this.currentZKey != null){
                            this.target.inputVKey(this.currentZKey[1]);
                            this.currentZKey = null;
                        };
                    } else {
                        if ((((_local_12 > 0)) && ((_local_15 > this.attackZDis)))){
                            this.currentZKey = this.movekeys[1];
                            this.tempZKey = this.currentZKey;
                            this.target.inputVKey(this.currentZKey[0]);
                        } else {
                            if ((((_local_12 < 0)) && ((_local_15 > this.attackZDis)))){
                                this.currentZKey = this.movekeys[0];
                                this.tempZKey = this.currentZKey;
                                this.target.inputVKey(this.currentZKey[0]);
                            };
                        };
                    };
                    if (_local_16){
                        if (this.currentXKey != null){
                            this.target.inputVKey(this.currentXKey[1]);
                            this.currentXKey = null;
                        };
                    } else {
                        if ((((_local_10 > 0)) && ((_local_13 > this.attackXDis)))){
                            this.currentXKey = this.movekeys[3];
                            this.tempXKey = this.currentXKey;
                            if (_local_13 > 400){
                                this.target.inputVKey(this.currentXKey[0]);
                            };
                        } else {
                            if ((((_local_10 < 0)) && ((_local_13 > this.attackXDis)))){
                                this.currentXKey = this.movekeys[2];
                                this.tempXKey = this.currentXKey;
                                if (_local_13 > 400){
                                    this.target.inputVKey(this.currentXKey[0]);
                                };
                            };
                        };
                    };
                    return (false);
                };
                if (((((((((((_local_1) && (_local_2))) && (_local_3))) && (_local_7))) && (_local_8))) && ((_local_10 >= 0)))){
                    if (_local_17){
                        if (this.currentZKey != null){
                            this.target.inputVKey(this.currentZKey[1]);
                            this.currentZKey = null;
                        };
                    } else {
                        if ((((_local_12 > 0)) && ((_local_15 > this.attackZDis)))){
                            this.currentZKey = this.movekeys[1];
                            this.tempZKey = this.currentZKey;
                            this.target.inputVKey(this.currentZKey[0]);
                        } else {
                            if ((((_local_12 < 0)) && ((_local_15 > this.attackZDis)))){
                                this.currentZKey = this.movekeys[0];
                                this.tempZKey = this.currentZKey;
                                this.target.inputVKey(this.currentZKey[0]);
                            };
                        };
                    };
                    this.currentXKey = this.movekeys[3];
                    this.tempXKey = this.currentXKey;
                    if (_local_13 > 400){
                        this.target.inputVKey(this.currentXKey[0]);
                    };
                    return (false);
                };
                if (((((((((((_local_4) && (_local_5))) && (_local_6))) && (_local_7))) && (_local_8))) && ((_local_10 <= 0)))){
                    if (_local_17){
                        if (this.currentZKey != null){
                            this.target.inputVKey(this.currentZKey[1]);
                            this.currentZKey = null;
                        };
                    } else {
                        if ((((_local_12 > 0)) && ((_local_15 > this.attackZDis)))){
                            this.currentZKey = this.movekeys[1];
                            this.tempZKey = this.currentZKey;
                            this.target.inputVKey(this.currentZKey[0]);
                        } else {
                            if ((((_local_12 < 0)) && ((_local_15 > this.attackZDis)))){
                                this.currentZKey = this.movekeys[0];
                                this.tempZKey = this.currentZKey;
                                this.target.inputVKey(this.currentZKey[0]);
                            };
                        };
                    };
                    this.currentXKey = this.movekeys[2];
                    this.tempXKey = this.currentXKey;
                    if (_local_13 > 400){
                        this.target.inputVKey(this.currentXKey[0]);
                    };
                    return (false);
                };
                if ((((this.currentXKey == null)) && ((this.currentZKey == null)))){
                    if (_local_10 > 0){
                        this.currentXKey = this.movekeys[3];
                        this.tempXKey = this.currentXKey;
                        if (_local_13 > 400){
                            this.target.inputVKey(this.currentXKey[0]);
                        };
                    } else {
                        this.currentXKey = this.movekeys[2];
                        this.tempXKey = this.currentXKey;
                        if (_local_13 > 400){
                            this.target.inputVKey(this.currentXKey[0]);
                        };
                    };
                    if (_local_12 > 0){
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
                        _local_1 = this.scene.isWalkable((this.target.mapX + Constants.WALK_SIZE), this.target.mapZ);
                        if (!_local_1){
                            _local_22 = Constants.WALK_SIZE;
                            _local_23 = true;
                            _local_25 = 0;
                            _local_25 = 0;
                            while (_local_25 < 5) {
                                _local_9 = this.scene.isWalkable((this.target.mapX - _local_22), this.target.mapZ);
                                if (_local_9 == false){
                                    _local_23 = false;
                                };
                                _local_22 = (_local_22 + Constants.WALK_SIZE);
                                _local_25++;
                            };
                            if (((_local_23) && ((_local_10 < 0)))){
                                this.currentXKey = this.movekeys[2];
                                if (_local_13 > 400){
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
                            _local_1 = this.scene.isWalkable((this.target.mapX - Constants.WALK_SIZE), this.target.mapZ);
                            if (!_local_1){
                                _local_22 = Constants.WALK_SIZE;
                                _local_23 = true;
                                _local_25 = 0;
                                _local_25 = 0;
                                while (_local_25 < 5) {
                                    _local_9 = this.scene.isWalkable((this.target.mapX + _local_22), this.target.mapZ);
                                    if (_local_9 == false){
                                        _local_23 = false;
                                    };
                                    _local_22 = (_local_22 + Constants.WALK_SIZE);
                                    _local_25++;
                                };
                                if (((_local_23) && ((_local_10 > 0)))){
                                    this.currentXKey = this.movekeys[3];
                                    if (_local_13 > 400){
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
                                _local_1 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ + Constants.WALK_SIZE));
                                if (!_local_1){
                                    _local_22 = Constants.WALK_SIZE;
                                    _local_23 = true;
                                    _local_25 = 0;
                                    _local_25 = 0;
                                    while (_local_25 < 5) {
                                        _local_9 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ - _local_22));
                                        if (_local_9 == false){
                                            _local_23 = false;
                                        };
                                        _local_22 = (_local_22 + Constants.WALK_SIZE);
                                        _local_25++;
                                    };
                                    if (((_local_23) && ((_local_12 < 0)))){
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
                                        if (_local_13 > 400){
                                            this.target.inputVKey(this.currentXKey[0]);
                                        };
                                    };
                                };
                            } else {
                                if ((((this.currentXKey == null)) && ((this.currentZKey == this.movekeys[0])))){
                                    _local_1 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ - Constants.WALK_SIZE));
                                    if (!_local_1){
                                        _local_22 = Constants.WALK_SIZE;
                                        _local_23 = true;
                                        _local_25 = 0;
                                        _local_25 = 0;
                                        while (_local_25 < 5) {
                                            _local_9 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ + _local_22));
                                            if (_local_9 == false){
                                                _local_23 = false;
                                            };
                                            _local_22 = (_local_22 + Constants.WALK_SIZE);
                                            _local_25++;
                                        };
                                        if (((_local_23) && ((_local_12 > 0)))){
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
                                            if (_local_13 > 400){
                                                this.target.inputVKey(this.currentXKey[0]);
                                            };
                                        };
                                    };
                                } else {
                                    if ((((this.currentXKey == this.movekeys[3])) && ((this.currentZKey == this.movekeys[1])))){
                                        _local_1 = this.scene.isWalkable((this.target.mapX + Constants.WALK_SIZE), this.target.mapZ);
                                        _local_2 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ + Constants.WALK_SIZE));
                                        if (((!(_local_1)) && (!(_local_2)))){
                                            _local_4 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ - Constants.WALK_SIZE));
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
                                                if (_local_13 > 400){
                                                    this.target.inputVKey(this.currentXKey[0]);
                                                };
                                            };
                                        };
                                    } else {
                                        if ((((this.currentXKey == this.movekeys[3])) && ((this.currentZKey == this.movekeys[0])))){
                                            _local_1 = this.scene.isWalkable((this.target.mapX + Constants.WALK_SIZE), this.target.mapZ);
                                            _local_2 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ - Constants.WALK_SIZE));
                                            if (((!(_local_1)) && (!(_local_2)))){
                                                _local_4 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ + Constants.WALK_SIZE));
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
                                                    if (_local_13 > 400){
                                                        this.target.inputVKey(this.currentXKey[0]);
                                                    };
                                                };
                                            };
                                        } else {
                                            if ((((this.currentXKey == this.movekeys[2])) && ((this.currentZKey == this.movekeys[1])))){
                                                _local_1 = this.scene.isWalkable((this.target.mapX - Constants.WALK_SIZE), this.target.mapZ);
                                                _local_2 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ + Constants.WALK_SIZE));
                                                if (((!(_local_1)) && (!(_local_2)))){
                                                    _local_4 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ - Constants.WALK_SIZE));
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
                                                        if (_local_13 > 400){
                                                            this.target.inputVKey(this.currentXKey[0]);
                                                        };
                                                    };
                                                };
                                            } else {
                                                if ((((this.currentXKey == this.movekeys[2])) && ((this.currentZKey == this.movekeys[0])))){
                                                    _local_1 = this.scene.isWalkable((this.target.mapX - Constants.WALK_SIZE), this.target.mapZ);
                                                    _local_2 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ - Constants.WALK_SIZE));
                                                    if (((!(_local_1)) && (!(_local_2)))){
                                                        _local_4 = this.scene.isWalkable(this.target.mapX, (this.target.mapZ + Constants.WALK_SIZE));
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
                                                            if (_local_13 > 400){
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
            this.hasAvoided = true;
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
            this.hasAvoided = false;
            this.hasChased = false;
            this.tempZKey = null;
            this.tempXKey = null;
            this.target = null;
            this.scene = null;
            this.aimElement = null;
        }

        public /*  ©init. */ function _SafeStr_759()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai

// _SafeStr_759 = " AI3DAvoidElement" (String#14438)



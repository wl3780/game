// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ai.AIFindElement

package com.tencent.ai.core.monster.ai
{
    import com.tencent.ai.core.element.InteractElement;
    import com.tencent.ai.core.combat.ICombatScene;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.combat.Battle;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.manager.data.DEFINE;
    import  ©init._SafeStr_763;
    import __AS3__.vec.*;

    public class AIFindElement 
    {

        public var target:InteractElement;
        public var sightLineRR:int;
        public var scene:ICombatScene;
        public var resDis2:int = 2147483647;
        public var resElement:InteractElement;
        public var resElementList:Vector.<InteractElement>;
        public var monsterIQ:int;
        public var isFlyMonster:Boolean = false;


        public function findElementAtDis(_arg_1:int, _arg_2:int):void
        {
            var _local_8:InteractElement;
            var _local_9:int;
            var _local_10:int;
            this.resElement = null;
            this.resDis2 = -1;
            if (_arg_1 == 0){
                _arg_1 = this.sightLineRR;
            };
            var _local_3:Vector.<InteractElement> = Battle.Current.getGroup(_arg_2);
            if (_local_3 == null){
                return;
            };
            var _local_4:int = _local_3.length;
            var _local_5:int = this.target.mapX;
            var _local_6:int = this.target.mapZ;
            var _local_7:int;
            while (_local_7 < _local_4) {
                _local_8 = _local_3[_local_7];
                _local_9 = (_local_8.mapX - _local_5);
                _local_10 = (_local_8.mapZ - _local_6);
                if (((_local_9 * _local_9) + (_local_10 * _local_10)) < _arg_1){
                    this.resElement = _local_8;
                    this.resElementList = new Vector.<InteractElement>();
                    this.resElementList.push(this.resElement);
                    return;
                };
                _local_7++;
            };
        }

        public function findElementNearest(_arg_1:int, _arg_2:int):void
        {
            var _local_8:InteractElement;
            var _local_9:int;
            var _local_10:int;
            var _local_11:int;
            this.resElement = null;
            if ((this.target.getAIComponent() as IMonsterBrain).getRageNum() <= 0){
                this.resDis2 = (((_arg_1)!=0) ? _arg_1 : this.sightLineRR);
            } else {
                this.resDis2 = int.MAX_VALUE;
            };
            var _local_3:Vector.<InteractElement> = Battle.Current.getGroup(_arg_2);
            if (_local_3 == null){
                return;
            };
            var _local_4:int = _local_3.length;
            var _local_5:int = this.target.mapX;
            var _local_6:int = this.target.mapZ;
            var _local_7:int;
            while (_local_7 < _local_4) {
                _local_8 = _local_3[_local_7];
                _local_9 = (_local_8.mapX - _local_5);
                _local_10 = (_local_8.mapZ - _local_6);
                _local_11 = ((_local_9 * _local_9) + (_local_10 * _local_10));
                if ((((((((((((((_local_11 <= this.resDis2)) && (!((_local_8.getType() == ElementType.ET_INTERACT))))) && (!((_local_8.getType() == ElementType.ET_ARROW))))) && (!((_local_8.getType() == ElementType.ET_EFFECT))))) && (!((_local_8.getType() == ElementType.ET_MOVIE))))) && (!((_local_8.getType() == ElementType.ET_NORMALITEM))))) && (!((_local_8.getType() == ElementType.ET_SHADOW))))){
                    if (_local_8.getIsDead() == false){
                        this.resElement = _local_8;
                        this.resDis2 = _local_11;
                    };
                };
                _local_7++;
            };
            this.resElementList = new Vector.<InteractElement>();
            this.resElementList.push(this.resElement);
        }

        public function findElementRandom(_arg_1:int, _arg_2:int):void
        {
            var _local_10:InteractElement;
            var _local_11:int;
            var _local_12:int;
            var _local_13:int;
            var _local_14:InteractElement;
            var _local_15:Number;
            this.resElement = null;
            this.resDis2 = (((_arg_1)!=0) ? _arg_1 : this.sightLineRR);
            var _local_3:Vector.<InteractElement> = Battle.Current.getGroup(_arg_2);
            if (_local_3 == null){
                return;
            };
            var _local_4:Vector.<InteractElement> = new Vector.<InteractElement>();
            var _local_5:int = _local_3.length;
            var _local_6:int = this.target.mapX;
            var _local_7:int = this.target.mapZ;
            var _local_8:int;
            while (_local_8 < _local_5) {
                _local_10 = _local_3[_local_8];
                _local_11 = (_local_10.mapX - _local_6);
                _local_12 = (_local_10.mapZ - _local_7);
                _local_13 = ((_local_11 * _local_11) + (_local_12 * _local_12));
                if (_local_13 <= this.resDis2){
                    _local_4.push(_local_10);
                };
                _local_8++;
            };
            _local_5 = _local_4.length;
            if (_local_5 == 0){
                return;
            };
            var _local_9:int;
            while (_local_9 < _local_5) {
                _local_14 = _local_4[_local_9];
                _local_15 = (DEFINE.RANDOM_FLOAT() * _local_5);
                if (_local_15 <= 1){
                    this.resElement = _local_14;
                    this.resElementList = new Vector.<InteractElement>();
                    this.resElementList.push(this.resElement);
                    return;
                };
                _local_9++;
            };
            this.resElement = _local_4[0];
            this.resElementList = new Vector.<InteractElement>();
            this.resElementList.push(this.resElement);
        }

        public function findAllInDis(_arg_1:int, _arg_2:int):void
        {
            var _local_9:InteractElement;
            var _local_10:int;
            var _local_11:int;
            var _local_12:int;
            this.resElement = null;
            this.resDis2 = (((_arg_1)!=0) ? _arg_1 : this.sightLineRR);
            var _local_3:Vector.<InteractElement> = Battle.Current.getGroup(_arg_2);
            if (_local_3 == null){
                return;
            };
            var _local_4:Vector.<InteractElement> = new Vector.<InteractElement>();
            var _local_5:int = _local_3.length;
            var _local_6:int = this.target.mapX;
            var _local_7:int = this.target.mapZ;
            var _local_8:int;
            while (_local_8 < _local_5) {
                _local_9 = _local_3[_local_8];
                _local_10 = (_local_9.mapX - _local_6);
                _local_11 = (_local_9.mapZ - _local_7);
                _local_12 = ((_local_10 * _local_10) + (_local_11 * _local_11));
                if (_local_12 <= this.resDis2){
                    _local_4.push(_local_9);
                };
                _local_8++;
            };
            this.resElementList = new Vector.<InteractElement>();
            this.resElementList = _local_4;
        }

        public function findAll(_arg_1:int):void
        {
            var _local_8:InteractElement;
            var _local_9:int;
            var _local_10:int;
            var _local_11:int;
            this.resElement = null;
            var _local_2:Vector.<InteractElement> = Battle.Current.getGroup(_arg_1);
            if (_local_2 == null){
                return;
            };
            var _local_3:int = _local_2.length;
            var _local_4:int = this.target.mapX;
            var _local_5:int = this.target.mapZ;
            var _local_6 = 10000000;
            var _local_7:int;
            while (_local_7 < _local_3) {
                _local_8 = _local_2[_local_7];
                _local_9 = (_local_8.mapX - _local_4);
                _local_10 = (_local_8.mapZ - _local_5);
                _local_11 = ((_local_9 * _local_9) + (_local_10 * _local_10));
                if (_local_11 < _local_6){
                    this.resElement = _local_8;
                    _local_6 = _local_11;
                };
                _local_7++;
            };
            this.resElementList = new Vector.<InteractElement>();
            this.resElementList.push(this.resElement);
        }

        public function hasAim():Boolean
        {
            return (!((this.resElement == null)));
        }

        public function reset():void
        {
            this.scene = null;
            this.resElement = null;
            this.resElementList = null;
            this.resDis2 = 0;
            this.target = null;
            this.scene = null;
        }

        public /*  ©init. */ function _SafeStr_763()
        {
        }


    }
}//package com.tencent.ai.core.monster.ai

// _SafeStr_763 = " AIFindElement" (String#14909)



// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.impl.BaseMonsterFactory

package com.tencent.ai.core.monster.impl
{
    import com.tencent.ai.core.monster.IMonsterFactory;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.monster.BaseMonster;
    import  ©init._SafeStr_778;
    import __AS3__.vec.*;

    public class BaseMonsterFactory implements IMonsterFactory 
    {

        protected var monsterType:int;
        protected var monsterCls:Class;
        protected var monsterPools:Vector.<BaseMonster>;

        public function BaseMonsterFactory(_arg_1:int, _arg_2:Class)
        {
            this.monsterType = _arg_1;
            this.monsterCls = _arg_2;
            this.initThis();
        }

        protected function initThis():void
        {
            if (this.monsterCls == null){
                throw (new Error("[BaseMonsterFactory] monsterCls不能为空!"));
            };
            this.monsterPools = new Vector.<BaseMonster>();
        }

        protected function createMonster(_arg_1:Object):BaseMonster
        {
            return ((new this.monsterCls() as BaseMonster));
        }

        public function getMonsterType():int
        {
            return (this.monsterType);
        }

        public function getMonsterClass():Class
        {
            return (this.monsterCls);
        }

        public function newMonster(_arg_1:Object):BaseMonster
        {
            if (this.monsterPools.length != 0){
                return (this.monsterPools.pop());
            };
            return (this.createMonster(_arg_1));
        }

        public function returnMonster(_arg_1:BaseMonster):void
        {
            _arg_1.reset();
            this.monsterPools.push(_arg_1);
        }

        public function dispose():void
        {
        }

        public /*  ©init. */ function _SafeStr_778()
        {
        }


    }
}//package com.tencent.ai.core.monster.impl

// _SafeStr_778 = " BaseMonsterFactory" (String#14090)



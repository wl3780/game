// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.pet.impl.BasePetFactory

package com.tencent.ai.core.pet.impl
{
    import com.tencent.ai.core.pet.IPetFactory;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.pet.BasePet;
    import  ©init._SafeStr_821;
    import __AS3__.vec.*;

    public class BasePetFactory implements IPetFactory 
    {

        protected var petType:int;
        protected var petCls:Class;
        protected var petPools:Vector.<BasePet>;

        public function BasePetFactory(_arg_1:int, _arg_2:Class)
        {
            this.petType = _arg_1;
            this.petCls = _arg_2;
            this.initThis();
        }

        protected function initThis():void
        {
            if (this.petCls == null){
                throw (new Error("[BasePetFactory] petCls不能为空!"));
            };
            this.petPools = new Vector.<BasePet>();
        }

        protected function createPet(_arg_1:Object):BasePet
        {
            return ((new this.petCls() as BasePet));
        }

        public function getPetType():int
        {
            return (this.petType);
        }

        public function getPetClass():Class
        {
            return (this.petCls);
        }

        public function newPet(_arg_1:Object):BasePet
        {
            if (this.petPools.length != 0){
                return (this.petPools.pop());
            };
            return (this.createPet(_arg_1));
        }

        public function returnPet(_arg_1:BasePet):void
        {
            _arg_1.reset();
            this.petPools.push(_arg_1);
        }

        public function dispose():void
        {
        }

        public /*  ©init. */ function _SafeStr_821()
        {
        }


    }
}//package com.tencent.ai.core.pet.impl

// _SafeStr_821 = " BasePetFactory" (String#15236)



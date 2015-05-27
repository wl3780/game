// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.pet.IPetFactory

package com.tencent.ai.core.pet
{
    public interface IPetFactory 
    {

        function dispose():void;
        function getPetClass():Class;
        function getPetType():int;
        function newPet(_arg_1:Object):BasePet;
        function returnPet(_arg_1:BasePet):void;

    }
}//package com.tencent.ai.core.pet


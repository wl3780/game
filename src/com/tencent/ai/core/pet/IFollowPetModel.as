// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.pet.IFollowPetModel

package com.tencent.ai.core.pet
{
    import flash.events.IEventDispatcher;
    import com.tencent.ai.core.data.PetInfo;

    public interface IFollowPetModel extends IEventDispatcher 
    {

        function bindModel(_arg_1:PetModel):void;
        function unbindModel():void;
        function getBindModel():PetModel;
        function setPetInfo(_arg_1:PetInfo):void;
        function getPetInfo():PetInfo;
        function updateEvent():void;
        function getDHP():int;
        function setDHP(_arg_1:int):void;
        function getIsDead():Boolean;

    }
}//package com.tencent.ai.core.pet


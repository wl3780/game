// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.pet.IPetManager

package com.tencent.ai.core.pet
{
    import com.tencent.ai.core.scene.IElementFactory;
    import com.tencent.ai.core.data.PetInfo;
    import com.tencent.ai.core.data.PlayerID;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.scene.IScene;

    public interface IPetManager extends IElementFactory 
    {

        function set isAIRun(_arg_1:Boolean):void;
        function get isAIRun():Boolean;
        function get followPetModel():IFollowPetModel;
        function addPet(_arg_1:PetInfo):BasePet;
        function removePetByPlayer(_arg_1:PlayerID):void;
        function removePet2(_arg_1:PetInfo):void;
        function getPets():Vector.<BasePet>;
        function indexOfPet(_arg_1:uint):int;
        function getPetByInfo(_arg_1:PetInfo):BasePet;
        function registerCachePetInfos(_arg_1:Vector.<PetInfo>):void;
        function getCachePetInfoByPlayer(_arg_1:PlayerID):PetInfo;
        function removeCachePetInfoByPlayer(_arg_1:PlayerID):Boolean;
        function getPetByPlayer(_arg_1:PlayerID):BasePet;
        function bindScene(_arg_1:IScene, _arg_2:Vector.<PetInfo>):void;
        function updatePetHP(_arg_1:PlayerID, _arg_2:int):void;
        function updatePetHP2(_arg_1:PlayerID, _arg_2:Number):void;
        function getBindScene():IScene;
        function unbind():void;
        function clear():void;
        function dispose():void;

    }
}//package com.tencent.ai.core.pet


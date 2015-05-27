// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.pet.IPetSystem

package com.tencent.ai.core.pet
{
    import com.tencent.ai.core.data.PetStaticInfo;
    import com.tencent.free.core.lib.CLASS;

    public interface IPetSystem 
    {

        function newFactory(_arg_1:PetStaticInfo, _arg_2:CLASS):void;
        function getFactory(_arg_1:int):IPetFactory;
        function disposeFactory(_arg_1:int):void;
        function getResource():IPetAssetManager;
        function newManager(_arg_1:Class=null):IPetManager;
        function getPetModelManager():IFollowPetModel;

    }
}//package com.tencent.ai.core.pet


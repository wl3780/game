// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.sound.ISoundAssetManager

package com.tencent.ai.core.sound
{
    import com.tencent.ai.core.sound.res.SoundAsset;
    import flash.media.Sound;

    public interface ISoundAssetManager 
    {

        function getSoundAsset(_arg_1:int, _arg_2:Object):SoundAsset;
        function getSoundAssets(_arg_1:int):Array;
        function disposeSoundAsset(_arg_1:SoundAsset, _arg_2:Object):void;
        function getSound(_arg_1:int, _arg_2:int, _arg_3:int):Sound;

    }
}//package com.tencent.ai.core.sound


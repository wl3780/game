// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.sound.ISoundManager

package com.tencent.ai.core.sound
{
    public interface ISoundManager 
    {

        function stop(_arg_1:int):void;
        function stopSoundPackage(_arg_1:int):void;
        function play(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int=100, _arg_5:int=0, _arg_6:ISoundSource=null, _arg_7:Boolean=false):int;
        function setEffectVolume(_arg_1:int):void;
        function getEffectVolume():int;
        function setMp3Volume(_arg_1:int):void;
        function getMp3Volume():int;
        function setPlayVolume(_arg_1:int, _arg_2:int):void;
        function getResource():ISoundAssetManager;
        function playMp3(_arg_1:Object, _arg_2:String, _arg_3:Boolean=false, _arg_4:Boolean=true):void;
        function disposeRef(_arg_1:Object):void;
        function disposeMp3(_arg_1:Object, _arg_2:String):void;
        function exsitMp3(_arg_1:Object, _arg_2:String):Boolean;
        function get mp3PlayManager():Mp3PlayManager;

    }
}//package com.tencent.ai.core.sound


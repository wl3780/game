// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.sound.ISoundFile

package com.tencent.ai.core.manager.sound
{
    import com.tencent.free.core.manager.content.IContent;
    import flash.media.Sound;

    public interface ISoundFile extends IContent 
    {

        function getSoundByClass(_arg_1:String):Sound;

    }
}//package com.tencent.ai.core.manager.sound


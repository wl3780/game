// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ISegmentAssetManager

package com.tencent.ai.core.monster
{
    import com.tencent.ai.core.monster.res.SegmentAsset;

    public interface ISegmentAssetManager 
    {

        function getSegmentAsset(_arg_1:String, _arg_2:Object):SegmentAsset;
        function returnSegmentAsset(_arg_1:SegmentAsset, _arg_2:Object):void;

    }
}//package com.tencent.ai.core.monster


// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.IBinaryConfig

package com.tencent.ai.core.manager.data
{
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;

    public interface IBinaryConfig 
    {

        function clearConfig():void;
        function readConfig(_arg_1:IDataInput):void;
        function writeConfig(_arg_1:IDataOutput):void;
        function getVersion():uint;

    }
}//package com.tencent.ai.core.manager.data


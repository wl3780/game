package com.tencent.ai.core.utils
{
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;

    public interface ISerialize 
    {

        function read(data:IDataInput):void;
        function write(data:IDataOutput):void;

    }
}

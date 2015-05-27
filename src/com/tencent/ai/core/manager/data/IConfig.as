// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.IConfig

package com.tencent.ai.core.manager.data
{
    public interface IConfig extends IBinaryConfig 
    {

        function parse(_arg_1:Object):Boolean;
        function find(_arg_1:*):Object;
        function findAll():Object;

    }
}//package com.tencent.ai.core.manager.data


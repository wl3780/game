// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.manager.IManager

package com.tencent.free.core.manager
{
    import com.tencent.free.core.manager.loader.ILoader;
    import com.tencent.free.core.manager.content.IContent;

    public interface IManager 
    {

        function request(_arg_1:ILoader):Object;
        function release(_arg_1:ILoader):void;
        function getContent(_arg_1:ILoader):IContent;
        function clearAllCache():void;

    }
}//package com.tencent.free.core.manager


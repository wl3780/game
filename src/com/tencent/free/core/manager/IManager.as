package com.tencent.free.core.manager
{
    import com.tencent.free.core.manager.content.IContent;
    import com.tencent.free.core.manager.loader.ILoader;

    public interface IManager 
    {

        function request(_arg_1:ILoader):Object;
        function release(_arg_1:ILoader):void;
        function getContent(_arg_1:ILoader):IContent;
        function clearAllCache():void;

    }
}

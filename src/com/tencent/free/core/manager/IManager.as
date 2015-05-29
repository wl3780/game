package com.tencent.free.core.manager
{
    import com.tencent.free.core.manager.content.IContent;
    import com.tencent.free.core.manager.loader.ILoader;

    public interface IManager 
    {

        function request(loader:ILoader):Object;
        function release(loader:ILoader):void;
        function getContent(loader:ILoader):IContent;
        function clearAllCache():void;

    }
}

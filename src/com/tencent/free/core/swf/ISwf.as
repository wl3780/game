package com.tencent.free.core.swf
{
    import com.tencent.free.core.manager.content.IContent;
    
    import flash.display.DisplayObject;
    import flash.system.LoaderContext;

    public interface ISwf extends IContent 
    {

        function getContent():DisplayObject;
        function getLoaderContext():LoaderContext;

    }
}

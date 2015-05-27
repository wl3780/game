// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.swf.ISwf

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
}//package com.tencent.free.core.swf


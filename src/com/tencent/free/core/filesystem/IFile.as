package com.tencent.free.core.filesystem
{
    import com.tencent.free.core.manager.content.IContent;
    
    import flash.utils.ByteArray;

    public interface IFile extends IContent 
    {

        function get bytes():ByteArray;

    }
}


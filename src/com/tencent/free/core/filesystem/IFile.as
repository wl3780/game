// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.filesystem.IFile

package com.tencent.free.core.filesystem
{
    import com.tencent.free.core.manager.content.IContent;
    import flash.utils.ByteArray;

    public interface IFile extends IContent 
    {

        function get bytes():ByteArray;

    }
}//package com.tencent.free.core.filesystem


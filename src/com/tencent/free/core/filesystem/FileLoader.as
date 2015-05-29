package com.tencent.free.core.filesystem
{
    import com.tencent.free.core.filesystem.impl.FileSystem;
    import com.tencent.free.core.manager.loader.BaseLoader;

    public class FileLoader extends BaseLoader 
    {

        public function FileLoader(loadKey:String)
        {
            super(loadKey, FileSystem.getInstance());
        }

    }
}

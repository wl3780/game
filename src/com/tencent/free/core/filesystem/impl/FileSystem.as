package com.tencent.free.core.filesystem.impl
{
    import com.tencent.free.core.manager.Manager;
    
    import flash.net.URLStream;

    public class FileSystem extends Manager 
    {

        public static var g_Max_Simultaneous_Task_Number:int = 2;
        private static var g_Instance:FileSystem;

        private var _totalBytes:int;

        public function FileSystem(taskType:Class, taskNum:int=1, loader:Class=null)
        {
            super(taskType, taskNum, loader);
        }

        public static function getInstance():FileSystem
        {
            if (g_Instance == null) {
                g_Instance = new FileSystem(File, g_Max_Simultaneous_Task_Number, URLStream);
            }
            return g_Instance;
        }


        public function addBytes(num:int):void
        {
            _totalBytes = _totalBytes + num;
        }

        public function removeBytes(num:int):void
        {
            _totalBytes = _totalBytes - num;
        }

        public function get totalBytes():int
        {
            return _totalBytes;
        }

        public function clearBytes():void
        {
            _totalBytes = 0;
        }

    }
}

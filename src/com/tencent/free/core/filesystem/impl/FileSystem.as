// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.filesystem.impl.FileSystem

package com.tencent.free.core.filesystem.impl
{
    import com.tencent.free.core.manager.Manager;
    import flash.net.URLStream;
    import  ©init._SafeStr_11;

    public class FileSystem extends Manager 
    {

        private static var g_Instance:FileSystem;
        public static var g_Max_Simultaneous_Task_Number:int = 2;

        private var _totalBytes:int;

        public function FileSystem(_arg_1:Class, _arg_2:int=1, _arg_3:Class=null)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        public static function getInstance():FileSystem
        {
            if (g_Instance == null){
                g_Instance = new (FileSystem)(File, g_Max_Simultaneous_Task_Number, URLStream);
            };
            return (g_Instance);
        }


        public function addBytes(_arg_1:int):void
        {
            this._totalBytes = (this._totalBytes + _arg_1);
        }

        public function removeBytes(_arg_1:int):void
        {
            this._totalBytes = (this._totalBytes - _arg_1);
        }

        public function get totalBytes():int
        {
            return (this._totalBytes);
        }

        public function clearBytes():void
        {
            this._totalBytes = 0;
        }

        public /*  ©init. */ function _SafeStr_11()
        {
        }


    }
}//package com.tencent.free.core.filesystem.impl

// _SafeStr_11 = " FileSystem" (String#1421)



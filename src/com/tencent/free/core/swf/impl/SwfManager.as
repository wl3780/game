package com.tencent.free.core.swf.impl
{
    import com.tencent.free.core.manager.Manager;

    public class SwfManager extends Manager 
    {

        public static var g_Max_Simultaneous_Task_Number:int = 4;
        private static var g_Instance:SwfManager;

        public function SwfManager(taskType:Class, taskNum:int=1, loader:Class=null)
        {
            super(taskType, taskNum, loader);
        }

        public static function getInstance():SwfManager
        {
            if (g_Instance == null) {
                g_Instance = new SwfManager(SwfFile, g_Max_Simultaneous_Task_Number, SwfFileDecoder);
            }
            return g_Instance;
        }

    }
}

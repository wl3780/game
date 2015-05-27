// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.sound.impl.SoundFileManager

package com.tencent.ai.core.manager.sound.impl
{
    import com.tencent.free.core.manager.Manager;
    import  ©init._SafeStr_681;

    public class SoundFileManager extends Manager 
    {

        private static var g_Instance:SoundFileManager;
        public static var g_Max_Simultaneous_Task_Number:int = 1;

        public function SoundFileManager(_arg_1:Class, _arg_2:int=1, _arg_3:Class=null)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        public static function getInstance():SoundFileManager
        {
            if (g_Instance == null){
                g_Instance = new (SoundFileManager)(SoundFile, g_Max_Simultaneous_Task_Number, null);
            };
            return (g_Instance);
        }


        public /*  ©init. */ function _SafeStr_681()
        {
        }


    }
}//package com.tencent.ai.core.manager.sound.impl

// _SafeStr_681 = " SoundFileManager" (String#14210)



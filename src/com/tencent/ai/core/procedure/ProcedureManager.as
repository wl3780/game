// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.procedure.ProcedureManager

package com.tencent.ai.core.procedure
{
    import flash.utils.Dictionary;
    import com.tencent.ai.core.procedure.impl.Procedure;
    import com.tencent.ai.core.data.ProcedureInfo;
    import  ©init._SafeStr_856;

    public class ProcedureManager 
    {

        private static var g_Instance:ProcedureManager;
        private static var g_tempID:uint;

        protected var m_procedureList:Dictionary;
        protected var m_procedureType:Dictionary;

        public function ProcedureManager()
        {
            this.m_procedureList = new Dictionary();
            this.m_procedureType = new Dictionary();
            this.m_procedureType["common"] = Procedure;
        }

        public static function getInstance():ProcedureManager
        {
            if (g_Instance == null){
                g_Instance = new (ProcedureManager)();
            };
            return (g_Instance);
        }


        public function createProcedure(_arg_1:ProcedureInfo, _arg_2:Object=null):IProcedure
        {
            var _local_3:IProcedure;
            var _local_4:Class = this.m_procedureType[_arg_1.type];
            if (_local_4){
                _local_3 = new (_local_4)();
            };
            return (_local_3);
        }

        public function removeProcedure(_arg_1:uint):void
        {
            var _local_2:IProcedure = this.m_procedureList[_arg_1];
            if (null != _local_2){
            };
        }

        public function getProcedure(_arg_1:Procedure):IProcedure
        {
            return (this.m_procedureList[_arg_1]);
        }

        public function activateProcedure(_arg_1:uint):Boolean
        {
            var _local_2:IProcedure = this.m_procedureList[_arg_1];
            if (_local_2){
                return (_local_2.activate());
            };
            return (false);
        }

        public function deactivateProcedure(_arg_1:uint):Boolean
        {
            var _local_2:IProcedure = this.m_procedureList[_arg_1];
            if (_local_2){
                return (_local_2.deactivate());
            };
            return (false);
        }

        public /*  ©init. */ function _SafeStr_856()
        {
        }


    }
}//package com.tencent.ai.core.procedure

// _SafeStr_856 = " ProcedureManager" (String#15107)



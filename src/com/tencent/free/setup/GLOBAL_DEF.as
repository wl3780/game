package com.tencent.free.setup
{
    import com.tencent.free.setup.data.VarDef;
    
    import flash.utils.Dictionary;

    public class GLOBAL_DEF 
    {

        public static const CONFIG_SERVER_INFO:String = "ServerInfo";
        public static const CONFIG_DEFINE:String = "DEFINE";
        public static const CONFIG_CONFS:String = "Confs";
        public static const CONFIG_FLASH_VARS:String = "flashVars";
        public static const CONFIG_CLASSES:String = "classes";
        public static const FLASH_VARS_DEBUGGER:String = "debugger";
        public static const FLASH_VARS_GLOBAL_URL:String = "globalURL";
        public static const VALUE_TYPE_FLASHVARS:String = "flashvars";
        public static const VALUE_TYPE_DEFAULT:String = "default";
        private static var _VAR_DEFs:Vector.<VarDef> = new Vector.<VarDef>();
        private static var _VAR_DEFS_MAP:Dictionary = new Dictionary();


        public static function DEFINE(_arg_1:String, _arg_2:String):void
        {
            if (_VAR_DEFS_MAP[_arg_1] == undefined){
                _VAR_DEFS_MAP[_arg_1] = _arg_2;
                _VAR_DEFs.push(new VarDef(_arg_1, _arg_2));
            }
        }

        public static function UNDEFINE(_arg_1:String):String
        {
            var _local_2:String = _VAR_DEFS_MAP[_arg_1];
            delete _VAR_DEFS_MAP[_arg_1];
            var _local_3:int;
            while (_local_3 < _VAR_DEFs.length) {
                if (_VAR_DEFs[_local_3].key == _arg_1){
                    _VAR_DEFs.splice(_local_3, 1);
                    break;
                }
                _local_3++;
            }
            return (_local_2);
        }

        public static function GET(_arg_1:String):String
        {
            return (_VAR_DEFS_MAP[_arg_1]);
        }

        public static function REPLACE(_arg_1:String):String
        {
            var _local_4:VarDef;
            var _local_2:int = (((_VAR_DEFs == null)) ? 0 : _VAR_DEFs.length);
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = _VAR_DEFs[_local_3];
                _arg_1 = _local_4.replace(_arg_1);
                _local_3++;
            }
            return (_arg_1);
        }

    }
}

package com.tencent.ai.core.func
{
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.combat.ICombatSystem;
    import com.tencent.ai.core.data.SpecialFuncInfo;
    import com.tencent.ai.core.func.impl.BaseSpecialFunc;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.manager.data.IDataManager;
    
    import flash.utils.Dictionary;

    public class SpecialFuncManager implements ISpecialFuncManager 
    {

        static var SF_CLS_MAP:Dictionary;
        private static var _INSTANCE:SpecialFuncManager;

        protected var combatsys:ICombatSystem;
        protected var data:IDataManager;


        public static function getInstance():SpecialFuncManager
        {
            if (_INSTANCE == null){
                _INSTANCE = new (SpecialFuncManager)();
            };
            return (_INSTANCE);
        }


        public function initialize(_arg_1:ICombatSystem):void
        {
            this.combatsys = _arg_1;
            this.data = AICore.data;
        }

        public function applyFunc(_arg_1:Object, _arg_2:int, _arg_3:String=null, _arg_4:Object=null):void
        {
            var _local_5:SpecialFuncInfo = this.data.getSpecialFuncInfo(_arg_2);
            if (((!((_arg_3 == null))) && (!((_arg_3 == _local_5.execArg))))){
                return;
            };
            if (!(DEFINE.RANDOM_FLOAT() < _local_5.probability)){
                return;
            };
            var _local_6:Class = SF_CLS_MAP[_local_5.funcID];
            var _local_7:BaseSpecialFunc = (new (_local_6)() as BaseSpecialFunc);
            _local_7.setRTParams(_arg_4);
            _local_7.setInfo(_local_5);
            _local_7.setTarget(_arg_1);
            _local_7.execute();
        }

        public function applyFuncArray(_arg_1:Object, _arg_2:Array, _arg_3:String=null, _arg_4:Object=null):void
        {
            var _local_5:int = _arg_2.length;
            var _local_6:int;
            while (_local_6 < _local_5) {
                this.applyFunc(_arg_1, int(_arg_2[_local_6]), _arg_3, _arg_4);
                _local_6++;
            };
        }

    }
}

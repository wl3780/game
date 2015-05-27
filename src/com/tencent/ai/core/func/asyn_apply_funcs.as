// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.func.asyn_apply_funcs

package com.tencent.ai.core.func
{
    import com.tencent.ai.core.AICore;
    import com.tencent.free.utils.CFunction;
    import com.tencent.ai.core.exec_behind_frame;

    public function asyn_apply_funcs(_arg_1:Object, _arg_2:Array, _arg_3:String=null, _arg_4:Object=null):void
    {
        if ((((((_arg_1 == null)) || ((_arg_2 == null)))) || ((_arg_2.length == 0)))){
            return;
        };
        var _local_5:ISpecialFuncManager = AICore.combatSystem.getSpecialFuncManager();
        var _local_6:CFunction = new CFunction(_local_5.applyFuncArray, _local_5, [_arg_1, _arg_2, _arg_3, _arg_4]);
        exec_behind_frame(_local_6);
    }

}//package com.tencent.ai.core.func


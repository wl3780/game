// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.exec_behind_frame2

package com.tencent.ai.core
{
    import com.tencent.ai.core.combat.Battle;
    import com.tencent.free.utils.CFunction;

    public function exec_behind_frame2(_arg_1:Function, _arg_2:Object=null, _arg_3:Array=null):void
    {
        Battle.Current.execBehindFrame(new CFunction(_arg_1, _arg_2, _arg_3));
    }

}//package com.tencent.ai.core


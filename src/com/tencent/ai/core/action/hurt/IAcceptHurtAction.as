// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.action.hurt.IAcceptHurtAction

package com.tencent.ai.core.action.hurt
{
    import com.tencent.ai.core.action.IElementAction;
    import com.tencent.ai.core.script.ITarget;
    import com.tencent.ai.core.data.AttackInfo;

    public interface IAcceptHurtAction extends IElementAction, ITarget 
    {

        function onNextState(_arg_1:int, _arg_2:AttackInfo):void;

    }
}//package com.tencent.ai.core.action.hurt


package com.tencent.ai.core.action.hurt
{
    import com.tencent.ai.core.action.IElementAction;
    import com.tencent.ai.core.data.AttackInfo;
    import com.tencent.ai.core.script.ITarget;

    public interface IAcceptHurtAction extends IElementAction, ITarget 
    {

        function onNextState(_arg_1:int, _arg_2:AttackInfo):void;

    }
}

package com.tencent.ai.core.action
{
    import com.tencent.ai.core.data.AttackInfo;
    import com.tencent.ai.core.scene.IScene;

    public interface IElementAction 
    {

        function switchToDead():Boolean;
        function beHurt(_arg_1:AttackInfo):Boolean;
        function setScene(_arg_1:IScene):void;
        function attach(_arg_1:Object):void;
        function exec(_arg_1:int, _arg_2:Object=null):void;
        function isRuning():Boolean;
        function stop():void;
        function getActionID():int;
        function getActionType():int;

    }
}

package com.tencent.ai.core.manager.key
{
    public interface IKeyFilter 
    {

        function onKeyDown(keyArr:IKeyArray, keyBoard:IKeyboard):Boolean;
        function onKeyUp(keyArr:IKeyArray, keyBoard:IKeyboard):Boolean;
        function getGroupID():int;
        function getMatchLen():int;
        function getCheckType():int;

    }
}

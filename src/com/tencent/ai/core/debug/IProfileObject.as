package com.tencent.ai.core.debug
{
    public interface IProfileObject 
    {

        function visit(visitor:IProfileVisitor):void;

    }
}

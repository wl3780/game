package com.tencent.ai.core.manager.key
{

    public interface IKeyArray 
    {

        function getCurrentKey():int;
        function getUpKeys():Vector.<int>;
        function getDownKeys():Vector.<int>;
        function getAllKeys():Vector.<int>;

    }
}

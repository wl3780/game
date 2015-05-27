// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.IMonsterFactory

package com.tencent.ai.core.monster
{
    public interface IMonsterFactory 
    {

        function getMonsterType():int;
        function getMonsterClass():Class;
        function newMonster(_arg_1:Object):BaseMonster;
        function returnMonster(_arg_1:BaseMonster):void;
        function dispose():void;

    }
}//package com.tencent.ai.core.monster


// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.IMonsterManager

package com.tencent.ai.core.monster
{
    import com.tencent.ai.core.scene.IElementFactory;
    import com.tencent.ai.core.data.MonsterInfo;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.scene.IScene;

    public interface IMonsterManager extends IElementFactory 
    {

        function set isAIRun(_arg_1:Boolean):void;
        function get isAIRun():Boolean;
        function serverMonsterDead(_arg_1:int):void;
        function isEmpty(_arg_1:int=0):Boolean;
        function addMonster(_arg_1:MonsterInfo):BaseMonster;
        function removeMonster(_arg_1:uint):void;
        function getMonsters():Vector.<BaseMonster>;
        function indexOfMonster(_arg_1:uint):int;
        function getMonsterByID(_arg_1:uint):BaseMonster;
        function removeSpcialGroupMonster(_arg_1:int, _arg_2:int):void;
        function bindScene(_arg_1:IScene, _arg_2:Vector.<MonsterInfo>):void;
        function getBindScene():IScene;
        function unbind():void;
        function clear():void;
        function dispose():void;

    }
}//package com.tencent.ai.core.monster


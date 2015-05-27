// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.combat.IAttackListener

package com.tencent.ai.core.combat
{
    import com.tencent.ai.core.data.AttackInfo;
    import flash.geom.Point;

    public interface IAttackListener 
    {

        function onAttack(_arg_1:AttackInfo, _arg_2:Point, _arg_3:int):void;

    }
}//package com.tencent.ai.core.combat


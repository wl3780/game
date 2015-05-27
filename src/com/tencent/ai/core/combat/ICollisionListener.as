// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.combat.ICollisionListener

package com.tencent.ai.core.combat
{
    import com.tencent.ai.core.element.InteractElement;
    import com.tencent.ai.core.data.HitArea;

    public interface ICollisionListener 
    {

        function onCollision(_arg_1:InteractElement, _arg_2:HitArea, _arg_3:int):Boolean;

    }
}//package com.tencent.ai.core.combat


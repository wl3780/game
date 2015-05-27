// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.interact.impl.AbstractInteractItemFactory

package com.tencent.ai.core.interact.impl
{
    import com.tencent.ai.core.interact.IInteractItemFactory;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.interact.BaseInteractItem;
    import  ©init._SafeStr_572;
    import __AS3__.vec.*;

    public class AbstractInteractItemFactory implements IInteractItemFactory 
    {

        protected var interactItemType:int;
        protected var interactItemCls:Class;
        protected var interactItemPools:Vector.<BaseInteractItem>;

        public function AbstractInteractItemFactory(_arg_1:int, _arg_2:Class)
        {
            this.interactItemType = _arg_1;
            this.interactItemCls = _arg_2;
            this.initThis();
        }

        protected function initThis():void
        {
            if (this.interactItemCls == null){
                throw (new Error("[BaseInteractItemFactory] interactItemCls不能为空!"));
            };
            this.interactItemPools = new Vector.<BaseInteractItem>();
        }

        protected function createInteractItem(_arg_1:Object):BaseInteractItem
        {
            return ((new this.interactItemCls() as BaseInteractItem));
        }

        public function getInteractItemType():int
        {
            return (this.interactItemType);
        }

        public function getInteractItemClass():Class
        {
            return (this.interactItemCls);
        }

        public function newInteractItem(_arg_1:Object):BaseInteractItem
        {
            if (this.interactItemPools.length != 0){
                return (this.interactItemPools.pop());
            };
            return (this.createInteractItem(_arg_1));
        }

        public function returnInteractItem(_arg_1:BaseInteractItem):void
        {
            _arg_1.reset();
            this.interactItemPools.push(_arg_1);
        }

        public function dispose():void
        {
        }

        public /*  ©init. */ function _SafeStr_572()
        {
        }


    }
}//package com.tencent.ai.core.interact.impl

// _SafeStr_572 = " AbstractInteractItemFactory" (String#15125)



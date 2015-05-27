// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.HitArea

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.RectArea;
    import com.tencent.ai.core.actor.HasActionElement;
    import com.tencent.ai.core.element.InteractElement;
    import com.tencent.ai.core.enum.Direction;
    import  ©init._SafeStr_259;

    public class HitArea 
    {

        public var groupID:int;
        public var x:int;
        public var y:int;
        public var width:int;
        public var height:int;
        public var mapX:int;
        public var mapZ:int;
        public var mapY:int;
        public var dz:int;
        public var dir:int;
        public var hasHitLoc:Boolean = true;
        public var hitLocation:MapPosition;
        public var attachObj:Object;
        public var isMain:Boolean = false;
        private var _fixDir:int = 0;

        public function HitArea()
        {
            this.hitLocation = new MapPosition();
            super();
        }

        public function visit(_arg_1:InteractElement, _arg_2:int=-1, _arg_3:RectArea=null, _arg_4:int=0):void
        {
            var _local_5:RectArea = _arg_3;
            if (_local_5 == null){
                _local_5 = _arg_1.getAttackRect();
            };
            this.x = _local_5.x;
            this.y = _local_5.y;
            this.width = _local_5.width;
            this.height = _local_5.height;
            this.dz = _local_5.dz;
            this.groupID = (((_arg_2)!=-1) ? (_arg_2) : _arg_1.groupID);
            this.mapX = _arg_1.mapX;
            this.mapZ = _arg_1.mapZ;
            this.mapY = _arg_1.mapY;
            this._fixDir = _arg_4;
            this.isMain = (((_arg_1 is HasActionElement)) ? HasActionElement(_arg_1).isMain() : false);
            this.attachObj = _arg_1;
        }

        public function setHitLocation(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:int):void
        {
            this.hitLocation.z = _arg_5;
            this.hitLocation.deepOffset = 20;
            var _local_7:int = _arg_1;
            var _local_8:int = (_arg_2 - _arg_4);
            var _local_9:int = (_local_7 + _arg_3);
            var _local_10:int = _arg_2;
            var _local_11:int = (this.x + this.width);
            var _local_12:int = (this.y - this.height);
            var _local_13:int = (((this.x > _local_7)) ? this.x : _local_7);
            var _local_14:int = (((_local_12 > _local_8)) ? _local_12 : _local_8);
            var _local_15:int = (((_local_9 > _local_11)) ? _local_11 : _local_9);
            var _local_16:int = (((_local_10 > this.y)) ? this.y : _local_10);
            this.hitLocation.x = ((_local_13 + _local_15) * 0.5);
            this.hitLocation.y = ((_local_14 + _local_16) * 0.5);
            this.dir = (((this._fixDir)!=0) ? this._fixDir : (((_arg_6 < this.mapX)) ? Direction.RIGHT : Direction.LEFT));
        }

        public function toString():String
        {
            return (((((((("x:" + this.x) + " y:") + this.y) + " width:") + this.width) + " height:") + this.height));
        }

        public /*  ©init. */ function _SafeStr_259()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_259 = " HitArea" (String#15803)



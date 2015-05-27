// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.scene.property.MoveFollowItemX

package com.tencent.ai.core.scene.property
{
    import com.tencent.ai.core.data.arg.sceneProperty.MoveFollowItemArg;
    import com.tencent.ai.core.scene.NormalItem;
    import com.tencent.ai.core.data.arg.sceneProperty.PropertyArg;
    import com.tencent.ai.core.enum.ScenePropertyType;
    import  ©init._SafeStr_1131;

    public class MoveFollowItemX extends AbstractProperty 
    {

        private var arg:MoveFollowItemArg;
        private var toFlow:NormalItem;


        override public function init(_arg_1:PropertyArg):void
        {
            this.arg = (_arg_1 as MoveFollowItemArg);
        }

        override public function render():void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_1:NormalItem = (this.target as NormalItem);
            if (((!(this.toFlow)) && (_local_1.layer))){
                this.changeFollowID(this.arg.followID);
            } else {
                this.toFlow.render(0);
                _local_2 = (this.toFlow.mapX + this.toFlow.getDisplay().width);
                if (_local_2 != _local_1.mapX){
                    _local_1.setMapX(_local_2);
                };
                _local_3 = _local_1.mapDeep;
                _local_1.setMapZ(this.toFlow.mapZ);
                _local_1.mapDeep = _local_3;
            };
        }

        override public function uninstall():void
        {
            super.uninstall();
        }

        override public function getType():String
        {
            return (ScenePropertyType.MOVE_FOLLOW_ITEM_X);
        }

        override public function getArg():PropertyArg
        {
            return (this.arg);
        }

        public function changeFollowID(_arg_1:int):void
        {
            var _local_2:NormalItem = (this.target as NormalItem);
            this.arg.followID = _arg_1;
            var _local_3:NormalItem = _local_2.layer.getNormalItemByID(_arg_1);
            this.toFlow = _local_3;
        }

        public /*  ©init. */ function _SafeStr_1131()
        {
        }


    }
}//package com.tencent.ai.core.scene.property

// _SafeStr_1131 = " MoveFollowItemX" (String#13982)



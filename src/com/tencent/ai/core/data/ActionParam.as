// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.ActionParam

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.manager.data.DEFINE;
    import  ©init._SafeStr_205;

    public class ActionParam implements IXMLSerialize 
    {

        public var vx:int;
        public var vy:int;
        public var weapon_eid:int;
        public var scene_eid:int;
        public var create_id:int;
        public var offsetX:int;
        public var offsetY:int;


        public function decode(_arg_1:XML):void
        {
            this.vx = (int(_arg_1.@vx) * DEFINE.G_XVQ);
            this.vy = (int(_arg_1.@vy) * DEFINE.G_YVQ);
            this.weapon_eid = int(_arg_1.@weid);
            this.scene_eid = int(_arg_1.@seid);
            this.create_id = int(_arg_1.@cid);
            this.offsetX = int(_arg_1.@offsetX);
            this.offsetY = int(_arg_1.@offsetY);
        }

        public function encode()
        {
            var _local_1:XML = <ActionParam/>
            ;
            _local_1.@vx = (this.vx * DEFINE.G_XVQ_1);
            _local_1.@vy = (this.vy * DEFINE.G_YVQ_1);
            _local_1.@weid = this.weapon_eid;
            _local_1.@seid = this.scene_eid;
            _local_1.@cid = this.create_id;
            _local_1.@offsetX = this.offsetX;
            _local_1.@offsetY = this.offsetY;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_205()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_205 = " ActionParam" (String#15182)



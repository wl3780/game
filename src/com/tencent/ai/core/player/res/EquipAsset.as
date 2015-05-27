// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.res.EquipAsset

package com.tencent.ai.core.player.res
{
    import com.tencent.ai.core.data.EquipStaticInfo;
    import com.tencent.ai.core.manager.data.DEFINE;
    import  ©init._SafeStr_844;

    public class EquipAsset extends BasePartAsset 
    {

        public var info:EquipStaticInfo;
        public var assetID:int;

        public function EquipAsset(_arg_1:int, _arg_2:EquipStaticInfo, _arg_3:BasePartAsset)
        {
            this.assetID = _arg_1;
            this.info = _arg_2;
            var _local_4:String = (DEFINE.ASSET_EQUIP_SRC + _arg_1);
            super(_local_4, _arg_3);
        }

        override public function toString():String
        {
            return ((((((("装备资源 { name:" + (((this.info)!=null) ? this.info.name : "未知")) + ", id:") + (((this.info)!=null) ? this.info.id : "未知")) + ", assetID:") + this.assetID) + "}"));
        }

        public /*  ©init. */ function _SafeStr_844()
        {
        }


    }
}//package com.tencent.ai.core.player.res

// _SafeStr_844 = " EquipAsset" (String#14678)



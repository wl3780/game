// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.res.FashionAsset

package com.tencent.ai.core.player.res
{
    import com.tencent.ai.core.data.EquipStaticInfo;
    import com.tencent.ai.core.manager.data.DEFINE;
    import  ©init._SafeStr_846;

    public class FashionAsset extends BasePartAsset 
    {

        public var assetID:int;
        public var info:EquipStaticInfo;

        public function FashionAsset(_arg_1:int, _arg_2:EquipStaticInfo, _arg_3:BasePartAsset)
        {
            this.assetID = _arg_1;
            this.info = _arg_2;
            super((DEFINE.PLAYER_RES_SRC + _arg_1), _arg_3);
        }

        override public function toString():String
        {
            return ((((((("时装资源 { name:" + (((this.info)!=null) ? this.info.name : "未知")) + ", id:") + (((this.info)!=null) ? this.info.id : "未知")) + ", assetID:") + this.assetID) + "}"));
        }

        public /*  ©init. */ function _SafeStr_846()
        {
        }


    }
}//package com.tencent.ai.core.player.res

// _SafeStr_846 = " FashionAsset" (String#17102)



// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.ActorInfo

package com.tencent.ai.core.data
{
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.status.SSModel;
    import  ©init._SafeStr_207;

    public class ActorInfo extends AttributeInfo 
    {

        public var id:uint;
        public var type:int = 0;
        public var isMain:Boolean = false;
        public var groupID:int = 1;
        public var groupID2:int = 1;
        public var rank:int = 0;
        public var beatType:int = 0;
        public var name:String;
        public var mapPosition:MapPosition;
        public var diretion:int = 1;
        public var weapon_hurt_eid:int = 0;
        public var weapon_hurt_Type:int = 1;
        public var weapon_create_id:int = 0;
        public var isAttacking:Boolean = false;
        public var bornSSmodels:Vector.<SSModel>;
        public var addStatusModels:Vector.<SSModel>;


        public /*  ©init. */ function _SafeStr_207()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_207 = " ActorInfo" (String#14384)



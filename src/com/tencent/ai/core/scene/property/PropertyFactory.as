// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.scene.property.PropertyFactory

package com.tencent.ai.core.scene.property
{
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.arg.sceneProperty.PropertyArg;
    import  ©init._SafeStr_1133;

    public class PropertyFactory 
    {

        public static var PRO_CLS_MAP:Dictionary;


        public static function create(_arg_1:PropertyArg):AbstractProperty
        {
            var _local_3:AbstractProperty;
            var _local_2:Class = (PRO_CLS_MAP[_arg_1.type] as Class);
            if (_local_2){
                _local_3 = new (_local_2)();
                _local_3.init(_arg_1);
                return (_local_3);
            };
            return (null);
        }


        public /*  ©init. */ function _SafeStr_1133()
        {
        }


    }
}//package com.tencent.ai.core.scene.property

// _SafeStr_1133 = " PropertyFactory" (String#16487)



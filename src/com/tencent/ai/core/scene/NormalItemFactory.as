// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.scene.NormalItemFactory

package com.tencent.ai.core.scene
{
    import flash.events.EventDispatcher;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.data.arg.sceneProperty.PropertyArg;
    import com.tencent.ai.core.scene.property.AbstractProperty;
    import com.tencent.ai.core.data.SceneItemInfo;
    import com.tencent.free.core.lib.CLASS;
    import com.tencent.ai.core.scene.property.PropertyFactory;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.enum.SceneLayerDef;
    import  ©init._SafeStr_1140;

    public class NormalItemFactory extends EventDispatcher implements IElementFactory 
    {


        public function initialize(_arg_1:Object=null):void
        {
        }

        public function getElementType():String
        {
            return (ElementType.ET_NORMALITEM);
        }

        public function createElement(_arg_1:Object=null):BaseElement
        {
            var _local_3:NormalItem;
            var _local_4:PropertyArg;
            var _local_5:AbstractProperty;
            var _local_2:SceneItemInfo = (_arg_1 as SceneItemInfo);
            if (_local_2.type){
                _local_3 = (CLASS.current.tryNewInstance(("com.tencent.ai.core.scene.items." + _local_2.type)) as NormalItem);
            } else {
                _local_3 = new NormalItem();
            };
            _local_3.initialize(_local_2);
            for each (_local_4 in _local_2.propertyArgList) {
                _local_5 = PropertyFactory.create(_local_4);
                _local_3.addProperty(_local_5);
            };
            return (_local_3);
        }

        public function destoryElement(_arg_1:BaseElement):void
        {
            _arg_1.dispose();
        }

        public function getDefaultLayerID():int
        {
            return (SceneLayerDef.LAYER_BACKGROUND);
        }

        public /*  ©init. */ function _SafeStr_1140()
        {
        }


    }
}//package com.tencent.ai.core.scene

// _SafeStr_1140 = " NormalItemFactory" (String#17108)



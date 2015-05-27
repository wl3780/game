// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.element.shadow.ShadowElement

package com.tencent.ai.core.element.shadow
{
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.element.MovementElement;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.display.IDisplay;
    import com.tencent.ai.core.events.BaseEvent;
    import com.tencent.ai.core.events.ElementEvent;
    import com.tencent.ai.core.enum.SceneLayerDef;
    import  ©init._SafeStr_390;

    public class ShadowElement extends BaseElement 
    {

        protected var m_target:MovementElement;
        protected var m_currentScene:IScene;
        protected var m_offsetX:int;
        protected var m_offsetY:int;
        protected var m_shadowType:int;

        public function ShadowElement()
        {
            super(ElementType.ET_SHADOW);
        }

        override protected function initThis():void
        {
            super.initThis();
            this.m_display = this.createDisplay();
            setDeepOffset(1073740824);
        }

        protected function createDisplay():IDisplay
        {
            throw (new Error("[ShadowElement] 初象的阴影不可直接实例化!"));
        }

        protected function onXChange(_arg_1:BaseEvent):void
        {
            setMapX(int(_arg_1.data));
        }

        protected function onZChange(_arg_1:BaseEvent):void
        {
            setMapZ(int(_arg_1.data));
        }

        protected function onXZYChange(_arg_1:BaseEvent):void
        {
            var _local_2:Object = _arg_1.data;
            setMapXZY(_local_2.x, _local_2.z, 0);
        }

        public function initialize(_arg_1:Object=null):void
        {
        }

        public function setTarget(_arg_1:MovementElement):void
        {
            if (this.m_target != null){
                this.m_target.removeEventListener(ElementEvent.ON_X_CHANGE, this.onXChange);
                this.m_target.removeEventListener(ElementEvent.ON_Z_CHANGE, this.onZChange);
                this.m_target.removeEventListener(ElementEvent.ON_XZY_CHANGE, this.onXZYChange);
            };
            this.m_target = _arg_1;
            if (this.m_target != null){
                this.m_target.addEventListener(ElementEvent.ON_X_CHANGE, this.onXChange);
                this.m_target.addEventListener(ElementEvent.ON_Z_CHANGE, this.onZChange);
                this.m_target.addEventListener(ElementEvent.ON_XZY_CHANGE, this.onXZYChange);
            };
        }

        public function setScene(_arg_1:IScene):void
        {
            if (_arg_1 != null){
                _arg_1.addElementAt(SceneLayerDef.LAYER_GROUND, this);
                this.m_currentScene = _arg_1;
            } else {
                if (this.m_currentScene){
                    this.m_currentScene.removeElementAt(SceneLayerDef.LAYER_GROUND, this);
                    this.m_currentScene = null;
                };
            };
        }

        override public function setPosX(_arg_1:int):void
        {
            m_posX = _arg_1;
            if (m_display != null){
                m_display.x = (m_posX - this.m_offsetX);
            };
        }

        override public function setPosY(_arg_1:int):void
        {
            m_posY = _arg_1;
            if (m_display != null){
                m_display.y = (m_posY - this.m_offsetY);
            };
        }

        override public function setPosXY(_arg_1:int, _arg_2:int):void
        {
            m_posX = _arg_1;
            m_posY = _arg_2;
            if (m_display != null){
                m_display.x = (m_posX - this.m_offsetX);
                m_display.y = (m_posY - this.m_offsetY);
            };
        }

        override public function reset():void
        {
            this.setTarget(null);
            super.reset();
        }

        public function getShadowType():int
        {
            return (this.m_shadowType);
        }

        public /*  ©init. */ function _SafeStr_390()
        {
        }


    }
}//package com.tencent.ai.core.element.shadow

// _SafeStr_390 = " ShadowElement" (String#13838)



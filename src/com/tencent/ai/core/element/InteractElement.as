// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.element.InteractElement

package com.tencent.ai.core.element
{
    import com.tencent.ai.core.sound.ISoundSource;
    import com.tencent.ai.core.bubble.IBubbleManager;
    import com.tencent.ai.core.utils.RectArea;
    import com.tencent.ai.core.events.ElementEvent;
    import com.tencent.ai.core.enum.ElementType;
    import flash.events.MouseEvent;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.data.HitArea;
    import com.tencent.ai.core.data.AttackInfo;
    import com.tencent.ai.core.enum.SDTPValuesEnum;
    import flash.display.Sprite;
    import com.tencent.ai.core.sound.ISoundManager;
    import  ©init._SafeStr_397;

    public class InteractElement extends MovementElement implements ISoundSource 
    {

        private static var _BUBBLE:IBubbleManager;

        public var materialType:int = 0;
        public var needGroupChange:Boolean = false;
        public var groupID:int = 0;
        public var lPrev:Object;
        public var lNext:InteractElement;
        public var isCaught:Boolean;
        protected var m_attackRect:RectArea;
        protected var m_GroupEvent:ElementEvent;
        protected var m_CanBeCaught:Boolean;
        protected var m_playingSounds:Array;
        protected var m_clickEvent:ElementEvent;

        public function InteractElement(_arg_1:String)
        {
            super(_arg_1);
        }

        override protected function initThis():void
        {
            super.initThis();
            classID = ElementType.CLASS_ID_INTERACT;
            this.m_attackRect = new RectArea();
            this.m_GroupEvent = new ElementEvent(ElementEvent.ON_GROUP_CHANGE, this);
            this.m_playingSounds = [];
            this.isCaught = false;
        }

        protected function onDisplayClick(_arg_1:MouseEvent):void
        {
            _arg_1.stopPropagation();
            dispatchEvent(this.m_clickEvent);
        }

        protected function onDisplayMouseOver(_arg_1:MouseEvent):void
        {
            _arg_1.stopPropagation();
        }

        protected function onDisplayMouseOut(_arg_1:MouseEvent):void
        {
            _arg_1.stopPropagation();
        }

        public function changeGroup(_arg_1:int):void
        {
            var _local_2:int;
            if (this.groupID != _arg_1){
                _local_2 = this.groupID;
                this.groupID = _arg_1;
                if (this.needGroupChange){
                    this.m_GroupEvent.data = {
                        "oldGroupID":_local_2,
                        "newGroupID":_arg_1
                    };
                    dispatchEvent(this.m_GroupEvent);
                };
            };
        }

        public function speakBubble(_arg_1:Object, _arg_2:int=1, _arg_3:int=300):void
        {
            if (_BUBBLE == null){
                _BUBBLE = AICore.bubble;
            };
            _BUBBLE.popUp(this, _arg_2, _arg_1, _arg_3);
        }

        public function getHurtRects():Array
        {
            return (null);
        }

        protected function hitRectArea(_arg_1:RectArea, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:int, _arg_7:int, _arg_8:HitArea):int
        {
            if ((((_arg_1.width == 0)) || ((_arg_5 == 0)))){
                return (0);
            };
            var _local_9:int = (mapZ - _arg_4);
            _local_9 = ((_local_9 ^ (_local_9 >> 31)) - (_local_9 >> 31));
            if (_local_9 > (_arg_7 + _arg_1.dz)){
                return (0);
            };
            var _local_10:int = (mapX + _arg_1.x);
            var _local_11:int = (mapY - _arg_1.y);
            var _local_12:int = _arg_1.width;
            var _local_13:int = _arg_1.height;
            var _local_14:int = _arg_2;
            var _local_15:int = _arg_3;
            if ((_local_10 + _local_12) > _local_14){
                if (_local_10 < (_local_14 + _arg_5)){
                    if ((_local_11 - _local_13) < _local_15){
                        if ((_local_15 - _arg_6) < _local_11){
                            _arg_8.setHitLocation(_local_10, _local_11, _local_12, _local_13, mapZ, mapX);
                            return (_arg_8.dir);
                        };
                    };
                };
            };
            return (0);
        }

        public function beHurt(_arg_1:AttackInfo):Boolean
        {
            if (m_aiCom != null){
                m_aiCom.beHurt(_arg_1);
            };
            return (true);
        }

        public function attackProcess(_arg_1:AttackInfo, _arg_2:InteractElement):void
        {
        }

        public function hitTest(_arg_1:HitArea):int
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
            var _local_11:int;
            var _local_2:Array = this.getHurtRects();
            var _local_3:int = (((_local_2)!=null) ? _local_2.length : 0);
            if (_local_3 > 0){
                _local_4 = _arg_1.x;
                _local_5 = _arg_1.y;
                _local_6 = _arg_1.mapZ;
                _local_7 = _arg_1.width;
                _local_8 = _arg_1.height;
                _local_9 = _arg_1.dz;
                _local_10 = 0;
                while (_local_10 < _local_3) {
                    _local_11 = this.hitRectArea(_local_2[_local_10], _local_4, _local_5, _local_6, _local_7, _local_8, _local_9, _arg_1);
                    if (_local_11 != 0){
                        if (((_arg_1.isMain) && (!((SDTPValuesEnum._HIT_CHECK_FUNC == null))))){
                            SDTPValuesEnum._HIT_CHECK_TIMES = (SDTPValuesEnum._HIT_CHECK_TIMES + 1);
                            if (SDTPValuesEnum._HIT_CHECK_TIMES >= SDTPValuesEnum._HIT_CHECK_MAX_TIMES){
                                SDTPValuesEnum._HIT_CHECK_TIMES = 0;
                                SDTPValuesEnum._HIT_CHECK_FUNC(_local_2[_local_10], _local_4, _local_5, _local_6, _local_7, _local_8, _local_9, _arg_1, mapX, mapY, mapZ);
                            };
                        };
                        return (_local_11);
                    };
                    _local_10++;
                };
            };
            return (0);
        }

        public function getAttackRect():RectArea
        {
            return (this.m_attackRect);
        }

        public function getIsDead():Boolean
        {
            return (false);
        }

        public function getCanBeCaught():Boolean
        {
            return (this.m_CanBeCaught);
        }

        public function setCanBeCaught(_arg_1:Boolean):void
        {
            this.m_CanBeCaught = _arg_1;
        }

        public function get playingSounds():Array
        {
            return (this.m_playingSounds);
        }

        public function getSourceTarget():BaseElement
        {
            return (this);
        }

        public function set useClickEvent(_arg_1:Boolean):void
        {
            if (m_display != null){
                if (_arg_1){
                    this.m_clickEvent = new ElementEvent(ElementEvent.ON_ELEMENT_CLICK, this);
                    m_display.addEventListener(MouseEvent.CLICK, this.onDisplayClick);
                    m_display.addEventListener(MouseEvent.MOUSE_OVER, this.onDisplayMouseOver);
                    m_display.addEventListener(MouseEvent.MOUSE_OUT, this.onDisplayMouseOut);
                } else {
                    if (this.m_clickEvent != null){
                        this.m_clickEvent = null;
                        m_display.removeEventListener(MouseEvent.CLICK, this.onDisplayClick);
                        m_display.removeEventListener(MouseEvent.MOUSE_OUT, this.onDisplayMouseOut);
                    };
                };
                if ((m_display is Sprite)){
                    Sprite(m_display).buttonMode = _arg_1;
                };
            };
        }

        public function get useClickEvent():Boolean
        {
            return (!((this.m_clickEvent == null)));
        }

        public function stopAllSounds():void
        {
            var _local_2:ISoundManager;
            var _local_1:int = (((this.m_playingSounds == null)) ? -1 : (this.m_playingSounds.length - 1));
            if (_local_1 >= 0){
                _local_2 = AICore.sound;
                while (_local_1 >= 0) {
                    _local_2.stop(this.m_playingSounds[_local_1]);
                    _local_1--;
                };
                this.m_playingSounds.length = 0;
            };
        }

        override public function reset():void
        {
            this.groupID = 0;
            this.m_CanBeCaught = false;
            this.stopAllSounds();
            this.useClickEvent = false;
            this.isCaught = false;
            if (this.m_attackRect != null){
                this.m_attackRect.setEmpty();
            };
            super.reset();
        }

        public /*  ©init. */ function _SafeStr_397()
        {
        }


    }
}//package com.tencent.ai.core.element

// _SafeStr_397 = " InteractElement" (String#13895)



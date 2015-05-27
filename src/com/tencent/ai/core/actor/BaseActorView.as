// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.actor.BaseActorView

package com.tencent.ai.core.actor
{
    import com.tencent.ai.core.render.ElementViewHead;
    import flash.display.MovieClip;
    import com.tencent.ai.core.render.ILayerRender;
    import com.tencent.ai.core.render.BodyViewMultiLayer;
    import com.tencent.ai.core.element.ElementLinkList;
    import com.tencent.ai.core.utils.RectArea;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.display.IDisplay;
    import com.tencent.ai.core.data.EnvironmentInfo;
    import com.tencent.ai.core.enum.Direction;
    import flash.display.Sprite;
    import com.tencent.free.core.lib.CLASS;
    import  ©init._SafeStr_47;

    public class BaseActorView extends ElementViewHead implements IActorView 
    {

        protected var m_hp:MovieClip;
        protected var m_mp:MovieClip;
        protected var m_bodyMainRender:ILayerRender;
        protected var m_body:BodyViewMultiLayer;
        protected var m_childrenLink:ElementLinkList;
        protected var m_ac:RectArea;
        protected var m_hcs:Array;
        protected var m_copy_hcs:Array;
        protected var m_rects:Array;
        protected var m_orgHCs:Array;
        protected var m_orgDir:int;
        protected var m_stiffViewType:int;
        protected var m_height:int;

        public function BaseActorView(_arg_1:BodyViewMultiLayer)
        {
            this.m_body = _arg_1;
            super(_arg_1);
        }

        override protected function initThis():void
        {
            super.initThis();
            this.m_bodyMainRender = this.m_body.getMainLayer();
            this.m_childrenLink = new ElementLinkList();
            this.m_ac = new RectArea();
            this.m_hcs = [];
            this.m_copy_hcs = [];
            this.m_rects = [];
            this.m_orgDir = -1;
            this.m_stiffViewType = 0;
        }

        public function createElement(_arg_1:String, _arg_2:Object, _arg_3:Boolean=true):BaseElement
        {
            var _local_4:BaseElement;
            if (m_parentContainer != null){
                _local_4 = m_parentContainer.createElement(_arg_1, _arg_2, false);
                if (_arg_3){
                    if ((((_local_4.mapZ >= 0)) && ((_local_4.mapDeep >= 0)))){
                        this.addElementAt(0, _local_4);
                    } else {
                        this.addElementAt(-1, _local_4);
                    };
                };
            };
            return (_local_4);
        }

        public function destoryElement(_arg_1:BaseElement, _arg_2:Boolean=true):void
        {
            this.removeElementAt(0, _arg_1);
            if (m_parentContainer != null){
                m_parentContainer.destoryElement(_arg_1, false);
            };
        }

        public function addElementAt(_arg_1:int, _arg_2:BaseElement):Boolean
        {
            var _local_3:IDisplay;
            if (_arg_2.sPrev == null){
                _local_3 = _arg_2.getDisplay();
                if (_local_3 != null){
                    if (_arg_1 == 0){
                        m_viewDisplay.addDisplay(_local_3);
                    } else {
                        m_viewDisplay.addDisplayAt(_local_3, 0);
                    };
                };
                _arg_2.setParentContainer(this);
                this.m_childrenLink.addElement(_arg_2);
                return (true);
            };
            return (false);
        }

        public function removeElementAt(_arg_1:int, _arg_2:BaseElement):void
        {
            var _local_3:IDisplay;
            if (_arg_2.sPrev != null){
                _arg_2.setParentContainer(null);
                this.m_childrenLink.removeElement(_arg_2);
                _local_3 = _arg_2.getDisplay();
                if (_local_3 != null){
                    m_viewDisplay.removeDisplay(_local_3);
                };
            };
        }

        public function removeChildDisplay(_arg_1:BaseElement):void
        {
            _arg_1.setParentContainer(null);
            var _local_2:IDisplay = _arg_1.getDisplay();
            if (_local_2 != null){
                m_viewDisplay.removeDisplay(_local_2);
            };
        }

        public function removeAllChildren():void
        {
        }

        public function isWalkable(_arg_1:int, _arg_2:int):Boolean
        {
            return (true);
        }

        public function getInfo():EnvironmentInfo
        {
            return (null);
        }

        public function getBody():BodyViewMultiLayer
        {
            return (this.m_body);
        }

        override public function getHurtRects():Array
        {
            var _local_2:int;
            var _local_3:RectArea;
            var _local_4:RectArea;
            var _local_5:int;
            var _local_1:Array = this.m_bodyMainRender.hcs;
            if (((!((this.m_orgHCs == _local_1))) || (!((this.m_orgDir == m_dir))))){
                this.m_orgHCs = _local_1;
                this.m_orgDir = m_dir;
                this.m_copy_hcs.length = 0;
                if (m_dir == Direction.RIGHT){
                    this.m_hcs = this.m_orgHCs;
                } else {
                    _local_2 = ((((this.m_orgHCs)!=null) ? this.m_orgHCs.length : 0) - 1);
                    while (_local_2 >= 0) {
                        _local_3 = this.m_orgHCs[_local_2];
                        _local_4 = this.m_rects[_local_2];
                        if (_local_4 == null){
                            _local_4 = (_local_3.clone() as RectArea);
                            this.m_rects[_local_2] = _local_4;
                            _local_4.x = (-(_local_4.x) - _local_4.width);
                        } else {
                            _local_5 = _local_3.width;
                            _local_4.x = (-(_local_3.x) - _local_5);
                            _local_4.y = _local_3.y;
                            _local_4.width = _local_5;
                            _local_4.height = _local_3.height;
                            _local_4.dz = _local_3.dz;
                            _local_4.id = _local_3.id;
                        };
                        this.m_copy_hcs[_local_2] = _local_4;
                        _local_2--;
                    };
                    this.m_hcs = this.m_copy_hcs;
                };
            };
            return (this.m_hcs);
        }

        override public function getAttackRect():RectArea
        {
            var _local_1:RectArea;
            var _local_2:int;
            _local_1 = this.m_body.getAC();
            if (_local_1 == null){
                this.m_ac.width = 0;
                this.m_ac.height = 0;
            } else {
                _local_2 = _local_1.width;
                this.m_ac.x = (((m_dir == Direction.RIGHT)) ? (_local_1.x) : ((_local_1.x * m_dir) - _local_2));
                this.m_ac.y = _local_1.y;
                this.m_ac.width = _local_2;
                this.m_ac.height = _local_1.height;
                this.m_ac.dz = _local_1.dz;
            };
            return (this.m_ac);
        }

        override public function render(_arg_1:int):void
        {
            super.render(_arg_1);
            this.m_childrenLink.render(_arg_1);
        }

        override public function renderChildren(_arg_1:int):void
        {
        }

        override public function reset():void
        {
            m_motionID = -1;
            m_dir = Direction.RIGHT;
            this.m_copy_hcs.length = 0;
            this.m_hcs = this.m_copy_hcs;
            this.m_orgHCs = null;
            this.m_orgDir = -1;
            this.m_ac.setEmpty();
            this.m_childrenLink.removeAllElements(this.removeChildDisplay);
            super.reset();
        }

        public function setHeadBarVisible(_arg_1:Boolean):void
        {
            this.setHpVisible(_arg_1);
            this.setMpVisible(_arg_1);
        }

        public function getHeadBarVisible():Boolean
        {
            return ((((this.m_mp == null)) ? (false) : !((this.m_mp.parent == null))));
        }

        public function setHpVisible(_arg_1:Boolean):void
        {
            var _local_2:Sprite = (this.m_viewDisplay as Sprite);
            if (_arg_1){
                if (!this.m_hp){
                    this.m_hp = (CLASS.current.newInstance("ai.commoneffect.assets.APC_HP_Asset") as MovieClip);
                    if (!this.m_hp){
                        return;
                    };
                    this.m_hp.gotoAndStop(1);
                };
                if (!_local_2.contains(this.m_hp)){
                    _local_2.addChild(this.m_hp);
                };
            } else {
                if (((!((this.m_hp == null))) && (_local_2.contains(this.m_hp)))){
                    _local_2.removeChild(this.m_hp);
                };
            };
            this.update();
        }

        public function getHpVisible():Boolean
        {
            return (((this.m_hp) && (!((this.m_hp.parent == null)))));
        }

        public function setHeadBarHp(_arg_1:Number):void
        {
            var _local_2:int = (this.m_hp.totalFrames * (1 - _arg_1));
            _local_2 = Math.max(1, Math.min(_local_2, this.m_hp.totalFrames));
            this.m_hp.gotoAndStop(_local_2);
        }

        public function setMpVisible(_arg_1:Boolean):void
        {
            var _local_2:Sprite = (this.m_viewDisplay as Sprite);
            if (_arg_1){
                if (!this.m_mp){
                    this.m_mp = (CLASS.current.newInstance("ai.commoneffect.assets.APC_MP_Asset") as MovieClip);
                    if (!this.m_mp){
                        return;
                    };
                    this.m_mp.gotoAndStop(1);
                };
                if (!_local_2.contains(this.m_mp)){
                    _local_2.addChild(this.m_mp);
                };
            } else {
                if (((!((this.m_mp == null))) && (_local_2.contains(this.m_mp)))){
                    _local_2.removeChild(this.m_mp);
                };
            };
            this.update();
        }

        public function getMpVisible():Boolean
        {
            return (((this.m_mp) && (!((this.m_mp.parent == null)))));
        }

        public function setHeadBarMp(_arg_1:Number):void
        {
            var _local_2:int = (this.m_mp.totalFrames * (1 - _arg_1));
            _local_2 = Math.max(1, Math.min(_local_2, this.m_mp.totalFrames));
            this.m_mp.gotoAndStop(_local_2);
        }

        public function set height(_arg_1:int):void
        {
            this.m_height = _arg_1;
        }

        public function get height():int
        {
            return (this.m_height);
        }

        override protected function update():void
        {
            var _local_4:int;
            var _local_1:Boolean = this.getMpVisible();
            var _local_2:Boolean = this.getHpVisible();
            var _local_3:int;
            _local_3 = (-5 - this.m_height);
            if (_local_1){
                this.m_mp.y = (_local_3 - (this.m_mp.height * 0.5));
                _local_3 = (this.m_mp.y - 1);
            };
            if (_local_2){
                this.m_hp.y = (_local_3 - (this.m_hp.height * 0.5));
                _local_3 = (this.m_hp.y - 3);
            };
            if (this.getHeadVisible()){
                this.m_nameTxt.x = (this.m_nameTxt.width * -0.5);
                this.m_nameTxt.y = (_local_3 - this.m_nameTxt.height);
            };
        }

        public function getStiffViewType():int
        {
            return (this.m_stiffViewType);
        }

        public /*  ©init. */ function _SafeStr_47()
        {
        }


    }
}//package com.tencent.ai.core.actor

// _SafeStr_47 = " BaseActorView" (String#14060)



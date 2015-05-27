// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.interact.view.BaseInteratItemView

package com.tencent.ai.core.interact.view
{
    import com.tencent.ai.core.render.ElementViewHead;
    import com.tencent.ai.core.interact.IInteractItemView;
    import com.tencent.ai.core.render.ILayerRender;
    import com.tencent.ai.core.interact.res.InteractItemAsset;
    import com.tencent.ai.core.interact.IInteractItemAssetManager;
    import com.tencent.ai.core.element.ElementLinkList;
    import com.tencent.ai.core.utils.RectArea;
    import com.tencent.ai.core.events.AssetLoadEvent;
    import flash.events.Event;
    import com.tencent.ai.core.data.InteractItemStaticInfo;
    import com.tencent.ai.core.enum.Direction;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.display.IDisplay;
    import com.tencent.ai.core.data.EnvironmentInfo;
    import  ©init._SafeStr_579;

    public class BaseInteratItemView extends ElementViewHead implements IInteractItemView 
    {

        protected var bodyMainRender:ILayerRender;
        protected var asset:InteractItemAsset;
        protected var resM:IInteractItemAssetManager;
        protected var m_isloading:Boolean;
        protected var m_childrenLink:ElementLinkList;
        protected var body:InteractItemBody;
        protected var m_ac:RectArea;
        protected var m_hcs:Array;
        protected var m_copy_hcs:Array;
        protected var m_rects:Array;
        protected var m_orgHCs:Array;
        protected var m_orgDir:int;

        public function BaseInteratItemView()
        {
            this.body = new InteractItemBody();
            super(this.body);
        }

        override protected function initThis():void
        {
            super.initThis();
            this.bodyMainRender = this.body.getMainLayer();
            this.m_ac = new RectArea();
            this.m_hcs = [];
            this.m_copy_hcs = [];
            this.m_rects = [];
            this.m_orgDir = -1;
            this.m_childrenLink = new ElementLinkList();
        }

        public function setResManager(_arg_1:IInteractItemAssetManager):void
        {
            this.resM = _arg_1;
        }

        protected function onAssetLoaded(_arg_1:Event):void
        {
            this.body.update(this.asset.interactItemLayerAssets);
            if (this.m_isloading){
                this.asset.removeEventListener(AssetLoadEvent.COMPLETE, this.onAssetLoaded);
                this.m_isloading = false;
            };
            setHeadText(null);
        }

        public function loadAsset(_arg_1:InteractItemStaticInfo):void
        {
            this.asset = this.resM.getInteractItemAsset(_arg_1, this);
            this.m_isloading = true;
            if (this.asset.getIsLoaded()){
                this.onAssetLoaded(null);
            } else {
                this.m_isloading = true;
                this.asset.addEventListener(AssetLoadEvent.COMPLETE, this.onAssetLoaded);
                this.asset.load();
            };
        }

        override public function reset():void
        {
            if (((!((this.resM == null))) && (!((this.asset == null))))){
                this.resM.returnInteractItemAsset(this.asset, this);
                this.resM = null;
            };
            if (((this.m_isloading) && (!((this.asset == null))))){
                this.asset.removeEventListener(AssetLoadEvent.COMPLETE, this.onAssetLoaded);
                this.m_isloading = false;
            };
            this.asset = null;
            this.m_copy_hcs.length = 0;
            this.m_hcs = this.m_copy_hcs;
            this.m_orgHCs = null;
            this.m_orgDir = -1;
            this.m_ac.setEmpty();
            this.m_childrenLink.removeAllElements(this.removeChildDisplay);
            super.reset();
        }

        override public function getHurtRects():Array
        {
            var _local_2:int;
            var _local_3:RectArea;
            var _local_4:RectArea;
            var _local_5:int;
            var _local_1:Array = this.bodyMainRender.hcs;
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
            var _local_2:int;
            var _local_1:RectArea = this.body.getAC();
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

        public function isWalkable(_arg_1:int, _arg_2:int):Boolean
        {
            return (true);
        }

        public function getInfo():EnvironmentInfo
        {
            return (null);
        }

        public function removeChildDisplay(_arg_1:BaseElement):void
        {
            _arg_1.setParentContainer(null);
            var _local_2:IDisplay = _arg_1.getDisplay();
            if (_local_2 != null){
                m_viewDisplay.removeDisplay(_local_2);
            };
        }

        override public function render(_arg_1:int):void
        {
            super.render(_arg_1);
            this.m_childrenLink.render(_arg_1);
        }

        public /*  ©init. */ function _SafeStr_579()
        {
        }


    }
}//package com.tencent.ai.core.interact.view

// _SafeStr_579 = " BaseInteratItemView" (String#15965)



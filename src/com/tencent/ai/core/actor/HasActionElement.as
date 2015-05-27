// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.actor.HasActionElement

package com.tencent.ai.core.actor
{
    import com.tencent.ai.core.element.InteractElement;
    import com.tencent.ai.core.script.IScriptListener;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.render.IElementView;
    import com.tencent.ai.core.action.IElementAction;
    import com.tencent.ai.core.data.ActorInfo;
    import com.tencent.ai.core.element.shadow.ShadowElement;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.utils.RectArea;
    import com.tencent.free.logging.warning;
    import com.tencent.ai.core.element.IElementContainer;
    import com.tencent.ai.core.display.IDisplay;
    import flash.geom.Rectangle;
    import  ©init._SafeStr_48;

    public class HasActionElement extends InteractElement implements IScriptListener 
    {

        public var RT_cache_data:Dictionary;
        protected var m_view:IElementView;
        protected var m_actionList:Array;
        protected var m_currentAction:IElementAction;
        protected var m_prevAction:IElementAction;
        protected var m_controller:IElementController;
        protected var m_actorInfo:ActorInfo;
        protected var m_actionsNum:int = 0;
        protected var m_shadow:ShadowElement;
        protected var m_defaultActionID:int;
        protected var m_scene:IScene;
        protected var m_inited:Boolean = false;
        protected var m_isAirElement:Boolean = false;

        public function HasActionElement(_arg_1:String)
        {
            super(_arg_1);
        }

        override protected function initThis():void
        {
            super.initThis();
            hasSceneRender = false;
            this.m_actionList = [];
            this.m_defaultActionID = 0;
            this.m_inited = true;
        }

        override protected function executeFrame(_arg_1:int):void
        {
            super.executeFrame(_arg_1);
            if (this.m_view != null){
                this.m_view.render(0);
            };
        }

        override public function render(_arg_1:int):void
        {
            if (this.m_shadow != null){
                this.m_shadow.render(_arg_1);
            };
        }

        override public function getHurtRects():Array
        {
            if (this.m_view != null){
                return (this.m_view.getHurtRects());
            };
            return (null);
        }

        public function setMotionID(_arg_1:int):void
        {
            if (this.m_view != null){
                this.m_view.setMotionID(_arg_1);
            };
        }

        public function getActorInfo():ActorInfo
        {
            return (this.m_actorInfo);
        }

        public function getMotionID():int
        {
            if (this.m_view == null){
                return (-1);
            };
            return (this.m_view.getMotionID());
        }

        override public function getAttackRect():RectArea
        {
            var _local_1:RectArea;
            if (this.m_view != null){
                _local_1 = this.m_view.getAttackRect();
                m_attackRect.x = (mapX + _local_1.x);
                m_attackRect.y = (mapY - _local_1.y);
                m_attackRect.dz = _local_1.dz;
                m_attackRect.width = _local_1.width;
                m_attackRect.height = _local_1.height;
                m_attackRect.id = _local_1.id;
            };
            return (m_attackRect);
        }

        public function addAction(_arg_1:IElementAction):void
        {
            var _local_2:int;
            if (_arg_1 != null){
                _local_2 = this.m_actionList.indexOf(_arg_1);
                if (_local_2 == -1){
                    _arg_1.attach(this);
                    this.m_actionList[_arg_1.getActionID()] = _arg_1;
                };
            };
        }

        public function removeAction(_arg_1:IElementAction):void
        {
            var _local_2:int;
            if (_arg_1 != null){
                _local_2 = this.m_actionList.indexOf(_arg_1);
                if (_local_2 != -1){
                    _arg_1.stop();
                    _arg_1.attach(null);
                    this.m_actionList[_arg_1.getActionID()] = null;
                };
            };
        }

        public function isAirElement():Boolean
        {
            return (this.m_isAirElement);
        }

        public function isMain():Boolean
        {
            return (false);
        }

        public function getCurrentAction():IElementAction
        {
            return (this.m_currentAction);
        }

        public function getPrevAction():IElementAction
        {
            return (this.m_prevAction);
        }

        public function getDefaultActionID():int
        {
            return (this.m_defaultActionID);
        }

        public function setController(_arg_1:IElementController):void
        {
            this.m_controller = _arg_1;
        }

        public function getController():IElementController
        {
            return (this.m_controller);
        }

        public function inputActionID(_arg_1:int):void
        {
            throw (new Error("[HasActionElement] 没有实现inputActionID 不能调用!"));
        }

        public function inputVKey(_arg_1:int):void
        {
            this.m_controller.inputVKey(_arg_1);
        }

        public function vKeyAct(_arg_1:int, _arg_2:Object=null):void
        {
            this.m_controller.vKeyAct(_arg_1, _arg_2);
        }

        public function setActorLocked(_arg_1:Boolean):void
        {
            this.m_controller.isLock = _arg_1;
        }

        public function act(_arg_1:int, _arg_2:int, _arg_3:Object=null):Boolean
        {
            var _local_4:IElementAction = this.m_actionList[_arg_1];
            if (_local_4 == null){
                warning("[HasActionElement] 没有找到可执行的动作或执行动作相同!");
                return (false);
            };
            if (_local_4 == this.m_currentAction){
                this.m_currentAction.exec(_arg_2, _arg_3);
                return (false);
            };
            this.m_prevAction = this.m_currentAction;
            if (this.m_prevAction != null){
                this.m_prevAction.stop();
            };
            this.m_currentAction = _local_4;
            this.m_currentAction.exec(_arg_2, _arg_3);
            return (true);
        }

        public function getView():IElementView
        {
            return (this.m_view);
        }

        override public function setParentContainer(_arg_1:IElementContainer):void
        {
            var _local_4:IElementAction;
            super.setParentContainer(_arg_1);
            this.m_scene = (_arg_1 as IScene);
            var _local_2:int = this.m_actionList.length;
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = this.m_actionList[_local_3];
                if (_local_4 != null){
                    _local_4.setScene(this.m_scene);
                };
                _local_3++;
            };
            if (this.m_shadow != null){
                this.m_shadow.setScene(this.m_scene);
            };
            if (this.m_view != null){
                this.m_view.setParentContainer(this.m_scene);
            };
        }

        public function forceSetDirection(_arg_1:int):void
        {
            this.m_direction = _arg_1;
            if (this.m_view != null){
                this.m_view.setDirection(_arg_1);
            };
        }

        override public function setDirection(_arg_1:int):void
        {
            super.setDirection(_arg_1);
            this.forceSetDirection(_arg_1);
        }

        override public function getBodyHeight():Number
        {
            var _local_1:IDisplay;
            var _local_2:Rectangle;
            if (this.m_view){
                _local_1 = this.m_view.getBodyDisplay();
                _local_2 = _local_1.getDisplayBounds(this.m_view.getDisplay());
                return (Math.abs(_local_2.top));
            };
            return (0);
        }

        public function getElementshadow():ShadowElement
        {
            return (this.m_shadow);
        }

        public function getAllActions():Array
        {
            return (this.m_actionList);
        }

        override public function reset():void
        {
            if (this.m_inited){
                if (this.m_view){
                    this.m_view.reset();
                };
                if (this.m_controller){
                    this.m_controller.reset();
                };
            };
            this.RT_cache_data = new Dictionary();
            this.m_actorInfo = null;
            this.m_currentAction = null;
            this.m_prevAction = null;
            this.m_isAirElement = false;
            super.reset();
        }

        public function onScript(_arg_1:String, _arg_2:Object=null):void
        {
            var _local_3:IScriptListener = (this.m_currentAction as IScriptListener);
            if (_local_3 != null){
                _local_3.onScript(_arg_1, _arg_2);
            };
        }

        public /*  ©init. */ function _SafeStr_48()
        {
        }


    }
}//package com.tencent.ai.core.actor

// _SafeStr_48 = " HasActionElement" (String#13898)



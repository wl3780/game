// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.actions.PlayerRideAction

package com.tencent.ai.core.player.actions
{
    import com.tencent.ai.core.action.DynamicAction;
    import com.tencent.ai.core.actor.BaseActor;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.enum.BaseActionIDDef;
    import com.tencent.ai.core.enum.ElementGroupDef;
    import com.tencent.ai.core.enum.RideType;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.VKeyDef;
    import  ©init._SafeStr_834;

    public class PlayerRideAction extends DynamicAction 
    {

        private var _tempArg:Object;
        private var _iGroupID:int;
        private var _hGroupID:int;
        private var _horse:BaseActor;
        private var _horseMapKey:Dictionary;
        private var _watchHelper:WatchHelper;

        public function PlayerRideAction()
        {
            super(BaseActionIDDef.RIDE);
        }

        override protected function activeAction():void
        {
            super.activeAction();
            this._horse = (this._tempArg as BaseActor);
            if (((!((this._horse == null))) && (!(this._horse.getIsDead())))){
                this._iGroupID = m_target.groupID;
                this._hGroupID = this._horse.groupID;
                m_target.changeGroup(ElementGroupDef.PVE_IGNORE);
                this._horse.changeGroup(this._iGroupID);
                m_target.rideActor(RideType.RIDE_TYPE_KNIGHT, this._horse);
                this._horse.rideActor(RideType.RIDE_TYPE_HORSE, m_target);
                if (this._watchHelper == null){
                    this._watchHelper = new WatchHelper();
                };
                this._watchHelper.bind(this._horse, m_target, nextAction);
                AICore.data.mainModel.skillManager.setControlModel(this._horse.getModel(), m_target.isMain());
                this._horseMapKey = this._horse.getModel().RT_ControllerVKeyMap;
            } else {
                this._horse = null;
                nextAction(VKeyDef.JUMP);
            };
        }

        override protected function inactiveAction():void
        {
            this._tempArg = null;
            if (this._horse != null){
                m_target.changeGroup(this._iGroupID);
                this._horse.changeGroup(this._hGroupID);
                this._iGroupID = ElementGroupDef.PVE_PLAYER;
                this._hGroupID = ElementGroupDef.PVE_MONSTER;
                m_target.rideActor(RideType.RIDE_TYPE_UNKNOW);
                this._horse.rideActor(RideType.RIDE_TYPE_UNKNOW);
                this._watchHelper.unbind();
                this._horse = null;
                this._horseMapKey = null;
                AICore.data.mainModel.skillManager.setControlModel(null, m_target.isMain());
            };
            super.inactiveAction();
        }

        override public function exec(_arg_1:int, _arg_2:Object=null):void
        {
            if (this._horse == null){
                this._tempArg = _arg_2;
                super.exec(_arg_1, _arg_2);
            } else {
                if ((((_arg_1 == VKeyDef.JUMP)) && ((this._horse.getRideType() == RideType.RIDE_TYPE_HORSE_OUT)))){
                    nextAction(VKeyDef.JUMP);
                } else {
                    if (this._horseMapKey[_arg_1]){
                        _arg_1 = this._horseMapKey[_arg_1];
                    };
                    this._horse.inputVKey(_arg_1);
                };
            };
        }

        public /*  ©init. */ function _SafeStr_834()
        {
        }


    }
}//package com.tencent.ai.core.player.actions

import com.tencent.ai.core.actor.BaseActor;
import com.tencent.ai.core.events.ElementEvent;
import com.tencent.ai.core.enum.VKeyDef;
import com.tencent.ai.core.events.BaseEvent;
import com.tencent.ai.core.player.BasePlayer;
import com.tencent.ai.core.enum.VisibleValueDef;
import  ©init._SafeStr_835;

class WatchHelper 
{

    /*private*/ var _horse:BaseActor;
    /*private*/ var _knight:BaseActor;
    /*private*/ var _nextAction:Function;
    /*private*/ var _isBinding:Boolean = false;

    public function WatchHelper()
    {
        super();
    }

    /*private*/ function listTargetMove(_arg_1:Boolean):void
    {
        if (_arg_1){
            this._horse.addEventListener(ElementEvent.ON_DIR_CHANGE, this.onDirectionChange);
            this._horse.addEventListener(ElementEvent.ON_X_CHANGE, this.onXChange);
            this._horse.addEventListener(ElementEvent.ON_Z_CHANGE, this.onZChange);
            this._horse.addEventListener(ElementEvent.ON_Y_CHANGE, this.onYChange);
            this._horse.addEventListener(ElementEvent.ON_XZY_CHANGE, this.onXZYChange);
            this._horse.addEventListener(ElementEvent.ON_ELEMENT_DEAD, this.onHorseDead);
        } else {
            this._horse.removeEventListener(ElementEvent.ON_DIR_CHANGE, this.onDirectionChange);
            this._horse.removeEventListener(ElementEvent.ON_X_CHANGE, this.onXChange);
            this._horse.removeEventListener(ElementEvent.ON_Z_CHANGE, this.onZChange);
            this._horse.removeEventListener(ElementEvent.ON_Y_CHANGE, this.onYChange);
            this._horse.removeEventListener(ElementEvent.ON_XZY_CHANGE, this.onXZYChange);
            this._horse.removeEventListener(ElementEvent.ON_ELEMENT_DEAD, this.onHorseDead);
        };
    }

    /*private*/ function onHorseDead(_arg_1:ElementEvent):void
    {
        this._nextAction.call(null, VKeyDef.JUMP);
    }

    public function onXChange(_arg_1:BaseEvent):void
    {
        if (this._knight != null){
            this._knight.setMapX(this._horse.mapX);
        };
    }

    public function onZChange(_arg_1:BaseEvent):void
    {
        if (this._knight != null){
            this._knight.setMapZ(this._horse.mapZ);
        };
    }

    public function onYChange(_arg_1:BaseEvent):void
    {
        if (this._knight != null){
            this._knight.setMapY(this._horse.mapY);
        };
    }

    public function onXZYChange(_arg_1:BaseEvent):void
    {
        if (this._knight != null){
            this._knight.setMapXZY(this._horse.mapX, this._horse.mapZ, this._horse.mapY);
        };
    }

    public function onDirectionChange(_arg_1:BaseEvent):void
    {
        if (this._knight != null){
            this._knight.forceSetDirection(this._horse.getDirection());
        };
    }

    public function bind(_arg_1:BaseActor, _arg_2:BaseActor, _arg_3:Function):void
    {
        if (!this._isBinding){
            this._horse = _arg_1;
            this._knight = _arg_2;
            this._nextAction = _arg_3;
            this.listTargetMove(true);
            this._isBinding = true;
            this.onXZYChange(null);
            BasePlayer(this._knight).setVisibleValue(VisibleValueDef.NOTHING_VISIBLE);
        };
    }

    public function unbind():void
    {
        if (this._isBinding){
            BasePlayer(this._knight).setVisibleValue(VisibleValueDef.ALL_VISIBLE);
            this.listTargetMove(false);
            this._horse = null;
            this._knight = null;
            this._nextAction = null;
            this._isBinding = false;
        };
    }

    public /*  ©init. */ function _SafeStr_835()
    {
    }


}

// _SafeStr_834 = " PlayerRideAction" (String#17297)
// _SafeStr_835 = " WatchHelper" (String#17300)



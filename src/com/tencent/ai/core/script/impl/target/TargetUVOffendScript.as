// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.TargetUVOffendScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.render.IFrameListener;
    import com.tencent.ai.core.actor.HasActionElement;
    import com.tencent.ai.core.combat.ICombatScene;
    import com.tencent.ai.core.utils.Rectangle3D;
    import com.tencent.ai.core.data.arg.script.OffendUVScriptArg;
    import com.tencent.ai.core.enum.ElementGroupDef;
    import com.tencent.ai.core.combat.Battle;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.element.InteractElement;
    import com.tencent.ai.core.enum.Direction;
    import com.tencent.ai.core.enum.MotionDef;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1248;

    public class TargetUVOffendScript extends VirgationScript implements IScript, IFrameListener 
    {

        private var _targetActor:HasActionElement;
        private var _targetGroup:int = 0;
        private var _searchX:int = 100;
        private var _searchZ:int = 20;
        private var _speed:int = 10;
        private var _canThrough:int = 0;
        private var _offsetX:Number = 0;
        private var _offsetZ:Number = 0;
        private var _argCmd:String = "";
        private var _argStr:String = "";
        private var canMove:Boolean = false;
        private var scene:ICombatScene;
        private var _accumulatedOffsetX:Number = 0;
        private var _accumulatedOffsetZ:Number = 0;
        private var _aimX:int;
        private var _aimZ:int;


        public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_4:Array;
            var _local_6:Rectangle3D;
            var _local_9:int;
            var _local_3:OffendUVScriptArg = OffendUVScriptArg(_arg_2);
            this.scene = ICombatScene(m_target.scene);
            this._targetActor = m_target.target;
            this._targetGroup = _local_3.targetGroup;
            this._searchX = _local_3.searchX;
            this._searchZ = _local_3.searchZ;
            this._speed = _local_3.speed;
            this._canThrough = _local_3.canThrough;
            this._argCmd = _local_3.argCmd;
            this._argStr = _local_3.argStr;
            var _local_5:int = this._targetActor.groupID;
            if (_local_3.targetGroup == 0){
                _local_4 = [_local_5];
            } else {
                _local_4 = ElementGroupDef.IGNORE_GID_MAP[_local_5];
            };
            _local_6 = new Rectangle3D((this._targetActor.mapX - (this._searchX / 2)), 0, (this._targetActor.mapZ - (this._searchZ / 2)), this._searchX, 0x1000, this._searchZ);
            var _local_7:InteractElement = Battle.Current.findElementNearestInRectangle(this._targetActor.mapX, 0, this._targetActor.mapZ, _local_6, _local_4, ElementType.ET_INTERACT);
            if (_local_7 == null){
                execVirgation(this._argCmd, int(this._argStr));
                return;
            };
            _local_9 = (_local_7.mapX - this._targetActor.mapX);
            this._targetActor.setDirection((((_local_9 > 0)) ? Direction.RIGHT : Direction.LEFT));
            this._accumulatedOffsetX = 0;
            this._accumulatedOffsetZ = 0;
            var _local_8:Number = Math.atan2((_local_7.mapZ - this._targetActor.mapZ), (_local_7.mapX - this._targetActor.mapX));
            this._offsetX = (this._speed * Math.cos(_local_8));
            this._offsetZ = (this._speed * Math.sin(_local_8));
            this.canMove = this.scene.isWalkable(this._targetActor.mapX, this._targetActor.mapZ);
            if (this.canMove){
                this._aimX = _local_7.mapX;
                this._aimZ = _local_7.mapZ;
            } else {
                this._aimX = this._targetActor.mapX;
                this._aimZ = this._targetActor.mapZ;
            };
            m_target.addLastRS(this);
            this._targetActor.getView().addFrameListener(MotionDef.L_ENTER_FRAME, this);
        }

        public function onFrameEvent(_arg_1:String):void
        {
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            var _local_9:int;
            var _local_2:Boolean;
            var _local_3:Number = (this._aimX - this._targetActor.mapX);
            var _local_4:Number = (this._aimZ - this._targetActor.mapZ);
            var _local_5:Number = ((_local_3 * _local_3) + (_local_4 * _local_4));
            if (_local_5 <= (this._speed * this._speed)){
                _local_2 = true;
            };
            if (((_local_2) || (!(this.canMove)))){
                this._targetActor.setMapXZY(this._aimX, this._aimZ, this._targetActor.mapY);
                m_target.removeLastRs(this);
                this.stop();
                execVirgation(this._argCmd, int(this._argStr));
                return;
            };
            if (this.canMove){
                this._accumulatedOffsetX = (this._accumulatedOffsetX + this._offsetX);
                this._accumulatedOffsetZ = (this._accumulatedOffsetZ + this._offsetZ);
                _local_6 = int(this._accumulatedOffsetX);
                _local_7 = int(this._accumulatedOffsetZ);
                if ((_local_3 * _local_3) <= (this._offsetX * this._offsetX)){
                    _local_8 = this._targetActor.mapX;
                } else {
                    _local_8 = (this._targetActor.mapX + _local_6);
                };
                if ((_local_4 * _local_4) <= (this._offsetZ * this._offsetZ)){
                    _local_9 = this._targetActor.mapZ;
                } else {
                    _local_9 = (this._targetActor.mapZ + _local_7);
                };
                if (this._canThrough == 0){
                    if (this.scene.isWalkable(_local_8, _local_9)){
                        this._targetActor.setMapXZY(_local_8, _local_9, this._targetActor.mapY);
                    };
                } else {
                    this._targetActor.setMapXZY(_local_8, _local_9, this._targetActor.mapY);
                };
                this._accumulatedOffsetX = (this._accumulatedOffsetX - _local_6);
                this._accumulatedOffsetZ = (this._accumulatedOffsetZ - _local_7);
            };
        }

        public function stop():void
        {
            this._targetActor.setMapXZY(this._aimX, this._aimZ, this._targetActor.mapY);
            this._targetActor.getView().removeFrameListener(MotionDef.L_ENTER_FRAME, this);
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_TARGET_UV_OFFEND_SCRIPT);
        }

        public /*  ©init. */ function _SafeStr_1248()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1248 = " TargetUVOffendScript" (String#14570)



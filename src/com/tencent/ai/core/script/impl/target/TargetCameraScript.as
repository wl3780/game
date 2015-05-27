// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.TargetCameraScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.script.ITarget;
    import com.tencent.ai.core.scene.ICamera;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.actor.HasActionElement;
    import com.tencent.ai.core.script.ITargetHasSkill;
    import com.tencent.ai.core.data.arg.script.ChangeCameraScriptArg;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1232;

    public class TargetCameraScript implements IScript 
    {

        protected var m_target:ITarget;
        protected var m_isFollowed:Boolean;
        protected var m_setCamera:Boolean;
        private var _camera:ICamera;

        public function TargetCameraScript()
        {
            this.m_isFollowed = false;
            this.m_setCamera = false;
        }

        public function setTarget(_arg_1:Object):void
        {
            this.m_target = ITarget(_arg_1);
        }

        public function getTarget():Object
        {
            return (this.m_target);
        }

        public function refMainPlayer():Boolean
        {
            var _local_2:Vector.<HasActionElement>;
            var _local_3:int;
            var _local_1:Boolean;
            if (this.m_target.model.isMain){
                _local_1 = true;
            } else {
                if ((this.m_target is ITargetHasSkill)){
                    _local_2 = ITargetHasSkill(this.m_target).getAttackDelegate().cacthAims;
                    _local_3 = 0;
                    while (_local_3 < _local_2.length) {
                        if (_local_2[_local_3].isMain()){
                            _local_1 = true;
                            break;
                        };
                        _local_3++;
                    };
                };
            };
            return (_local_1);
        }

        public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:HasActionElement;
            var _local_3:ChangeCameraScriptArg = ChangeCameraScriptArg(_arg_2);
            if (_local_3.isFollowFocus){
                if (this.m_isFollowed){
                    this.m_target.removeLastRs(this);
                    this.stop();
                };
            } else {
                if (!this.m_isFollowed){
                    this.m_isFollowed = true;
                    this.m_target.addLastRS(this);
                    if (this.refMainPlayer()){
                        this.m_setCamera = true;
                        this._camera = IScene(this.m_target.target.getParentContainer()).getCamera();
                        this._camera.catchFocus();
                        _local_4 = _local_3.mapX;
                        _local_5 = _local_3.mapZ;
                        _local_6 = this.m_target.target;
                        if (((!((_local_4 == 0))) || (!((_local_5 == 0))))){
                            this._camera.isFollowFocus = false;
                            this._camera.locateTo(((_local_4 * _local_6.getDirection()) + _local_6.mapX), (_local_5 + _local_6.mapZ));
                        } else {
                            this._camera.setFocus(_local_6);
                        };
                    };
                };
            };
        }

        public function stop():void
        {
            if (this.m_isFollowed){
                this.m_isFollowed = false;
                if (this.m_setCamera){
                    this._camera.releaseFocus();
                    this._camera.isFollowFocus = true;
                    this.m_setCamera = false;
                    this._camera = null;
                };
            };
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_TARGET_CAMERA);
        }

        public /*  ©init. */ function _SafeStr_1232()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1232 = " TargetCameraScript" (String#14876)



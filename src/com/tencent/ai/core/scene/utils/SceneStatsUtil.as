// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.scene.utils.SceneStatsUtil

package com.tencent.ai.core.scene.utils
{
    import flash.utils.Timer;
    import __AS3__.vec.Vector;
    import flash.events.TimerEvent;
    import com.tencent.ai.core.utils.CheckFRUtil;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.AIContextType;
    import com.tencent.ai.core.enum.Constants;
    import com.tencent.free.logging.logToServer;
    import com.tencent.ai.core.enum.LogToServerType;
    import  ©init._SafeStr_1137;
    import __AS3__.vec.*;

    public class SceneStatsUtil 
    {

        private var _timer:Timer;
        private var _count:int;
        private var _totalFPS:int;
        private var _dupSceneIDs:Vector.<int>;

        public function SceneStatsUtil()
        {
            this._timer = new Timer(3000);
            this._dupSceneIDs = new Vector.<int>();
        }

        public function start(_arg_1:int=3000):void
        {
            if (this._timer.running){
                this.stop(false);
            };
            this._timer.delay = _arg_1;
            this._timer.addEventListener(TimerEvent.TIMER, this.onTimer);
            this._timer.start();
            this._count = 0;
            this._totalFPS = 0;
        }

        private function onTimer(_arg_1:TimerEvent):void
        {
            this._count++;
            this._totalFPS = (this._totalFPS + CheckFRUtil.FPS);
        }

        public function stop(_arg_1:Boolean=true):void
        {
            var _local_2:int;
            var _local_3:String;
            var _local_4:int;
            var _local_5:int;
            var _local_6:Object;
            this._timer.stop();
            this._timer.removeEventListener(TimerEvent.TIMER, this.onTimer);
            if (((((_arg_1) && (AICore.Runtime.currentContext))) && (AICore.Runtime.currentContext.getSceneInfo()))){
                _local_2 = AICore.Runtime.currentContext.getSceneInfo().sceneID;
                _local_3 = AICore.Runtime.currentContext.getType();
                if (_local_3 != AIContextType.CT_DUPLICATE){
                    this._dupSceneIDs.length = 0;
                };
                switch (AICore.Runtime.currentContext.getType()){
                    case AIContextType.CT_CITY:
                        _local_4 = 0;
                        break;
                    case AIContextType.CT_DUPLICATE:
                        if (this._dupSceneIDs.indexOf(_local_2) > -1){
                            return;
                        };
                        _local_6 = AICore.data.runtime.getData(Constants.RTD_DUP);
                        _local_4 = _local_6.dup_id;
                        this._dupSceneIDs.push(_local_2);
                        break;
                    default:
                        return;
                };
                _local_5 = int((this._totalFPS / this._count));
                logToServer([LogToServerType.DUP_SCENE_STATS, 2, _local_4, _local_2, _local_5], null);
            };
        }

        public /*  ©init. */ function _SafeStr_1137()
        {
        }


    }
}//package com.tencent.ai.core.scene.utils

// _SafeStr_1137 = " SceneStatsUtil" (String#17720)



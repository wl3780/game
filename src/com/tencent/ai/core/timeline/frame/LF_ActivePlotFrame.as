// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.timeline.frame.LF_ActivePlotFrame

package com.tencent.ai.core.timeline.frame
{
    import flash.utils.Dictionary;
    import com.tencent.ai.core.plot.IPlot;
    import com.tencent.ai.core.events.AIEvent;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.Constants;
    import com.tencent.ai.core.enum.LogicFrameType;
    import  ©init._SafeStr_1294;

    public class LF_ActivePlotFrame extends LF_DupBaseFrame 
    {

        protected var m_PlotsRecord:Dictionary;
        protected var m_Plot:IPlot;
        protected var m_has:Boolean;


        private function onClientMsg(_arg_1:AIEvent):void
        {
            if ((((_arg_1 == null)) || ((_arg_1.data == m_param.label)))){
                fireComplete();
            };
        }

        override public function enter(_arg_1:Object):void
        {
            var _local_2:Object = AICore.data.runtime.getData(Constants.RTD_DUP);
            this.m_PlotsRecord = (((_local_2 == null)) ? null : _local_2.plotsRecord);
            var _local_3:int = m_param.value;
            if (((!((this.m_PlotsRecord == null))) && ((this.m_PlotsRecord[_local_3] == 1)))){
                this.m_has = false;
                this.onClientMsg(null);
            } else {
                this.m_has = true;
                AICore.addAIEventListener(AIEvent.ON_CLIENT_MSG, this.onClientMsg);
                if (_local_3 != 0){
                    this.m_Plot = AICore.plotSystem.createPlotByID(_local_3);
                    if (this.m_Plot != null){
                        this.m_Plot.activate();
                    };
                };
            };
        }

        override public function exit():void
        {
            if (this.m_has){
                this.m_has = false;
                AICore.removeAIEventListener(AIEvent.ON_CLIENT_MSG, this.onClientMsg);
                if (this.m_Plot != null){
                    if (this.m_PlotsRecord != null){
                        this.m_PlotsRecord[this.m_Plot.id] = m_param.value1;
                        this.m_PlotsRecord = null;
                    };
                    AICore.plotSystem.breakPlot(this.m_Plot);
                    this.m_Plot = null;
                };
            };
        }

        override public function getType():int
        {
            return (LogicFrameType.LFT_ACTIVE_PLOT);
        }

        public /*  ©init. */ function _SafeStr_1294()
        {
        }


    }
}//package com.tencent.ai.core.timeline.frame

// _SafeStr_1294 = " LF_ActivePlotFrame" (String#14159)



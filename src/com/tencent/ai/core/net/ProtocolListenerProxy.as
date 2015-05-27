// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.net.ProtocolListenerProxy

package com.tencent.ai.core.net
{
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_807;
    import __AS3__.vec.*;

    public class ProtocolListenerProxy implements IProtocolListener 
    {

        private var _cmds:Vector.<int>;
        private var _callbacks:Object;
        private var _net:INetwork;

        public function ProtocolListenerProxy()
        {
            this._cmds = new Vector.<int>();
            this._callbacks = new Object();
        }

        protected function get net():INetwork
        {
            if (this._net == null){
                this._net = AICore.net;
            };
            return (this._net);
        }

        public function addProtocolListener(_arg_1:Class, _arg_2:Function, _arg_3:Boolean=false):void
        {
            if (_arg_3){
                this.net.registerProtocolClass(_arg_1["IN_CMD"], _arg_1);
            };
            this._cmds.push(_arg_1["IN_CMD"]);
            this._callbacks[_arg_1["IN_CMD"]] = _arg_2;
            this.net.addProtocolListener(this);
        }

        public function addProtocolListener2(_arg_1:Class, _arg_2:int, _arg_3:Function, _arg_4:Boolean=false):void
        {
            if (_arg_4){
                this.net.registerProtocolClass(_arg_2, _arg_1);
            };
            this._cmds.push(_arg_2);
            this._callbacks[_arg_2] = _arg_3;
            this.net.addProtocolListener(this);
        }

        public function startALLListener():void
        {
            this.net.addProtocolListener(this);
        }

        public function stopALLListener():void
        {
            this.net.removeProtocolListener(this);
        }

        public function getCmdsInterest():Vector.<int>
        {
            return (this._cmds);
        }

        public function onReceiveADF(_arg_1:ADF, _arg_2:int=-1):void
        {
            var _local_3 = this._callbacks;
            (_local_3[_arg_1.head.cmdID](_arg_1.body));
        }

        public /*  ©init. */ function _SafeStr_807()
        {
        }


    }
}//package com.tencent.ai.core.net

// _SafeStr_807 = " ProtocolListenerProxy" (String#15245)



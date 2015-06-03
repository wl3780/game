package com.tencent.free.core.cmd
{
    import com.tencent.free.core.events.CommandEvent;
    
    import flash.events.EventDispatcher;

    public class BaseCommand extends EventDispatcher 
    {
        protected var m_arg:Object;
        protected var m_useArgCall:Boolean;

        private var _cmdType:String;
        private var _code:int;
		
        public function BaseCommand(type:String, args:Object=null, useArg:Boolean=false)
        {
            _cmdType = type;
            _code = CommandDef.CODE_SUCCESS;
            this.m_arg = args;
            this.m_useArgCall = useArg;
        }

        public function set useArgCall(value:Boolean):void
        {
            this.m_useArgCall = value;
        }

        public function get useArgCall():Boolean
        {
            return this.m_useArgCall;
        }

        public function get cmdType():String
        {
            return _cmdType;
        }

        public function get arg():Object
        {
            return this.m_arg;
        }

        public function get code():int
        {
            return _code;
        }

        public function get isValid():Boolean
        {
            return _code == CommandDef.CODE_SUCCESS;
        }

        public function cancel(cmdCode:int=-1):void
        {
            _code = cmdCode;
            this.dispatchEvent(new CommandEvent(CommandEvent.COMMAND_CANCELED));
        }

        public function finish(cmdCode:int=0):void
        {
            _code = cmdCode;
            this.dispatchEvent(new CommandEvent(CommandEvent.COMMAND_FINISHED));
        }

    }
}

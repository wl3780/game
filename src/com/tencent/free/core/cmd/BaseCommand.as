// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.cmd.BaseCommand

package com.tencent.free.core.cmd
{
    import flash.events.EventDispatcher;
    import com.tencent.free.core.events.CommandEvent;
    import  ©init._SafeStr_3;

    public class BaseCommand extends EventDispatcher 
    {

        private var _cmdType:String;
        private var _code:int;
        protected var m_arg:Object;
        protected var m_useArgCall:Boolean;

        public function BaseCommand(_arg_1:String, _arg_2:Object=null, _arg_3:Boolean=false)
        {
            this._cmdType = _arg_1;
            this._code = CommandDef.CODE_SUCCESS;
            this.m_arg = _arg_2;
            this.m_useArgCall = _arg_3;
        }

        public function set useArgCall(_arg_1:Boolean):void
        {
            this.m_useArgCall = _arg_1;
        }

        public function get useArgCall():Boolean
        {
            return (this.m_useArgCall);
        }

        public function get cmdType():String
        {
            return (this._cmdType);
        }

        public function get arg():Object
        {
            return (this.m_arg);
        }

        public function get code():int
        {
            return (this._code);
        }

        public function get isValid():Boolean
        {
            return ((this._code == CommandDef.CODE_SUCCESS));
        }

        public function cancel(_arg_1:int=-1):void
        {
            this._code = _arg_1;
            dispatchEvent(new CommandEvent(CommandEvent.COMMAND_CANCELED));
        }

        public function finish(_arg_1:int=0):void
        {
            this._code = _arg_1;
            dispatchEvent(new CommandEvent(CommandEvent.COMMAND_FINISHED));
        }

        public /*  ©init. */ function _SafeStr_3()
        {
        }


    }
}//package com.tencent.free.core.cmd

// _SafeStr_3 = " BaseCommand" (String#1367)



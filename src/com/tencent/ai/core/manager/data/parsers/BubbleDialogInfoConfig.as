// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.BubbleDialogInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.BubbleDialog;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_592;
    import com.tencent.ai.core.data.*;
    import __AS3__.vec.*;

    public class BubbleDialogInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var bDialogDicts:Dictionary;

        public function BubbleDialogInfoConfig()
        {
            super(20130427);
            this.bDialogDicts = new Dictionary();
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_6:BubbleDialog;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.BubbleDialog;
            var _local_4:int = _local_3.length();
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_6 = new BubbleDialog();
                _local_6.decode(_local_3[_local_5]);
                this.bDialogDicts[_local_6.id] = _local_6;
                _local_5++;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            if (this.bDialogDicts[_arg_1] != null){
                return (this.bDialogDicts[_arg_1]);
            };
            return (null);
        }

        public function findAll():Object
        {
            var _local_2:BubbleDialog;
            var _local_1:Vector.<BubbleDialog> = new Vector.<BubbleDialog>();
            var _local_3:int;
            var _local_4:* = this.bDialogDicts;
            for each (_local_2 in this.bDialogDicts) {
                _local_1.push(_local_2);
            };
            return (_local_1);
        }

        override public function clearConfig():void
        {
            this.bDialogDicts = new Dictionary();
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            var _local_4:BubbleDialog;
            super.readConfig(_arg_1);
            var _local_2:int = _arg_1.readUnsignedShort();
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = new BubbleDialog();
                _local_4.read(_arg_1);
                this.bDialogDicts[_local_4.id] = _local_4;
                _local_3++;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            super.writeConfig(_arg_1);
            var _local_2:Vector.<BubbleDialog> = (this.findAll() as Vector.<BubbleDialog>);
            var _local_3:int = _local_2.length;
            _arg_1.writeShort(_local_3);
            var _local_4:int;
            while (_local_4 < _local_3) {
                _local_2[_local_4].write(_arg_1);
                _local_4++;
            };
        }

        public /*  ©init. */ function _SafeStr_592()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_592 = " BubbleDialogInfoConfig" (String#16058)



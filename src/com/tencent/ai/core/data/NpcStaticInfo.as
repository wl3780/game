// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.NpcStaticInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import flash.geom.Point;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_289;
    import __AS3__.vec.*;

    public class NpcStaticInfo implements IXMLSerialize, ISerialize 
    {

        public var desc:String;
        public var id:int;
        public var name:String;
        public var assetURL:String;
        public var age:int;
        public var rank:String;
        public var from:String;
        public var bubbleMessageList:Vector.<String>;
        public var dialogMessageList:Vector.<String>;
        public var clickCmd:String = "";
        public var dialogOptionList:Vector.<NpcDialogOptionInfo>;
        public var numTalk:int;
        public var jumpPoint:Point;

        public function NpcStaticInfo()
        {
            this.bubbleMessageList = new Vector.<String>();
            this.dialogMessageList = new Vector.<String>();
            this.dialogOptionList = new Vector.<NpcDialogOptionInfo>();
            this.jumpPoint = new Point();
        }

        public function decode(_arg_1:XML):void
        {
            var _local_4:XML;
            var _local_5:XMLList;
            var _local_6:XML;
            var _local_7:XMLList;
            var _local_8:XML;
            var _local_9:XMLList;
            var _local_10:NpcDialogOptionInfo;
            var _local_11:int;
            var _local_12:int;
            var _local_13:XML;
            this.id = int(_arg_1.@id);
            this.name = String(_arg_1.@name);
            this.assetURL = String(_arg_1.@assetURL);
            this.age = int(_arg_1.@age);
            this.rank = String(_arg_1.@rank);
            this.from = String(_arg_1.@from);
            this.desc = String(_arg_1.@desc);
            this.numTalk = int(_arg_1.@numTalk);
            var _local_2:Array = String(_arg_1.@jump_pos).split(";");
            this.jumpPoint.x = int(_local_2[0]);
            this.jumpPoint.y = int(_local_2[1]);
            var _local_3:XMLList = _arg_1.Msg;
            for each (_local_4 in _local_3) {
                this.bubbleMessageList.push(_local_4.toString());
            };
            _local_5 = _arg_1.Dialog;
            if (_local_5.length()){
                this.clickCmd = "openNpcDialog";
                _local_6 = _local_5[0];
                _local_7 = _local_6.Msg;
                for each (_local_8 in _local_7) {
                    this.dialogMessageList.push(_local_8.toString());
                };
                _local_9 = _local_6.Option;
                _local_11 = _local_9.length();
                _local_12 = 0;
                while (_local_12 < _local_11) {
                    _local_13 = _local_9[_local_12];
                    _local_10 = new NpcDialogOptionInfo();
                    _local_10.decode(_local_13);
                    this.dialogOptionList.push(_local_10);
                    _local_12++;
                };
            };
        }

        public function encode()
        {
            return (null);
        }

        public function read(_arg_1:IDataInput):void
        {
            var _local_5:NpcDialogOptionInfo;
            this.id = _arg_1.readInt();
            this.name = XString.ReadString(_arg_1);
            this.assetURL = XString.ReadString(_arg_1);
            this.age = _arg_1.readInt();
            this.rank = XString.ReadString(_arg_1);
            this.from = XString.ReadString(_arg_1);
            this.desc = XString.ReadString(_arg_1);
            this.numTalk = _arg_1.readInt();
            this.clickCmd = XString.ReadString(_arg_1);
            var _local_2:uint = _arg_1.readUnsignedInt();
            this.bubbleMessageList = new Vector.<String>();
            while (_local_2--) {
                this.bubbleMessageList.push(XString.ReadString(_arg_1));
            };
            var _local_3:uint = _arg_1.readUnsignedInt();
            this.dialogMessageList = new Vector.<String>();
            while (_local_3--) {
                this.dialogMessageList.push(XString.ReadString(_arg_1));
            };
            var _local_4:uint = _arg_1.readUnsignedInt();
            this.dialogOptionList = new Vector.<NpcDialogOptionInfo>();
            while (_local_4--) {
                _local_5 = new NpcDialogOptionInfo();
                _local_5.read(_arg_1);
                this.dialogOptionList.push(_local_5);
            };
            this.jumpPoint = new Point();
            this.jumpPoint.x = _arg_1.readInt();
            this.jumpPoint.y = _arg_1.readInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
            var _local_2:String;
            var _local_3:String;
            var _local_4:NpcDialogOptionInfo;
            _arg_1.writeInt(this.id);
            XString.WriteString(_arg_1, this.name);
            XString.WriteString(_arg_1, this.assetURL);
            _arg_1.writeInt(this.age);
            XString.WriteString(_arg_1, this.rank);
            XString.WriteString(_arg_1, this.from);
            XString.WriteString(_arg_1, this.desc);
            _arg_1.writeInt(this.numTalk);
            XString.WriteString(_arg_1, this.clickCmd);
            _arg_1.writeUnsignedInt(this.bubbleMessageList.length);
            for each (_local_2 in this.bubbleMessageList) {
                XString.WriteString(_arg_1, _local_2);
            };
            _arg_1.writeUnsignedInt(this.dialogMessageList.length);
            for each (_local_3 in this.dialogMessageList) {
                XString.WriteString(_arg_1, _local_3);
            };
            _arg_1.writeUnsignedInt(this.dialogOptionList.length);
            for each (_local_4 in this.dialogOptionList) {
                _local_4.write(_arg_1);
            };
            _arg_1.writeInt(this.jumpPoint.x);
            _arg_1.writeInt(this.jumpPoint.y);
        }

        public /*  ©init. */ function _SafeStr_289()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_289 = " NpcStaticInfo" (String#15077)



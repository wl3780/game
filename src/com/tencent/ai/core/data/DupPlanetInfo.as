// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.DupPlanetInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_237;
    import __AS3__.vec.*;

    public class DupPlanetInfo implements IXMLSerialize, ISerialize 
    {

        public var id:int;
        public var name:String;
        public var uiURL:String;
        public var uiHash:String;
        public var dupStaticInfos:Vector.<DupStaticInfo>;
        public var challengeTips:String;


        public function decode(_arg_1:XML):void
        {
            var _local_5:DupStaticInfo;
            this.id = int(_arg_1.@id);
            this.name = String(_arg_1.@name);
            this.uiURL = (((DEFINE.DUP_RES_SRC + "ui/") + this.id) + ".swf");
            this.uiHash = String(_arg_1.uiHash);
            this.challengeTips = String(_arg_1.@challenge_tips).replace(/\\n/g, "\n");
            this.dupStaticInfos = new Vector.<DupStaticInfo>();
            var _local_2:XMLList = _arg_1.DupStaticInfo;
            var _local_3:int = _local_2.length();
            var _local_4:int;
            while (_local_4 < _local_3) {
                _local_5 = new DupStaticInfo();
                _local_5.decode(_local_2[_local_4]);
                this.dupStaticInfos.push(_local_5);
                _local_4++;
            };
        }

        public function encode()
        {
            return (null);
        }

        public function read(_arg_1:IDataInput):void
        {
            var _local_4:DupStaticInfo;
            this.id = _arg_1.readInt();
            this.name = XString.ReadString(_arg_1);
            this.uiURL = (((DEFINE.DUP_RES_SRC + "ui/") + this.id) + ".swf");
            this.uiHash = XString.ReadString(_arg_1);
            this.challengeTips = XString.ReadString(_arg_1);
            this.dupStaticInfos = new Vector.<DupStaticInfo>();
            var _local_2:int = _arg_1.readUnsignedShort();
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = new DupStaticInfo();
                _local_4.read(_arg_1);
                this.dupStaticInfos.push(_local_4);
                _local_3++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeInt(this.id);
            XString.WriteString(_arg_1, this.name);
            XString.WriteString(_arg_1, this.uiHash);
            XString.WriteString(_arg_1, this.challengeTips);
            var _local_2:int = this.dupStaticInfos.length;
            _arg_1.writeShort(_local_2);
            var _local_3:int;
            while (_local_3 < _local_2) {
                this.dupStaticInfos[_local_3].write(_arg_1);
                _local_3++;
            };
        }

        public /*  ©init. */ function _SafeStr_237()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_237 = " DupPlanetInfo" (String#14174)



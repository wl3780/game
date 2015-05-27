// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.DoorInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_233;

    public class DoorInfo implements IXMLSerialize, ISerialize 
    {

        public var id:int;
        public var interactID:int;
        public var toSceneID:int;
        public var scriptCmd:String;
        public var tingeInfo:TingeInfo;
        public var adjustColorInfo:AdjustColorInfo;
        public var hasGoneScene:String = "";
        public var x:int;
        public var z:int;
        public var radius:int;


        public function decode(_arg_1:XML):void
        {
            this.id = _arg_1.@id;
            this.interactID = _arg_1.@interactID;
            this.hasGoneScene = _arg_1.@hasGoneScene;
            this.toSceneID = _arg_1.@toSceneID;
            this.scriptCmd = _arg_1.@scriptCmd;
            this.x = _arg_1.@x;
            this.z = _arg_1.@z;
            this.radius = int(_arg_1.@radius);
            if (!this.radius){
                this.radius = 50;
            };
            if (_arg_1.hasOwnProperty("Tinge")){
                this.tingeInfo = new TingeInfo();
                this.tingeInfo.decode(_arg_1.Tinge[0]);
            };
            if (_arg_1.hasOwnProperty("AdjustColor")){
                this.adjustColorInfo = new AdjustColorInfo();
                this.adjustColorInfo.decode(_arg_1.AdjustColor[0]);
            };
        }

        public function encode()
        {
            var _local_1:XML = <Door/>
            ;
            _local_1.@id = this.id;
            _local_1.@interactID = this.interactID;
            if (((!((this.hasGoneScene == null))) && (!((this.hasGoneScene == ""))))){
                _local_1.@hasGoneScene = this.hasGoneScene;
            };
            _local_1.@toSceneID = this.toSceneID;
            _local_1.@x = this.x;
            _local_1.@z = this.z;
            _local_1.@radius = ((this.radius) ? (this.radius) : 50);
            _local_1.@scriptCmd = this.scriptCmd;
            if (((this.tingeInfo) && (!(this.tingeInfo.isEmpty())))){
                _local_1.Tinge = (_local_1.Tinge + (this.tingeInfo.encode() as XML));
            };
            if (((this.adjustColorInfo) && (!(this.adjustColorInfo.isEmpty())))){
                _local_1.AdjustColor = (_local_1.AdjustColor + (this.adjustColorInfo.encode() as XML));
            };
            return (_local_1);
        }

        public function read(_arg_1:IDataInput):void
        {
            this.id = _arg_1.readInt();
            this.interactID = _arg_1.readInt();
            this.hasGoneScene = XString.ReadString(_arg_1);
            this.toSceneID = _arg_1.readInt();
            this.x = _arg_1.readInt();
            this.z = _arg_1.readInt();
            this.radius = _arg_1.readInt();
            this.scriptCmd = XString.ReadString(_arg_1);
            if (_arg_1.readBoolean()){
                this.tingeInfo = new TingeInfo();
                this.tingeInfo.read(_arg_1);
            };
            if (_arg_1.readBoolean()){
                this.adjustColorInfo = new AdjustColorInfo();
                this.adjustColorInfo.read(_arg_1);
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeInt(this.id);
            _arg_1.writeInt(this.interactID);
            XString.WriteString(_arg_1, this.hasGoneScene);
            _arg_1.writeInt(this.toSceneID);
            _arg_1.writeInt(this.x);
            _arg_1.writeInt(this.z);
            _arg_1.writeInt(this.radius);
            XString.WriteString(_arg_1, this.scriptCmd);
            if (((this.tingeInfo) && (!(this.tingeInfo.isEmpty())))){
                _arg_1.writeBoolean(true);
                this.tingeInfo.write(_arg_1);
            } else {
                _arg_1.writeBoolean(false);
            };
            if (((this.adjustColorInfo) && (!(this.adjustColorInfo.isEmpty())))){
                _arg_1.writeBoolean(true);
                this.adjustColorInfo.write(_arg_1);
            } else {
                _arg_1.writeBoolean(false);
            };
        }

        public /*  ©init. */ function _SafeStr_233()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_233 = " DoorInfo" (String#16901)



// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.SpecialStatusInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.manager.data.DEFINE;
    import  ©init._SafeStr_337;
    import __AS3__.vec.*;

    public class SpecialStatusInfo implements IXMLSerialize 
    {

        public var id:int;
        public var type:int;
        public var classID:int;
        public var priority:int;
        public var duration:int;
        public var typeInfo:SSTypeInfo;
        public var statusEventInfos:Vector.<StatusEventInfo>;
        public var statusDes:String;


        public function decode(_arg_1:XML):void
        {
            var _local_6:StatusEventInfo;
            this.id = int(_arg_1.@id);
            this.type = int(_arg_1.@type);
            this.priority = int(_arg_1.@priority);
            this.duration = int(_arg_1.@duration);
            this.typeInfo = DEFINE.DM.getSSTypeInfo(this.type);
            this.classID = this.typeInfo.classID;
            var _local_2:XMLList = _arg_1.StatusEventInfo;
            var _local_3:int = _local_2.length();
            this.statusEventInfos = new Vector.<StatusEventInfo>();
            var _local_4:int;
            while (_local_4 < _local_3) {
                _local_6 = new StatusEventInfo();
                _local_6.decode(_local_2[_local_4]);
                this.statusEventInfos.push(_local_6);
                _local_4++;
            };
            var _local_5:XML = _arg_1.StatusDes[0];
            this.statusDes = (((_local_5 == null)) ? "" : _local_5.toString());
        }

        public function encode()
        {
            return (null);
        }

        public /*  ©init. */ function _SafeStr_337()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_337 = " SpecialStatusInfo" (String#14147)



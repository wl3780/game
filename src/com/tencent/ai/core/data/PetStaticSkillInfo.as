// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.PetStaticSkillInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_305;
    import __AS3__.vec.*;

    public class PetStaticSkillInfo implements IXMLSerialize, ISerialize 
    {

        public var learnLevel:int;
        public var skillIDs:Vector.<int>;


        public function decode(_arg_1:XML):void
        {
            this.learnLevel = int(_arg_1.@learn_lvl);
            this.skillIDs = Vector.<int>(String(_arg_1.@skill_id).split(","));
        }

        public function encode()
        {
            return (null);
        }

        public function read(_arg_1:IDataInput):void
        {
            this.learnLevel = _arg_1.readInt();
            var _local_2:uint = _arg_1.readUnsignedInt();
            this.skillIDs = new Vector.<int>();
            while (_local_2--) {
                this.skillIDs.push(_arg_1.readInt());
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            var _local_2:int;
            _arg_1.writeInt(this.learnLevel);
            _arg_1.writeUnsignedInt(this.skillIDs.length);
            var _local_3:int;
            var _local_4:* = this.skillIDs;
            for each (_local_2 in this.skillIDs) {
                _arg_1.writeInt(_local_2);
            };
        }

        public /*  ©init. */ function _SafeStr_305()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_305 = " PetStaticSkillInfo" (String#15449)



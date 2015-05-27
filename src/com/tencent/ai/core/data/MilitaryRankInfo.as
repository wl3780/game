// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.MilitaryRankInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_271;

    public class MilitaryRankInfo implements IXMLSerialize, ISerialize 
    {

        public var level:int;
        public var gradeLimit:int;
        public var meritRequire:int;
        public var badgeID:int;


        public function decode(_arg_1:XML):void
        {
            this.level = int(_arg_1.@level);
            this.gradeLimit = int(_arg_1.@grade_limit);
            this.meritRequire = int(_arg_1.@merit_require);
            this.badgeID = int(_arg_1.@badge);
        }

        public function encode()
        {
            var _local_1:XML = <Rank/>
            ;
            _local_1.@level = this.level;
            _local_1.@grade_limit = this.gradeLimit;
            _local_1.@merit_require = this.meritRequire;
            _local_1.@badge = this.badgeID;
            return (_local_1);
        }

        public function read(_arg_1:IDataInput):void
        {
            this.level = _arg_1.readInt();
            this.gradeLimit = _arg_1.readInt();
            this.meritRequire = _arg_1.readInt();
            this.badgeID = _arg_1.readInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeInt(this.level);
            _arg_1.writeInt(this.gradeLimit);
            _arg_1.writeInt(this.meritRequire);
            _arg_1.writeInt(this.badgeID);
        }

        public /*  ©init. */ function _SafeStr_271()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_271 = " MilitaryRankInfo" (String#14267)



// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.CareerGrowUpPluginArg

package com.tencent.ai.core.data.arg
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import  ©init._SafeStr_193;

    public class CareerGrowUpPluginArg implements IXMLSerialize 
    {

        public static const CAREER_TRANS:int = 1;
        public static const CAREER_WEAR:int = 2;
        public static const UPDATE_CAREER:int = 3;
        public static const JOIN_TEAM:int = 4;

        public var growUpType:int;
        public var missionID:int;
        public var phaseID:int;
        public var nextCareerID:int;
        public var careerTypeLimit:int;


        public function decode(_arg_1:XML):void
        {
            this.growUpType = int(_arg_1.@growUpType);
            this.missionID = int(_arg_1.@missionID);
            this.nextCareerID = int(_arg_1.@nextCareerID);
            this.phaseID = int(_arg_1.@phaseID);
            this.careerTypeLimit = int(_arg_1.@careerTypeLimit);
        }

        public function encode()
        {
            var _local_1:XML = <PluginArg/>
            ;
            _local_1.@growUpType = this.growUpType;
            _local_1.@missionID = this.missionID;
            _local_1.@nextCareerID = this.nextCareerID;
            _local_1.@phaseID = this.phaseID;
            _local_1.@careerTypeLimit = this.careerTypeLimit;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_193()
        {
        }


    }
}//package com.tencent.ai.core.data.arg

// _SafeStr_193 = " CareerGrowUpPluginArg" (String#14399)



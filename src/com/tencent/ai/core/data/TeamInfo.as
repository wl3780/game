// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.TeamInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_346;
    import __AS3__.vec.*;

    public class TeamInfo implements ISerialize 
    {

        public var teamID:uint;
        public var teamCreateInfo:TeamCreateInfo;
        public var numMember:uint;
        public var teamMemberList:Vector.<TeamMemberInfo>;
        public var leader:TeamMemberInfo;


        public function read(_arg_1:IDataInput):void
        {
            var _local_3:TeamMemberInfo;
            this.teamID = _arg_1.readUnsignedInt();
            this.teamCreateInfo = new TeamCreateInfo();
            this.teamCreateInfo.read(_arg_1);
            this.numMember = _arg_1.readUnsignedShort();
            this.teamMemberList = new Vector.<TeamMemberInfo>(this.numMember, true);
            var _local_2:int;
            while (_local_2 < this.numMember) {
                _local_3 = new TeamMemberInfo();
                _local_3.read(_arg_1);
                this.teamMemberList[_local_2] = _local_3;
                if (_local_3.isLeader){
                    this.leader = _local_3;
                };
                _local_2++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public function reset():void
        {
            this.teamID = 0;
            this.teamCreateInfo = null;
            this.numMember = 0;
            this.teamMemberList.fixed = false;
            this.teamMemberList.length = 0;
            this.leader = null;
        }

        public function get isEmpty():Boolean
        {
            return ((this.teamID == 0));
        }

        public function getMainTeamMemberInfo():TeamMemberInfo
        {
            var _local_1:TeamMemberInfo;
            for each (_local_1 in this.teamMemberList) {
                if (_local_1.playerID.equal(AICore.data.mainModel.playerInfo.playerID)){
                    return (_local_1);
                };
            };
            return (null);
        }

        public /*  ©init. */ function _SafeStr_346()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_346 = " TeamInfo" (String#15392)



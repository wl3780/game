// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.TeamTagInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import com.tencent.free.utils.XString;
    import com.tencent.ai.core.enum.Constants;
    import com.tencent.ai.core.net.ProtocolHelper;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_350;
    import __AS3__.vec.*;

    public class TeamTagInfo implements ISerialize 
    {

        public var teamID:uint;
        public var name:String;
        public var maxNum:int;
        public var currentNum:int;
        public var playerIDs:Vector.<PlayerID>;
        public var teamVipInfo:VipSimpleInfo;
        private var _containsMainPlayer:Boolean;


        public function get containsMainPlayer():Boolean
        {
            return (this._containsMainPlayer);
        }

        public function read(_arg_1:IDataInput):void
        {
            var _local_3:PlayerID;
            this.teamID = _arg_1.readUnsignedInt();
            this.name = XString.ReadChars(_arg_1, Constants.MAX_TEAM_NAME_LEN);
            this.maxNum = _arg_1.readUnsignedByte();
            this.currentNum = _arg_1.readUnsignedShort();
            this.playerIDs = new Vector.<PlayerID>();
            var _local_2:int;
            while (_local_2 < this.currentNum) {
                _local_3 = new PlayerID();
                _local_3.read(_arg_1);
                this.playerIDs.push(_local_3);
                if (_local_3.equal(ProtocolHelper.clientPlayerID)){
                    this._containsMainPlayer = true;
                };
                _local_2++;
            };
            this.teamVipInfo = new VipSimpleInfo();
            this.teamVipInfo.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public function get inTeam():Boolean
        {
            return (!((this.teamID == 0)));
        }

        public function get isFull():Boolean
        {
            return ((this.currentNum == this.maxNum));
        }

        public function contains(_arg_1:PlayerID):Boolean
        {
            var _local_2:PlayerID;
            for each (_local_2 in this.playerIDs) {
                if (_arg_1.equal(_local_2)){
                    return (true);
                };
            };
            return (false);
        }

        public /*  ©init. */ function _SafeStr_350()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_350 = " TeamTagInfo" (String#14945)



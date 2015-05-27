// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.EthnicInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.EthnicInfo;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.manager.data.IDataManager;
    import com.tencent.ai.core.data.SkillGroup;
    import  ©init._SafeStr_611;
    import com.tencent.ai.core.data.*;
    import __AS3__.vec.*;

    public class EthnicInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var ethnics:Vector.<EthnicInfo>;

        public function EthnicInfoConfig()
        {
            this.ethnics = new Vector.<EthnicInfo>(6);
        }

        protected function decodeEthnicSkills(_arg_1:EthnicInfo):void
        {
            var _local_2:IDataManager = DEFINE.DM;
            var _local_3:String = _arg_1.defaultSkillIDsStr;
            var _local_4:Array = (((_local_3.indexOf(",") == -1)) ? [] : _local_3.split(","));
            var _local_5:Vector.<SkillGroup> = new Vector.<SkillGroup>();
            var _local_6:int;
            while (_local_6 < _local_4.length) {
                _local_5.push(_local_2.getSkillGroup(int(_local_4[_local_6])));
                _local_6++;
            };
            _arg_1.defaultSkills = _local_5;
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_6:XML;
            var _local_7:EthnicInfo;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.EthnicInfo;
            var _local_4:int = _local_3.length();
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_6 = _local_3[_local_5];
                _local_7 = new EthnicInfo();
                _local_7.decode(_local_6);
                this.decodeEthnicSkills(_local_7);
                this.ethnics[_local_7.id] = _local_7;
                _local_5++;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            return (this.ethnics[_arg_1]);
        }

        public function findAll():Object
        {
            return (this.ethnics);
        }

        public /*  ©init. */ function _SafeStr_611()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_611 = " EthnicInfoConfig" (String#13880)



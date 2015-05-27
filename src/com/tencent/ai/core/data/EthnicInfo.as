// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.EthnicInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import flash.geom.Point;
    import __AS3__.vec.Vector;
    import flash.utils.Dictionary;
    import  ©init._SafeStr_254;
    import __AS3__.vec.*;

    public class EthnicInfo implements IXMLSerialize 
    {

        public var id:int;
        public var name:String;
        public var materialType:int;
        public var factoryClass:String;
        public var viewSize:Point;
        public var originPos:Point;
        public var defaultSEID:int;
        public var defaultBEID:int;
        public var defaultWeaponID:int;
        public var defaultSkillIDsStr:String;
        public var defaultSkills:Vector.<SkillGroup>;
        public var defaultActionInfos:Vector.<ActionInfo>;
        public var actionInfos:Dictionary;


        public function decode(_arg_1:XML):void
        {
            var _local_6:ActionInfo;
            this.id = int(_arg_1.@id);
            this.name = String(_arg_1.@name);
            this.materialType = int(_arg_1.@materialType);
            this.factoryClass = String(_arg_1.@factoryClass);
            var _local_2:XML = _arg_1.DefaultParams[0];
            if (_local_2 != null){
                this.viewSize = new Point(int(_local_2.@width), int(_local_2.@height));
                this.defaultSEID = int(_local_2.@SEID);
                this.defaultBEID = int(_local_2.@BEID);
                this.defaultWeaponID = int(_local_2.@weaponID);
                this.defaultSkillIDsStr = String(_local_2.@skillIDs);
            };
            _local_2 = _arg_1.OriginPos[0];
            this.originPos = new Point(int(_local_2.@x), int(_local_2.@y));
            var _local_3:XMLList = _arg_1.ActionInfos[0].ActionInfo;
            var _local_4:int = _local_3.length();
            this.actionInfos = new Dictionary();
            this.defaultActionInfos = new Vector.<ActionInfo>();
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_6 = new ActionInfo();
                _local_6.decode(_local_3[_local_5]);
                this.actionInfos[_local_6.id] = _local_6;
                if (_local_6.isDefault){
                    this.defaultActionInfos.push(_local_6);
                };
                _local_5++;
            };
        }

        public function encode()
        {
            var _local_4:ActionInfo;
            var _local_1:XML = <EthnicInfo/>
            ;
            _local_1.@id = this.id;
            _local_1.@name = this.name;
            _local_1.@materialType = this.materialType;
            _local_1.@factoryClass = this.factoryClass;
            var _local_2:XML = <DefaultParams/>
            ;
            _local_2.@width = this.viewSize.x;
            _local_2.@height = this.viewSize.y;
            _local_2.@SEID = this.defaultSEID;
            _local_2.@BEID = this.defaultBEID;
            _local_2.@weaponID = this.defaultWeaponID;
            _local_2.@skillIDs = this.defaultSkillIDsStr;
            _local_1.appendChild(_local_2);
            _local_2 = <OriginPos/>
            ;
            _local_2.@x = this.originPos.x;
            _local_2.@y = this.originPos.y;
            _local_1.appendChild(_local_2);
            var _local_3:XML = <ActionInfos/>
            ;
            if (this.actionInfos != null){
                for each (_local_4 in this.actionInfos) {
                    _local_3.appendChild(_local_4.encode());
                };
            };
            _local_1.appendChild(_local_3);
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_254()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_254 = " EthnicInfo" (String#17279)



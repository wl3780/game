// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.ActionInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import __AS3__.vec.Vector;
    import flash.utils.Dictionary;
    import  ©init._SafeStr_204;
    import __AS3__.vec.*;

    public class ActionInfo implements IXMLSerialize 
    {

        public var id:int;
        public var name:String;
        public var className:String;
        public var to:String;
        public var isDefault:Boolean;
        public var actionType:int;
        public var vKeyInfos:Vector.<VKeyInfo>;
        public var actionStates:Dictionary;
        public var hotVKeyUp:int;


        public function decode(_arg_1:XML):void
        {
            var _local_4:int;
            var _local_5:VKeyInfo;
            var _local_6:ActionState;
            this.id = int(_arg_1.@id);
            this.name = String(_arg_1.@name);
            this.className = String(_arg_1.@className);
            if (this.id >= 1000){
                throw (new Error("[ActionInfo] 动作ID不能大于1000"));
            };
            this.to = String(_arg_1.@to);
            this.isDefault = (String(_arg_1.@isDefault) == "true");
            this.actionType = int(_arg_1.@actionType);
            this.hotVKeyUp = int(_arg_1.@hotVKeyUp);
            var _local_2:XMLList = _arg_1.VKeyInfo;
            var _local_3:int = _local_2.length();
            if (_local_3 > 0){
                this.vKeyInfos = new Vector.<VKeyInfo>();
                _local_4 = 0;
                while (_local_4 < _local_3) {
                    _local_5 = new VKeyInfo();
                    _local_5.decode(_local_2[_local_4]);
                    this.vKeyInfos.push(_local_5);
                    _local_4++;
                };
            };
            _local_2 = _arg_1.ActionState;
            _local_3 = _local_2.length();
            if (_local_3 > 0){
                this.actionStates = new Dictionary();
                _local_4 = 0;
                while (_local_4 < _local_3) {
                    _local_6 = new ActionState();
                    _local_6.decode(_local_2[_local_4]);
                    this.actionStates[_local_6.index] = _local_6;
                    _local_4++;
                };
            };
        }

        public function switchTo(_arg_1:int):Boolean
        {
            if (this.to == "-1"){
                return (true);
            };
            return (!((this.to.indexOf((("," + _arg_1) + ",")) == -1)));
        }

        public function encode()
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:ActionState;
            var _local_1:XML = <ActionInfo/>
            ;
            _local_1.@id = this.id;
            _local_1.@name = this.name;
            _local_1.@className = this.className;
            if (this.to != "null"){
                _local_1.@to = this.to;
            };
            if (this.isDefault){
                _local_1.@isDefault = "true";
            };
            _local_1.@actionType = this.actionType;
            _local_1.@hotVKeyUp = this.hotVKeyUp;
            if (((!((this.vKeyInfos == null))) && (!((this.vKeyInfos.length == 0))))){
                _local_2 = this.vKeyInfos.length;
                _local_3 = 0;
                while (_local_3 < _local_2) {
                    _local_1.appendChild(this.vKeyInfos[_local_3].encode());
                    _local_3++;
                };
            };
            if (this.actionStates != null){
                for each (_local_4 in this.actionStates) {
                    _local_1.appendChild(_local_4.encode());
                };
            };
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_204()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_204 = " ActionInfo" (String#14477)



// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.SceneItemInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.arg.sceneProperty.PropertyArg;
    import  ©init._SafeStr_319;
    import __AS3__.vec.*;

    public class SceneItemInfo implements IXMLSerialize 
    {

        public var id:int;
        public var deep:int;
        public var x:int;
        public var z:int;
        public var resPath:String;
        public var className:String;
        public var propertyArgList:Vector.<PropertyArg>;
        public var type:String;
        public var alpha:Number = 1;
        public var renderLevel:int = -1;
        public var width:int;
        public var height:int;


        public function decode(_arg_1:XML):void
        {
            var _local_2:XML;
            var _local_3:PropertyArg;
            this.id = int(_arg_1.@id);
            this.deep = int(_arg_1.@deep);
            this.x = int(_arg_1.@x);
            this.z = int(_arg_1.@z);
            this.resPath = String(_arg_1.@resPath);
            this.className = String(_arg_1.@className);
            this.type = String(_arg_1.@type);
            this.alpha = ((_arg_1.hasOwnProperty("@alpha")) ? Number(_arg_1.@alpha) : 1);
            this.renderLevel = ((_arg_1.hasOwnProperty("@renderLevel")) ? (Number(_arg_1.@renderLevel)) : -1);
            this.width = ((_arg_1.hasOwnProperty("@w")) ? Number(_arg_1.@w) : 0);
            this.height = ((_arg_1.hasOwnProperty("@h")) ? Number(_arg_1.@h) : 0);
            this.propertyArgList = new Vector.<PropertyArg>();
            for each (_local_2 in _arg_1.property) {
                _local_3 = PropertyArg.newArg(_local_2.@type);
                _local_3.decode(_local_2);
                this.propertyArgList.push(_local_3);
            };
        }

        public function encode()
        {
            var _local_2:PropertyArg;
            var _local_1:XML = <Item/>
            ;
            _local_1.@id = this.id;
            _local_1.@deep = this.deep;
            _local_1.@x = this.x;
            _local_1.@z = this.z;
            _local_1.@resPath = this.resPath;
            _local_1.@className = this.className;
            _local_1.@type = this.type;
            _local_1.@alpha = this.alpha;
            _local_1.@renderLevel = this.renderLevel;
            _local_1.@w = this.width;
            _local_1.@h = this.height;
            for each (_local_2 in this.propertyArgList) {
                _local_1.property = (_local_1.property + _local_2.encode());
            };
            return (_local_1);
        }

        public function clone():SceneItemInfo
        {
            var _local_2:PropertyArg;
            var _local_1:SceneItemInfo = new SceneItemInfo();
            _local_1.id = -1;
            _local_1.deep = this.deep;
            _local_1.x = this.x;
            _local_1.z = this.z;
            _local_1.resPath = this.resPath;
            _local_1.className = this.className;
            _local_1.type = this.type;
            _local_1.alpha = this.alpha;
            _local_1.renderLevel = this.renderLevel;
            _local_1.propertyArgList = new Vector.<PropertyArg>();
            for each (_local_2 in this.propertyArgList) {
                _local_1.propertyArgList.push(_local_2.clone());
            };
            return (_local_1);
        }

        public function removeProperty(_arg_1:String):void
        {
            var _local_2:int = this.propertyArgList.length;
            while (_local_2--) {
                if (this.propertyArgList[_local_2].type == _arg_1){
                    this.propertyArgList.splice(_local_2, 1);
                };
            };
        }

        public /*  ©init. */ function _SafeStr_319()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_319 = " SceneItemInfo" (String#16382)



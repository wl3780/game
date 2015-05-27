// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.MovieStaticInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.MovieStaticInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_625;
    import com.tencent.ai.core.data.*;

    public class MovieStaticInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var m_movieStaticInfosArr:Array;
        public var m_movieStaticInfosMap:Dictionary;

        public function MovieStaticInfoConfig()
        {
            super(0);
            this.m_movieStaticInfosArr = [];
            this.m_movieStaticInfosMap = new Dictionary();
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_6:MovieStaticInfo;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.MovieStaticInfo;
            var _local_4:int = _local_3.length();
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_6 = new MovieStaticInfo();
                _local_6.decode(_local_3[_local_5]);
                this.m_movieStaticInfosArr.push(_local_6);
                this.m_movieStaticInfosMap[_local_6.id] = _local_6;
                _local_5++;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            return (this.m_movieStaticInfosMap[_arg_1]);
        }

        public function findAll():Object
        {
            return (this.m_movieStaticInfosArr);
        }

        override public function clearConfig():void
        {
            this.m_movieStaticInfosArr = [];
            this.m_movieStaticInfosMap = new Dictionary();
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            var _local_4:MovieStaticInfo;
            super.readConfig(_arg_1);
            var _local_2:int = _arg_1.readUnsignedShort();
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = new MovieStaticInfo();
                _local_4.read(_arg_1);
                this.m_movieStaticInfosArr.push(_local_4);
                this.m_movieStaticInfosMap[_local_4.id] = _local_4;
                _local_3++;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            super.writeConfig(_arg_1);
            var _local_2:Array = (this.findAll() as Array);
            var _local_3:int = _local_2.length;
            _arg_1.writeShort(_local_3);
            var _local_4:int;
            while (_local_4 < _local_3) {
                (_local_2[_local_4] as MovieStaticInfo).write(_arg_1);
                _local_4++;
            };
        }

        public /*  ©init. */ function _SafeStr_625()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_625 = " MovieStaticInfoConfig" (String#17036)



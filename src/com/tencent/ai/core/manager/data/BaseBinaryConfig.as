// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.BaseBinaryConfig

package com.tencent.ai.core.manager.data
{
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_652;

    public class BaseBinaryConfig implements IBinaryConfig 
    {

        protected var m_version:uint;
        protected var m_objectTypes:Array;

        public function BaseBinaryConfig(_arg_1:uint=0)
        {
            this.m_version = _arg_1;
            this.m_objectTypes = [];
        }

        public function clearConfig():void
        {
            throw (new Error("[BaseBinaryConfig] clearConfig 必需要override实现!"));
        }

        public function registerObjectType(_arg_1:int, _arg_2:Class, _arg_3:Array):void
        {
            this.m_objectTypes[_arg_1] = new ObjectTypeDef(_arg_2, _arg_3);
        }

        public function readObject(_arg_1:int, _arg_2:IDataInput):Object
        {
            var _local_8:SerItem;
            var _local_9:Object;
            var _local_3:ObjectTypeDef = this.m_objectTypes[_arg_1];
            var _local_4:Object = new _local_3.cls();
            var _local_5:Vector.<SerItem> = _local_3.readlist;
            var _local_6:int = _local_5.length;
            var _local_7:int;
            while (_local_7 < _local_6) {
                _local_8 = _local_5[_local_7];
                _local_9 = _local_8.func(_arg_2);
                _local_4[_local_8.name] = (((_local_8.tFunc)!=null) ? _local_8.tFunc(_local_9) : _local_9);
                _local_7++;
            };
            return (_local_4);
        }

        public function writeObject(_arg_1:int, _arg_2:Object, _arg_3:IDataInput):void
        {
            var _local_9:SerItem;
            var _local_10:Object;
            var _local_4:ObjectTypeDef = this.m_objectTypes[_arg_1];
            var _local_5:Object = _arg_2;
            var _local_6:Vector.<SerItem> = _local_4.writelist;
            var _local_7:int = _local_6.length;
            var _local_8:int;
            while (_local_8 < _local_7) {
                _local_9 = _local_6[_local_8];
                _local_10 = _local_5[_local_9.name];
                _local_10 = (((_local_9.tFunc)!=null) ? _local_9.tFunc(_local_10) : _local_10);
                _local_9.func(_arg_3, _local_10);
                _local_8++;
            };
        }

        public function readConfig(_arg_1:IDataInput):void
        {
            if (_arg_1.bytesAvailable < 3){
                throw (ArgumentError("[BaseBinaryConfig] 数据格式不正确"));
            };
            if (_arg_1.readUTFBytes(3) != "FAI"){
                throw (ArgumentError("[BaseBinaryConfig] 数据格式不正确"));
            };
            var _local_2:uint = _arg_1.readUnsignedInt();
            if (_local_2 != this.m_version){
                throw (new Error("[BaseBinaryConfig] 解析配置的版本号不匹配"));
            };
        }

        public function writeConfig(_arg_1:IDataOutput):void
        {
            _arg_1.writeUTFBytes("FAI");
            _arg_1.writeUnsignedInt(this.m_version);
        }

        public function getVersion():uint
        {
            return (this.m_version);
        }

        public /*  ©init. */ function _SafeStr_652()
        {
        }


    }
}//package com.tencent.ai.core.manager.data

import __AS3__.vec.Vector;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;
import com.tencent.free.utils.XString;
import  ©init._SafeStr_653;
import  ©init._SafeStr_654;
import __AS3__.vec.*;

class ObjectTypeDef 
{

    public static var FUNCS:Array = [[ObjectTypeDef.readInt, ObjectTypeDef.writeInt], [ObjectTypeDef.readUnsignedInt, ObjectTypeDef.writeUnsignedInt], [ObjectTypeDef.readByte, ObjectTypeDef.writeByte], [ObjectTypeDef.readUnsignedByte, ObjectTypeDef.writeByte], [ObjectTypeDef.readShort, ObjectTypeDef.writeShort], [ObjectTypeDef.readUnsignedShort, ObjectTypeDef.writeShort], [ObjectTypeDef.readFloat, ObjectTypeDef.writeFloat], [ObjectTypeDef.readDouble, ObjectTypeDef.writeDouble], [ObjectTypeDef.readBoolean, ObjectTypeDef.writeBoolean], [ObjectTypeDef.readString, ObjectTypeDef.writeString]];

    public var cls:Class;
    public var readlist:Vector.<SerItem>;
    public var writelist:Vector.<SerItem>;

    public function ObjectTypeDef(_arg_1:Class, _arg_2:Array)
    {
        this.cls = _arg_1;
        this.initAttribs(_arg_2);
    }

    public static function readInt(_arg_1:IDataInput):int
    {
        return (_arg_1.readInt());
    }

    public static function writeInt(_arg_1:IDataOutput, _arg_2:int):void
    {
        _arg_1.writeInt(_arg_2);
    }

    public static function readUnsignedInt(_arg_1:IDataInput):uint
    {
        return (_arg_1.readUnsignedInt());
    }

    public static function writeUnsignedInt(_arg_1:IDataOutput, _arg_2:uint):void
    {
        _arg_1.writeUnsignedInt(_arg_2);
    }

    public static function readByte(_arg_1:IDataInput):int
    {
        return (_arg_1.readByte());
    }

    public static function writeByte(_arg_1:IDataOutput, _arg_2:int):void
    {
        _arg_1.writeByte(_arg_2);
    }

    public static function readUnsignedByte(_arg_1:IDataInput):uint
    {
        return (_arg_1.readUnsignedByte());
    }

    public static function readShort(_arg_1:IDataInput):int
    {
        return (_arg_1.readShort());
    }

    public static function writeShort(_arg_1:IDataOutput, _arg_2:Number):void
    {
        _arg_1.writeShort(_arg_2);
    }

    public static function readUnsignedShort(_arg_1:IDataInput):uint
    {
        return (_arg_1.readUnsignedShort());
    }

    public static function readFloat(_arg_1:IDataInput):Number
    {
        return (_arg_1.readFloat());
    }

    public static function writeFloat(_arg_1:IDataOutput, _arg_2:Number):void
    {
        _arg_1.writeFloat(_arg_2);
    }

    public static function readDouble(_arg_1:IDataInput):Number
    {
        return (_arg_1.readDouble());
    }

    public static function writeDouble(_arg_1:IDataOutput, _arg_2:Number):void
    {
        _arg_1.writeDouble(_arg_2);
    }

    public static function readBoolean(_arg_1:IDataInput):Boolean
    {
        return (_arg_1.readBoolean());
    }

    public static function writeBoolean(_arg_1:IDataOutput, _arg_2:Boolean):void
    {
        _arg_1.writeBoolean(_arg_2);
    }

    public static function readString(_arg_1:IDataInput):String
    {
        return (XString.ReadString(_arg_1));
    }

    public static function writeString(_arg_1:IDataOutput, _arg_2:String):void
    {
        XString.WriteString(_arg_1, _arg_2);
    }


    /*private*/ function initAttribs(_arg_1:Array):void
    {
        var _local_4:Object;
        var _local_5:SerItem;
        var _local_6:SerItem;
        var _local_7:String;
        var _local_8:int;
        var _local_9:Function;
        var _local_10:Function;
        var _local_11:Array;
        var _local_2:int = _arg_1.length;
        this.readlist = new Vector.<SerItem>();
        this.writelist = new Vector.<SerItem>();
        var _local_3:int;
        while (_local_3 < _local_2) {
            _local_4 = _arg_1[_local_3];
            _local_5 = null;
            _local_6 = null;
            _local_7 = _local_4.name;
            _local_8 = _local_4.type;
            _local_9 = _local_4.rtFunc;
            _local_10 = _local_4.wtFunc;
            _local_11 = FUNCS[_local_8];
            if (_local_11 == null){
                throw (new Error("不支持此种类型的序列化与反序列化！"));
            };
            this.readlist.push(new SerItem(_local_7, _local_11[0], _local_9));
            this.writelist.push(new SerItem(_local_7, _local_11[1], _local_10));
            _local_3++;
        };
    }

    public /*  ©init. */ function _SafeStr_653()
    {
    }


}
class SerItem 
{

    public var name:String;
    public var func:Function;
    public var tFunc:Function;

    public function SerItem(_arg_1:String, _arg_2:Function, _arg_3:Function)
    {
        this.name = _arg_1;
        this.func = _arg_2;
        this.tFunc = _arg_3;
    }

    public /*  ©init. */ function _SafeStr_654()
    {
    }


}

// _SafeStr_652 = " BaseBinaryConfig" (String#13871)
// _SafeStr_653 = " ObjectTypeDef" (String#13865)
// _SafeStr_654 = " SerItem" (String#13868)



// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.TingeInfo

package com.tencent.ai.core.data
{
    import fl.motion.Color;
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import flash.geom.ColorTransform;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_351;

    public class TingeInfo extends Color implements IXMLSerialize, ISerialize 
    {

        public static var NULL:ColorTransform = new ColorTransform();

        public function TingeInfo(_arg_1:Number=1, _arg_2:Number=1, _arg_3:Number=1, _arg_4:Number=1, _arg_5:Number=0, _arg_6:Number=0, _arg_7:Number=0, _arg_8:Number=0)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8);
        }

        public static function getSaturationMatrix(_arg_1:Number):Array
        {
            _arg_1 = Math.max(-100, Math.min(_arg_1, 100));
            var _local_2:Number = (1 + (((_arg_1)>0) ? ((3 * _arg_1) / 100) : (_arg_1 / 100)));
            var _local_3:Number = 0.3086;
            var _local_4:Number = 0.6094;
            var _local_5:Number = 0.082;
            return ([((_local_3 * (1 - _local_2)) + _local_2), (_local_4 * (1 - _local_2)), (_local_5 * (1 - _local_2)), 0, 0, (_local_3 * (1 - _local_2)), ((_local_4 * (1 - _local_2)) + _local_2), (_local_5 * (1 - _local_2)), 0, 0, (_local_3 * (1 - _local_2)), (_local_4 * (1 - _local_2)), ((_local_5 * (1 - _local_2)) + _local_2), 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1]);
        }


        public function decode(_arg_1:XML):void
        {
            if (_arg_1 == null){
                return;
            };
            this.alphaOffset = Number(_arg_1.@a_o);
            this.alphaMultiplier = Number(_arg_1.@a_m);
            this.redOffset = Number(_arg_1.@r_o);
            this.redMultiplier = Number(_arg_1.@r_m);
            this.greenOffset = Number(_arg_1.@g_o);
            this.greenMultiplier = Number(_arg_1.@g_m);
            this.blueOffset = Number(_arg_1.@b_o);
            this.blueMultiplier = Number(_arg_1.@b_m);
        }

        public function encode()
        {
            var _local_1:XML = <Tinge/>
            ;
            return (this.encodeXML(_local_1));
        }

        public function encodeXML(_arg_1:XML)
        {
            _arg_1.@a_o = this.alphaOffset;
            _arg_1.@a_m = this.alphaMultiplier;
            _arg_1.@r_o = this.redOffset;
            _arg_1.@r_m = this.redMultiplier;
            _arg_1.@g_o = this.greenOffset;
            _arg_1.@g_m = this.greenMultiplier;
            _arg_1.@b_o = this.blueOffset;
            _arg_1.@b_m = this.blueMultiplier;
            return (_arg_1);
        }

        public function clone():TingeInfo
        {
            return (new TingeInfo(redMultiplier, greenMultiplier, blueMultiplier, alphaMultiplier, redOffset, greenOffset, blueOffset, alphaOffset));
        }

        public function isEmpty():Boolean
        {
            return ((((((((((((((((this.alphaMultiplier == 1)) && ((this.alphaOffset == 0)))) && ((this.redMultiplier == 1)))) && ((this.redOffset == 0)))) && ((this.greenMultiplier == 1)))) && ((this.greenOffset == 0)))) && ((this.blueMultiplier == 1)))) && ((this.blueOffset == 0))));
        }

        public function read(_arg_1:IDataInput):void
        {
            this.alphaOffset = _arg_1.readFloat();
            this.alphaMultiplier = _arg_1.readFloat();
            this.redOffset = _arg_1.readFloat();
            this.redMultiplier = _arg_1.readFloat();
            this.greenOffset = _arg_1.readFloat();
            this.greenMultiplier = _arg_1.readFloat();
            this.blueOffset = _arg_1.readFloat();
            this.blueMultiplier = _arg_1.readFloat();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeFloat(this.alphaOffset);
            _arg_1.writeFloat(this.alphaMultiplier);
            _arg_1.writeFloat(this.redOffset);
            _arg_1.writeFloat(this.redMultiplier);
            _arg_1.writeFloat(this.greenOffset);
            _arg_1.writeFloat(this.greenMultiplier);
            _arg_1.writeFloat(this.blueOffset);
            _arg_1.writeFloat(this.blueMultiplier);
        }

        public /*  ©init. */ function _SafeStr_351()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_351 = " TingeInfo" (String#13970)



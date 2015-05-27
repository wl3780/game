// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.DupLoadingInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_235;

    public class DupLoadingInfo implements IXMLSerialize, ISerialize 
    {

        public var dupLoadingTips:Array;
        public var lostFocusTips:Array;

        public function DupLoadingInfo()
        {
            this.dupLoadingTips = new Array();
            this.lostFocusTips = new Array();
            super();
        }

        public function decode(_arg_1:XML):void
        {
            var _local_2:XMLList = _arg_1.DupLoadingTip;
            var _local_3:uint;
            while (_local_3 < _local_2.length()) {
                this.dupLoadingTips.push({
                    "minlevel":uint(_local_2[_local_3].@minlevel),
                    "maxlevel":uint(_local_2[_local_3].@maxlevel),
                    "content":String(_local_2[_local_3].@content)
                });
                _local_3++;
            };
            var _local_4:XMLList = _arg_1.LostFocusTip;
            _local_3 = 0;
            while (_local_3 < _local_4.length()) {
                this.lostFocusTips.push({
                    "minlevel":uint(_local_4[_local_3].@minlevel),
                    "maxlevel":uint(_local_4[_local_3].@maxlevel),
                    "content":String(_local_4[_local_3].@content)
                });
                _local_3++;
            };
        }

        public function encode()
        {
            var _local_3:XML;
            var _local_1:XML = <DupLoadingTips/>
            ;
            var _local_2:uint;
            while (_local_2 < this.dupLoadingTips.length) {
                _local_3 = <DupLoadingTip/>
                ;
                _local_3.@minlevel = this.dupLoadingTips[_local_2].minlevel;
                _local_3.@maxlevel = this.dupLoadingTips[_local_2].maxlevel;
                _local_3.@content = this.dupLoadingTips[_local_2].content;
                _local_1.appendChild(_local_3);
                _local_2++;
            };
            _local_2 = 0;
            while (_local_2 < this.lostFocusTips.length) {
                _local_3 = <LostFocusTip/>
                ;
                _local_3.@minlevel = this.lostFocusTips[_local_2].minlevel;
                _local_3.@maxlevel = this.lostFocusTips[_local_2].maxlevel;
                _local_3.@content = this.lostFocusTips[_local_2].content;
                _local_1.appendChild(_local_3);
                _local_2++;
            };
            return (_local_1);
        }

        public function read(_arg_1:IDataInput):void
        {
            var _local_2:uint;
            _local_2 = _arg_1.readUnsignedShort();
            this.dupLoadingTips = new Array();
            var _local_3:uint;
            while (_local_3 < _local_2) {
                this.dupLoadingTips.push({
                    "minlevel":_arg_1.readUnsignedShort(),
                    "maxlevel":_arg_1.readUnsignedShort(),
                    "content":XString.ReadString(_arg_1)
                });
                _local_3++;
            };
            _local_2 = _arg_1.readUnsignedShort();
            this.lostFocusTips = new Array();
            _local_3 = 0;
            while (_local_3 < _local_2) {
                this.lostFocusTips.push({
                    "minlevel":_arg_1.readUnsignedShort(),
                    "maxlevel":_arg_1.readUnsignedShort(),
                    "content":XString.ReadString(_arg_1)
                });
                _local_3++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            var _local_2:uint;
            var _local_3:uint;
            if (this.dupLoadingTips){
                _local_2 = this.dupLoadingTips.length;
                _arg_1.writeShort(this.dupLoadingTips.length);
                _local_3 = 0;
                while (_local_3 < _local_2) {
                    _arg_1.writeShort(this.dupLoadingTips[_local_3].minlevel);
                    _arg_1.writeShort(this.dupLoadingTips[_local_3].maxlevel);
                    XString.WriteString(_arg_1, this.dupLoadingTips[_local_3].content);
                    _local_3++;
                };
            } else {
                _arg_1.writeShort(0);
            };
            if (this.lostFocusTips){
                _local_2 = this.lostFocusTips.length;
                _arg_1.writeShort(this.lostFocusTips.length);
                _local_3 = 0;
                while (_local_3 < _local_2) {
                    _arg_1.writeShort(this.lostFocusTips[_local_3].minlevel);
                    _arg_1.writeShort(this.lostFocusTips[_local_3].maxlevel);
                    XString.WriteString(_arg_1, this.lostFocusTips[_local_3].content);
                    _local_3++;
                };
            } else {
                _arg_1.writeShort(0);
            };
        }

        public /*  ©init. */ function _SafeStr_235()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_235 = " DupLoadingInfo" (String#17165)



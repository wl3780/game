// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.utils.CompareUtil

package com.tencent.ai.core.utils
{
    import com.tencent.ai.core.data.EquipStaticInfo;
    import com.tencent.ai.core.data.EquipItemInfo;
    import com.tencent.ai.core.enum.ItemConstants;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.EquipAttribPair;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.EquipAttribExtend;
    import com.tencent.ai.core.data.EquipEnhanceLevelInfo;
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_1371;

    public class CompareUtil 
    {

        private static const RateToFactor:Array = [0, 5, 10, 20, 50];


        public static function evaluate(_arg_1:EquipItemInfo):Number
        {
            var _local_2:EquipStaticInfo = _arg_1.equipStaticInfo;
            return ((getBaseAtrribValue(_local_2.baseAttrib, _arg_1) + (RateToFactor[_local_2.rare] * _local_2.levelLimit)));
        }

        public static function compare2(_arg_1:EquipItemInfo, _arg_2:EquipItemInfo):Number
        {
            if (_arg_1 == null){
                return (1);
            };
            if (_arg_1.staticInfo.type != ItemConstants.PropType_BADGE){
                if ((((_arg_1.wear == 0)) && ((_arg_2.wear == 0)))){
                    return (0);
                };
                if (_arg_1.wear == 0){
                    return (1);
                };
                if (_arg_2.wear == 0){
                    return (-1);
                };
            };
            var _local_3:EquipStaticInfo = _arg_1.equipStaticInfo;
            var _local_4:EquipStaticInfo = _arg_2.equipStaticInfo;
            var _local_5:Array = [];
            var _local_6:int = _compare2(_arg_1, _arg_2, _local_5);
            if (_local_6 != -3){
                return (_local_6);
            };
            var _local_7:Number = (_local_5[0] + (RateToFactor[_local_3.rare] * _local_3.levelLimit));
            var _local_8:Number = (_local_5[1] + (RateToFactor[_local_4.rare] * _local_4.levelLimit));
            if ((_local_7 - (_local_3.levelLimit * 2)) > _local_8){
                return (-1);
            };
            if ((_local_8 - (_local_4.levelLimit * 2)) > _local_7){
                return (1);
            };
            return (0);
        }

        private static function _compare2(_arg_1:EquipItemInfo, _arg_2:EquipItemInfo, _arg_3:Array):int
        {
            var _local_4:String;
            var _local_7:int;
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
            var _local_12:Dictionary;
            var _local_13:Dictionary;
            var _local_5:Dictionary = new Dictionary();
            var _local_6:Dictionary = new Dictionary();
            _local_10 = _arg_1.baseAttrib.length;
            _local_7 = (_local_7 + _local_10);
            _arg_3.push(getBaseAtrribDic(_arg_1, _local_5));
            _local_10 = _arg_1.strAttrib.length;
            _local_7 = (_local_7 + _local_10);
            _local_9 = 0;
            while (_local_9 < _local_10) {
                _local_5[_arg_1.strAttrib[_local_9].type] = _arg_1.strAttrib[_local_9].data;
                _local_9++;
            };
            _local_10 = _arg_1.extendAttrib.length;
            _local_7 = (_local_7 + _local_10);
            _local_9 = 0;
            while (_local_9 < _local_10) {
                _local_5[_arg_1.extendAttrib[_local_9].type] = _arg_1.extendAttrib[_local_9].data_1;
                _local_9++;
            };
            _local_10 = _arg_2.baseAttrib.length;
            _local_8 = (_local_8 + _local_10);
            _arg_3.push(getBaseAtrribDic(_arg_2, _local_6));
            _local_10 = _arg_2.strAttrib.length;
            _local_8 = (_local_8 + _local_10);
            _local_9 = 0;
            while (_local_9 < _local_10) {
                _local_6[_arg_2.strAttrib[_local_9].type] = _arg_2.strAttrib[_local_9].data;
                _local_9++;
            };
            _local_10 = _arg_2.extendAttrib.length;
            _local_8 = (_local_8 + _local_10);
            _local_9 = 0;
            while (_local_9 < _local_10) {
                _local_6[_arg_2.extendAttrib[_local_9].type] = _arg_2.extendAttrib[_local_9].data_1;
                _local_9++;
            };
            var _local_11:int;
            if (_local_7 == _local_8){
                _local_12 = _local_5;
                _local_13 = _local_6;
                for (_local_4 in _local_13) {
                    if ((_local_4 in _local_12)){
                        if (_local_12[_local_4] > _local_13[_local_4]){
                            if (_local_11 > 0){
                                return (-3);
                            };
                            _local_11 = -1;
                        } else {
                            if (_local_12[_local_4] < _local_13[_local_4]){
                                if (_local_11 < 0){
                                    return (-3);
                                };
                                _local_11 = 1;
                            };
                        };
                    } else {
                        return (-3);
                    };
                };
                if (_local_11 == 0){
                    _local_11 = -2;
                };
            } else {
                if (_local_7 > _local_8){
                    _local_12 = _local_5;
                    _local_13 = _local_6;
                } else {
                    if (_local_7 < _local_8){
                        _local_12 = _local_6;
                        _local_13 = _local_5;
                    };
                };
                for (_local_4 in _local_13) {
                    if (!(((_local_4 in _local_12)) && ((_local_12[_local_4] >= _local_13[_local_4])))){
                        return (-3);
                    };
                };
                _local_11 = (((_local_7 > _local_8)) ? -1 : 1);
            };
            return (_local_11);
        }

        private static function getBaseAtrribDic(_arg_1:EquipItemInfo, _arg_2:Dictionary):Number
        {
            var _local_4:EquipAttribPair;
            var _local_5:int;
            var _local_6:int;
            var _local_9:Vector.<EquipAttribExtend>;
            var _local_12:int;
            var _local_13:Number;
            var _local_14:EquipEnhanceLevelInfo;
            var _local_15:Number;
            var _local_16:int;
            var _local_17:EquipAttribExtend;
            var _local_3:Vector.<EquipAttribPair> = _arg_1.baseAttrib;
            _local_6 = _local_3.length;
            var _local_7:Number = 0;
            var _local_8:EquipStaticInfo = _arg_1.equipStaticInfo;
            if ((_local_8.feature & ItemConstants.Feature_SpecialStrengthen)){
                _local_9 = AICore.data.getEquipEnhanceTypeInfo(_local_8.id);
            } else {
                _local_9 = AICore.data.getEquipEnhanceTypeInfo(_local_8.avatarType);
            };
            var _local_10:int = _arg_1.strengthen;
            var _local_11:Boolean = ((((_local_9) && (_local_9.length))) && (_local_10));
            if (_local_11){
                _local_12 = (int(((_local_8.levelLimit + 4) / 5)) * 5);
                _local_13 = (AICore.data.getEquipEnhanceLackInfo(((_local_8.avatarType + ",") + _local_8.rare)) / 1000000);
                _local_14 = AICore.data.getEquipEnhanceLevelInfo(_local_12);
                _local_5 = 0;
                while (_local_5 < _local_6) {
                    _local_4 = _local_3[_local_5];
                    _local_15 = 0;
                    _local_16 = _local_4.type;
                    _local_7 = (_local_7 + _local_4.data);
                    _arg_2[_local_16] = _local_4.data;
                    for each (_local_17 in _local_9) {
                        if (_local_17.type == _local_16){
                            _local_15 = (_local_17.data_1 / 1000000);
                            _local_15 = (_local_15 * _local_13);
                            _local_15 = (_local_15 * _local_14.getEnhanceLevel((_local_10 - 1), _local_16));
                            break;
                        };
                    };
                    _local_7 = (_local_7 + _local_15);
                    _arg_2[_local_16] = (_arg_2[_local_16] + _local_15);
                    _local_5++;
                };
            } else {
                _local_5 = 0;
                while (_local_5 < _local_6) {
                    _local_4 = _local_3[_local_5];
                    _local_7 = (_local_7 + _local_4.data);
                    _arg_2[_local_4.type] = _local_4.data;
                    _local_5++;
                };
            };
            return (_local_7);
        }

        private static function getBaseAtrribValue(_arg_1:Vector.<EquipAttribPair>, _arg_2:EquipItemInfo):Number
        {
            var _local_3:EquipAttribPair;
            var _local_4:int;
            var _local_5:int;
            var _local_11:int;
            var _local_12:Number;
            var _local_13:EquipEnhanceLevelInfo;
            var _local_14:Number;
            var _local_15:int;
            var _local_16:EquipAttribExtend;
            _local_5 = _arg_1.length;
            var _local_6:Number = 0;
            var _local_7:EquipStaticInfo = _arg_2.equipStaticInfo;
            var _local_8:Vector.<EquipAttribExtend> = AICore.data.getEquipEnhanceTypeInfo(_local_7.avatarType);
            var _local_9:int = _arg_2.strengthen;
            var _local_10:Boolean = ((((_local_8) && (_local_8.length))) && (_local_9));
            if (_local_10){
                _local_11 = (int(((_local_7.levelLimit + 4) / 5)) * 5);
                _local_12 = (AICore.data.getEquipEnhanceLackInfo(((_local_7.avatarType + ",") + _local_7.rare)) / 1000000);
                _local_13 = AICore.data.getEquipEnhanceLevelInfo(_local_11);
                _local_14 = 0;
                _local_4 = 0;
                while (_local_4 < _local_5) {
                    _local_3 = _arg_1[_local_4];
                    _local_6 = (_local_6 + _local_3.data);
                    _local_15 = _local_3.type;
                    for each (_local_16 in _local_8) {
                        if (_local_16.type == _local_15){
                            _local_14 = (_local_16.data_1 / 1000000);
                            _local_14 = (_local_14 * _local_12);
                            _local_14 = (_local_14 * _local_13.getEnhanceLevel((_local_9 - 1), _local_15));
                            break;
                        };
                    };
                    _local_6 = (_local_6 + _local_14);
                    _local_4++;
                };
            } else {
                _local_4 = 0;
                while (_local_4 < _local_5) {
                    _local_3 = _arg_1[_local_4];
                    _local_6 = (_local_6 + _local_3.data);
                    _local_4++;
                };
            };
            return (_local_6);
        }


        public /*  ©init. */ function _SafeStr_1371()
        {
        }


    }
}//package com.tencent.ai.core.utils

// _SafeStr_1371 = " CompareUtil" (String#17747)



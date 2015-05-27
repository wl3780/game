// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.ProductStaticInfo

package com.tencent.ai.core.data
{
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.enum.MallConstants;
    import flash.utils.IDataOutput;
    import flash.utils.IDataInput;
    import  ©init._SafeStr_314;
    import __AS3__.vec.*;

    public class ProductStaticInfo 
    {

        public var id:int;
        public var items:Vector.<BuyItemData>;
        public var durations:Vector.<int>;
        public var kind:int;
        public var type:int;
        public var sortIndex:int;
        public var displayType:int;
        public var careerID:int;


        public function get useCoupons():Boolean
        {
            return (!((this.type == MallConstants.Type_ACTIVITY_0)));
        }

        public function decode(_arg_1:XML):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:BuyItemData;
            this.id = int(_arg_1.@id);
            this.items = new Vector.<BuyItemData>();
            var _local_2:XMLList = _arg_1.BuyItemData;
            _local_4 = Math.min(3, _local_2.length());
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_5 = new BuyItemData();
                _local_5.decode(_local_2[_local_3]);
                this.items.push(_local_5);
                _local_3++;
            };
            this.kind = int(_arg_1.@first_idx);
            this.type = int(_arg_1.@second_idx);
            this.sortIndex = int(_arg_1.@sort_id);
            this.displayType = int(_arg_1.@show_enum);
            this.careerID = int(_arg_1.@career_id);
            this.durations = new Vector.<int>();
            this.durations.push(int(_arg_1.@show_data_1));
            this.durations.push(int(_arg_1.@show_data_2));
            this.durations.push(int(_arg_1.@show_data_3));
            this.durations.push(int(_arg_1.@show_data_4));
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public function read(_arg_1:IDataInput):void
        {
        }

        public /*  ©init. */ function _SafeStr_314()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_314 = " ProductStaticInfo" (String#15848)



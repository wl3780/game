// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.utils.Rectangle3D

package com.tencent.ai.core.utils
{
    import  ©init._SafeStr_1376;

    public class Rectangle3D 
    {

        public var x:int;
        public var y:int;
        public var z:int;
        public var wigth:int;
        public var height:int;
        public var deepZ:int;

        public function Rectangle3D(_arg_1:int=0, _arg_2:int=0, _arg_3:int=0, _arg_4:int=0, _arg_5:int=0, _arg_6:int=0)
        {
            this.x = _arg_1;
            this.y = _arg_2;
            this.z = _arg_3;
            this.wigth = _arg_4;
            this.height = _arg_5;
            this.deepZ = _arg_6;
        }

        public function contains(_arg_1:int, _arg_2:int, _arg_3:int):Boolean
        {
            if ((((((((((((_arg_1 < this.x)) || ((_arg_1 > (this.x + this.wigth))))) || ((_arg_2 < this.y)))) || ((_arg_2 > (this.y + this.height))))) || ((_arg_3 < this.z)))) || ((_arg_3 > (this.z + this.deepZ))))){
                return (false);
            };
            return (true);
        }

        public function distance(_arg_1:int, _arg_2:int, _arg_3:int):int
        {
            return (Math.sqrt(((((_arg_1 - this.x) * (_arg_1 - this.x)) + ((_arg_2 - this.y) * (_arg_2 - this.y))) + ((_arg_3 - this.z) * (_arg_3 - this.z)))));
        }

        public /*  ©init. */ function _SafeStr_1376()
        {
        }


    }
}//package com.tencent.ai.core.utils

// _SafeStr_1376 = " Rectangle3D" (String#16283)



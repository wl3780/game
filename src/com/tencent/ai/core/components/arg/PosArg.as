package com.tencent.ai.core.components.arg
{

    public class PosArg 
    {

        public static const DIR_Z:int = 0;
        public static const DIR_X:int = 1;
        public static const DIR_Y:int = 2;

        public var offsetX:int;
        public var offsetZ:int;

        public function PosArg(offsetX:int=0, offsetZ:int=0)
        {
            this.offsetX = offsetX;
            this.offsetZ = offsetZ;
        }

    }
}

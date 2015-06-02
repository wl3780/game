package com.tencent.ai.core.utils
{

    public class Rectangle3D 
    {

        public var x:int;
        public var y:int;
        public var z:int;
        public var wigth:int;
        public var height:int;
        public var deepZ:int;

        public function Rectangle3D(x:int=0, y:int=0, z:int=0, w:int=0, h:int=0, deepZ:int=0)
        {
            this.x = x;
            this.y = y;
            this.z = z;
            this.wigth = w;
            this.height = h;
            this.deepZ = deepZ;
        }

        public function contains(px:int, py:int, pz:int):Boolean
        {
            if ((px < this.x) || (px > (this.x + this.wigth) 
				|| (py < this.y) || (py > (this.y + this.height) 
				|| (pz < this.z) || (pz > (this.z + this.deepZ)) {
                return false;
            }
            return true;
        }

        public function distance(dx:int, dy:int, dz:int):int
        {
            return Math.sqrt((dx - this.x) * (dx - this.x) 
				+ (dy - this.y) * (dy - this.y)
				+ (dz - this.z) * (dz - this.z));
        }

    }
}

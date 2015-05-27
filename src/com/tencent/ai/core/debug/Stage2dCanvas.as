// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.debug.Stage2dCanvas

package com.tencent.ai.core.debug
{
    import flash.display.Shape;
    import com.tencent.ai.core.display.IDisplay;
    import flash.display.DisplayObject;
    import flash.geom.Rectangle;
    import  ©init._SafeStr_365;

    public class Stage2dCanvas extends Shape implements IDisplay 
    {

        protected var m_depth:int;

        public function Stage2dCanvas()
        {
            this.m_depth = 0;
        }

        public function getDisplayBounds(_arg_1:IDisplay):Rectangle
        {
            return (getBounds(DisplayObject(_arg_1)));
        }

        public function set depth(_arg_1:int):void
        {
            this.m_depth = _arg_1;
        }

        public function get depth():int
        {
            return (this.m_depth);
        }

        public /*  ©init. */ function _SafeStr_365()
        {
        }


    }
}//package com.tencent.ai.core.debug

// _SafeStr_365 = " Stage2dCanvas" (String#16736)



package com.tencent.ai.core.manager.key
{
    import com.tencent.ai.core.utils.IXMLSerialize;

    public class GameKeyConfig implements IXMLSerialize 
    {

        public var keyCodes:Vector.<GameKeyCode>;

        public function GameKeyConfig()
        {
            this.keyCodes = new Vector.<GameKeyCode>();
        }

        public function decode(xml:XML):void
        {
        }

        public function encode()
        {
            return null;
        }

    }
}

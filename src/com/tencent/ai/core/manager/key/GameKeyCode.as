﻿package com.tencent.ai.core.manager.key
{

    public class GameKeyCode 
    {
		/** 真实键值 */
        public var code:int;
		/** 虚拟映射值 */
        public var char:String;
		
        public var des:String;
        public var eventType:String;
        public var isFuncKey:Boolean;
        public var isRepeat:Boolean;

        public function GameKeyCode(code:int, char:String, des:String="", eventType:String="", isRepeat:Boolean=false)
        {
            this.code = code;
            this.char = char;
            this.des = des;
            this.eventType = eventType;
            this.isFuncKey = eventType != "";
            this.isRepeat = isRepeat;
        }

    }
}

// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.report.AIQOS

package com.tencent.ai.report
{
    import flash.net.URLRequest;
    import flash.net.URLRequestMethod;
    import flash.net.sendToURL;
    import com.tencent.free.logging.error;
    import  ©init._SafeStr_1382;

    public class AIQOS 
    {

        public static var url:String = "http://17xf.qq.com/cgi-bin/client_report";
        public static var uin:uint = 0;
        public static var roleid:uint = 0;

        public var intList:Array;
        public var strList:Array;

        public function AIQOS()
        {
            this.intList = new Array();
            this.strList = new Array();
            super();
        }

        public function send():void
        {
            var _local_1:String;
            var _local_2:int;
            var _local_3:URLRequest;
            if (((this.intList) && ((this.intList.length > 0)))){
                _local_1 = ((((("uin=" + uin) + "&roleid=") + roleid) + "&type=") + this.intList[0]);
                _local_2 = 1;
                while (_local_2 < this.intList.length) {
                    _local_1 = (_local_1 + ((("&data" + _local_2) + "=") + this.intList[_local_2]));
                    _local_2++;
                };
                if (this.strList){
                    _local_2 = 0;
                    while (_local_2 < this.strList.length) {
                        _local_1 = (_local_1 + ((("&sdata" + (_local_2 + 1).toString()) + "=") + this.strList[_local_2]));
                        _local_2++;
                    };
                };
                _local_1 = _local_1.replace(/\ /g, "%20");
                _local_3 = new URLRequest(((url + "?") + _local_1));
                _local_3.method = URLRequestMethod.POST;
                sendToURL(_local_3);
            } else {
                error("AIQOS参数错误");
            };
        }

        public /*  ©init. */ function _SafeStr_1382()
        {
        }


    }
}//package com.tencent.ai.report

// _SafeStr_1382 = " AIQOS" (String#16082)



// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.report.TQOSJSON

package com.tencent.ai.report
{
    import com.adobe.serialization.json.JSON;
    import flash.net.URLRequest;
    import flash.net.URLRequestMethod;
    import flash.net.sendToURL;
    import  ©init._SafeStr_1383;

    public class TQOSJSON 
    {

        public static var businessID:int = 2801;

        public var cmd:int = 5;
        public var qosreq:String;
        public var ctlID:String;
        public var serverID:String;
        public var qosNum:int = 1;
        public var qosList:String;
        public var qosID:int = 2801;
        public var qosVal:int = 0;
        public var appendDescFlag:int = 2;
        public var appendDesc:String;
        public var comm:String;
        public var intList:Array;
        public var strList:Array;

        public function TQOSJSON()
        {
            this.intList = new Array();
            this.strList = new Array();
            super();
        }

        public function encode():String
        {
            var _local_1:Object = {
                "Head":{"Cmd":this.cmd},
                "Body":{"QOSRep":{
                        "BusinessID":businessID,
                        "QosNum":this.qosNum,
                        "QosList":[{
                            "QosID":this.qosID,
                            "QosVal":this.qosVal,
                            "AppendDescFlag":this.appendDescFlag,
                            "AppendDesc":{"Comm":{
                                    "IntNum":((this.intList) ? this.intList.length : 0),
                                    "IntList":((this.intList) ? (this.intList) : []),
                                    "StrNum":((this.strList) ? this.strList.length : 0),
                                    "StrList":((this.strList) ? this.strList : [])
                                }}
                        }]
                    }}
            };
            return (JSON.encode(_local_1));
        }

        public function send():void
        {
            var _local_1:URLRequest = new URLRequest("http://ied-tqosweb.qq.com:8001");
            _local_1.method = URLRequestMethod.POST;
            _local_1.data = ("tqos=" + this.encode());
            sendToURL(_local_1);
        }

        public /*  ©init. */ function _SafeStr_1383()
        {
        }


    }
}//package com.tencent.ai.report

// _SafeStr_1383 = " TQOSJSON" (String#16997)



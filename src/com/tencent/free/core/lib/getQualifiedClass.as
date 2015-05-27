// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.lib.getQualifiedClass

package com.tencent.free.core.lib
{
    import flash.utils.getQualifiedClassName;

    public function getQualifiedClass(_arg_1:*, _arg_2:Boolean=false):Class
    {
        var _local_3:String = getQualifiedClassName(_arg_1);
        if (_arg_2){
            return (CLASS.current.tryForName(_local_3));
        };
        return (CLASS.current.forName(_local_3));
    }

}//package com.tencent.free.core.lib


package com.tencent.free.core.lib
{
    import flash.utils.getQualifiedClassName;

    public function getQualifiedClass(value:*, isTry:Boolean=false):Class
    {
        var name:String = getQualifiedClassName(value);
        if (isTry) {
            return CLASS.current.tryForName(name);
        }
        return CLASS.current.forName(name);
    }

}

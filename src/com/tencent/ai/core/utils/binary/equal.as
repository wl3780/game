// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.utils.binary.equal

package com.tencent.ai.core.utils.binary
{
    import flash.utils.getQualifiedClassName;

    public function equal(lhs:Object, rhs:Object):Boolean
    {
        var _open:Boolean;
        var key:Object;
        var l:int;
        var i:int;
        var className:String;
        var className2:String;
        var names:Array;
        var prop:String;
        var lKeys:Array;
        var rKeys:Array;
        var catchIt:Function = function ():void
        {
            if (_open){
            };
        };
        _open = true;
        if (lhs === rhs){
            return (true);
        };
        var type:String = typeof(lhs);
        if (type !== typeof(rhs)){
            return (false);
        };
        if ((((((type == "number")) || ((type == "string")))) || ((type == "boolean")))){
            if ((((((type == "number")) && (isNaN(Number(lhs))))) && (isNaN(Number(rhs))))){
                return (true);
            };
            return (false);
        };
        if (type == "xml"){
            return ((lhs.toXMLString() === rhs.toXMLString()));
        };
        if (type == "object"){
            className = getQualifiedClassName(lhs);
            className2 = getQualifiedClassName(rhs);
            if (className != getQualifiedClassName(rhs)){
                return (false);
            };
            if ((((className == "Array")) || ((className.substr(0, 21) == "__AS3__.vec::Vector.<")))){
                l = lhs.length;
                if (l != rhs.length){
                    return (false);
                };
                i = 0;
                while (i < l) {
                    if (!equal(lhs[i], rhs[i])){
                        (catchIt());
                        return (false);
                    };
                    i = (i + 1);
                };
                return (true);
            };
            names = TypeInfo.describeType(lhs).getPublicPropertyNames();
            l = names.length;
            i = 0;
            while (i < l) {
                prop = names[i];
                if (!equal(lhs[prop], rhs[prop])){
                    (catchIt());
                    return (false);
                };
                i = (i + 1);
            };
            if (TypeInfo.describeType(lhs).isDynamic()){
                lKeys = [];
                rKeys = [];
                for (key in lhs) {
                    lKeys.push(key);
                };
                for (key in rhs) {
                    rKeys.push(key);
                };
                lKeys.sort();
                rKeys.sort();
                if (!equal(lKeys, rKeys)){
                    (catchIt());
                    return (false);
                };
                l = lKeys.length;
                i = 0;
                while (i < l) {
                    if (!equal(lhs[lKeys[i]], rhs[rKeys[i]])){
                        (catchIt());
                        return (false);
                    };
                    i = (i + 1);
                };
                return (true);
            };
            return (true);
        };
        return (false);
    }

}//package com.tencent.ai.core.utils.binary


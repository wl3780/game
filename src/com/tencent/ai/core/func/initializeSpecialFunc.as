package com.tencent.ai.core.func
{
    import com.tencent.ai.core.enum.SpecialFuncIDDef;
    import com.tencent.ai.core.func.impl.NormalSpecialFunc;
    
    import flash.utils.Dictionary;

    public function initializeSpecialFunc():void
    {
        var funMap:Dictionary = new Dictionary();
        SpecialFuncManager.SF_CLS_MAP = funMap;
        funMap[SpecialFuncIDDef.NORMAL] = NormalSpecialFunc;
    }

}

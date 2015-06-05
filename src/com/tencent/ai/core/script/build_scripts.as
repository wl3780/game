package com.tencent.ai.core.script
{
    import com.tencent.ai.core.AICore;

    public function build_scripts(type:int, target:IScriptsContainer, scriptList:Array=null):void
    {
        var manager:IScriptManager = AICore.script;
        if (manager != null) {
            manager.buildScripts(type, target, scriptList);
        }
    }

}

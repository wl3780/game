package com.tencent.ai.core
{
    import com.tencent.ai.core.script.IScriptManager;

    public function global_script(cmd:String, arg:Object=null, content:Object=null):void
    {
        var manager:IScriptManager = AICore.script;
        if (manager != null) {
            manager.executeScript(cmd, arg, content);
        }
    }

}

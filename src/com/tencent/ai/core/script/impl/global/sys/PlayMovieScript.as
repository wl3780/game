// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.sys.PlayMovieScript

package com.tencent.ai.core.script.impl.global.sys
{
    import com.tencent.ai.core.script.impl.global.GlobalScript;
    import com.tencent.ai.core.movie.IMovieManager;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.data.arg.script.ScriptArg;
    import  ©init._SafeStr_1172;

    public class PlayMovieScript extends GlobalScript 
    {

        protected var m_movie:IMovieManager;

        public function PlayMovieScript()
        {
            m_cmds = ScriptCmdDef.SC_PLAY_MOVIE;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            if (this.m_movie == null){
                this.m_movie = AICore.movie;
            };
            if ((_arg_2 is Array)){
                _arg_2 = _arg_2[0];
            };
            this.m_movie.playMovieByID((((_arg_2 is ScriptArg)) ? int(_arg_2.argStr) : int(_arg_2)));
        }

        public /*  ©init. */ function _SafeStr_1172()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global.sys

// _SafeStr_1172 = " PlayMovieScript" (String#17624)



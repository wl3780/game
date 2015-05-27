package com.tencent.ai.core.data.arg.plugin
{
    import com.tencent.ai.core.data.arg.CallCasualGameArg;
    import com.tencent.ai.core.data.arg.CallFriendPluginArg;
    import com.tencent.ai.core.data.arg.CallItemPanelArg;
    import com.tencent.ai.core.data.arg.CallPvpPluginArg;
    import com.tencent.ai.core.data.arg.CallShopPanelArg;
    import com.tencent.ai.core.data.arg.CallTeamPluginArg;
    import com.tencent.ai.core.data.arg.CareerGrowUpPluginArg;
    import com.tencent.ai.core.data.arg.DupCallArg;
    import com.tencent.ai.core.data.arg.ExtDupCallArg;
    import com.tencent.ai.core.data.arg.script.CallPluginArg;
    import com.tencent.ai.core.enum.AICommandType;
    
    import flash.utils.Dictionary;

    public function initializePluginArg():void
    {
        var argMap:Dictionary = CallPluginArg.PLUGIN_ARG_CLS_MAP;
        argMap[AICommandType.CALL_DUPLICATE] = DupCallArg;
        argMap[AICommandType.CALL_CASUAL_GAME] = CallCasualGameArg;
        argMap[AICommandType.CALL_SHOP_PANEL] = CallShopPanelArg;
        argMap[AICommandType.CALL_CAREER_GROW_UP] = CareerGrowUpPluginArg;
        argMap[AICommandType.CALL_TEAM_PLUGIN] = CallTeamPluginArg;
        argMap[AICommandType.CALL_FRIEND_PLUGIN] = CallFriendPluginArg;
        argMap[AICommandType.CALL_PVP_PLUGIN] = CallPvpPluginArg;
        argMap[AICommandType.CALL_EXTDUP] = ExtDupCallArg;
        argMap[AICommandType.CALL_PROPERTY_PANEL] = CallItemPanelArg;
    }

}

package com.tencent.ai.core.scene.property
{
    import com.tencent.ai.core.data.arg.sceneProperty.AdjustColorFilterArg;
    import com.tencent.ai.core.data.arg.sceneProperty.FlashAlphaArg;
    import com.tencent.ai.core.data.arg.sceneProperty.FlipArg;
    import com.tencent.ai.core.data.arg.sceneProperty.MaskArg;
    import com.tencent.ai.core.data.arg.sceneProperty.MoveFlowArg;
    import com.tencent.ai.core.data.arg.sceneProperty.MoveFollowCameraArg;
    import com.tencent.ai.core.data.arg.sceneProperty.MoveFollowItemArg;
    import com.tencent.ai.core.data.arg.sceneProperty.MoveXYArg;
    import com.tencent.ai.core.data.arg.sceneProperty.PropertyArg;
    import com.tencent.ai.core.data.arg.sceneProperty.RelativeFollowArg;
    import com.tencent.ai.core.data.arg.sceneProperty.SnowArg;
    import com.tencent.ai.core.data.arg.sceneProperty.TingeArg;
    import com.tencent.ai.core.enum.ScenePropertyType;
    
    import flash.utils.Dictionary;

    public function initializeProperty():void
    {
        PropertyArg.ARG_CLS_MAP[ScenePropertyType.FLIP_X] = FlipArg;
        PropertyArg.ARG_CLS_MAP[ScenePropertyType.FLIP_Y] = FlipArg;
        PropertyArg.ARG_CLS_MAP[ScenePropertyType.TINGE] = TingeArg;
        PropertyArg.ARG_CLS_MAP[ScenePropertyType.ADJUST_COLOR_FILTER] = AdjustColorFilterArg;
        PropertyArg.ARG_CLS_MAP[ScenePropertyType.MOVE_FOLLOW_CAMERA_X] = MoveFollowCameraArg;
        PropertyArg.ARG_CLS_MAP[ScenePropertyType.MOVE_FOLLOW_CAMERA_Y] = MoveFollowCameraArg;
        PropertyArg.ARG_CLS_MAP[ScenePropertyType.MOVE_FOLLOW_ITEM_X] = MoveFollowItemArg;
        PropertyArg.ARG_CLS_MAP[ScenePropertyType.MOVE_FLOW_X] = MoveFlowArg;
        PropertyArg.ARG_CLS_MAP[ScenePropertyType.MOVE_FLOW_Y] = MoveFlowArg;
        PropertyArg.ARG_CLS_MAP[ScenePropertyType.SNOW] = SnowArg;
        PropertyArg.ARG_CLS_MAP[ScenePropertyType.MASK] = MaskArg;
        PropertyArg.ARG_CLS_MAP[ScenePropertyType.Flash_Alpha] = FlashAlphaArg;
        PropertyArg.ARG_CLS_MAP[ScenePropertyType.MOVE_X_Y] = MoveXYArg;
        PropertyArg.ARG_CLS_MAP[ScenePropertyType.RELATIVE_FOLLOW] = RelativeFollowArg;
        
		PropertyFactory.PRO_CLS_MAP = new Dictionary();
        PropertyFactory.PRO_CLS_MAP[ScenePropertyType.FLIP_X] = FlipX;
        PropertyFactory.PRO_CLS_MAP[ScenePropertyType.FLIP_Y] = FlipY;
        PropertyFactory.PRO_CLS_MAP[ScenePropertyType.TINGE] = Tinge;
        PropertyFactory.PRO_CLS_MAP[ScenePropertyType.ADJUST_COLOR_FILTER] = AdjustColorFilter;
        PropertyFactory.PRO_CLS_MAP[ScenePropertyType.MOVE_FOLLOW_CAMERA_X] = MoveFollowCameraX;
        PropertyFactory.PRO_CLS_MAP[ScenePropertyType.MOVE_FOLLOW_CAMERA_Y] = MoveFollowCameraY;
        PropertyFactory.PRO_CLS_MAP[ScenePropertyType.MOVE_FOLLOW_ITEM_X] = MoveFollowItemX;
        PropertyFactory.PRO_CLS_MAP[ScenePropertyType.MOVE_FLOW_X] = MoveFlowX;
        PropertyFactory.PRO_CLS_MAP[ScenePropertyType.MOVE_FLOW_Y] = MoveFlowY;
        PropertyFactory.PRO_CLS_MAP[ScenePropertyType.SNOW] = Snow;
        PropertyFactory.PRO_CLS_MAP[ScenePropertyType.MASK] = Mask;
        PropertyFactory.PRO_CLS_MAP[ScenePropertyType.Flash_Alpha] = FlashAlpha;
        PropertyFactory.PRO_CLS_MAP[ScenePropertyType.MOVE_X_Y] = MoveXY;
        PropertyFactory.PRO_CLS_MAP[ScenePropertyType.RELATIVE_FOLLOW] = RelativeFollow;
    }

}

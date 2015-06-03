package com.tencent.ai.core.data
{
    import com.tencent.ai.core.actor.model.ActorModel;
    import com.tencent.ai.core.data.arg.sceneProperty.PropertyArg;
    import com.tencent.ai.core.element.BaseElement;

    public class InteractItemInfo extends MultiArgsInfo 
    {

        public var renderLevel:int = -1;
        public var id:int;
        public var interactItemID:int;
        public var interactItemType:int;
        public var location:MapPosition;
        public var groupID:int = -1;
        public var amityGroupID:int;
        public var staticInfo:InteractItemStaticInfo;
        public var direction:int = 1;
        public var attachSkillIndex:int = 0;
        public var attachSkillGroup:SkillGroup;
        public var attachSkillInfo:SkillInfo;
        public var attachActorModel:ActorModel;
        public var state:int;
        public var hp:int = -1;
        public var tingeInfo:TingeInfo;
        public var adjustColorInfo:AdjustColorInfo;
        public var delayFrames:int = 0;
        public var rotation:int = 0;
        public var rRotation:int = 0;
        public var bfollowTarget:Boolean = false;
        public var disappearOnOwnerDead:Boolean = false;
        public var disappearOnOwnerActionEnd:Boolean = false;
        public var owner:BaseElement = null;
        public var dropPackageID:int;
        public var propertyArgList:Vector.<PropertyArg>;
        public var procedureInfo:ProcedureInfo;


        public function setStaticInfo(info:InteractItemStaticInfo):void
        {
            this.staticInfo = info;
            if (this.groupID == -1) {
                this.groupID = info.groupID;
            }
            this.interactItemID = info.id;
            this.interactItemType = info.type;
            this.state = info.defaultState;
        }

    }
}

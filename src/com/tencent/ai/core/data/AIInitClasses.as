package com.tencent.ai.core.data
{
    import com.tencent.free.core.lib.CLASS;

    public class AIInitClasses 
    {

        public var CLASS_DialogManager:String;
        public var CLASS_SoundManager:String;
        public var CLASS_MovieManager:String;
        public var CLASS_PlayerModelManager:String;
        public var CLASS_SpawnMonsterManager:String;
        public var CLASS_BubbleManager:String;
        public var CLASS_MissionManager:String;
        public var CLASS_PlotSystem:String;
        public var CLASS_GuideSystem:String;
        public var CLASS_CryptoManager:String;
        public var CLASS_Bitmap:String;
        public var CLASS_BitmapDisplay:String;
        public var CLASS_Sprite:String;
        public var CLASS_TextFiled:String;
        public var CLASS_Shape:String;
        public var CLASS_BitmapRender:String;
        public var CLASS_BitmapRenderDisplay:String;
        public var CLASS_LayerRender:String;
        public var CLASS_BodyViewLayer:String;
        public var CLASS_LaserViewRender:String;


        public function create(name:String, params:Array=null):Object
        {
            if (name == null || name == "") {
                return null;
            }
            return CLASS.current.tryNewInstance(name, params);
        }

    }
}

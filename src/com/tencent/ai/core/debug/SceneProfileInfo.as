// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.debug.SceneProfileInfo

package com.tencent.ai.core.debug
{
    import com.tencent.ai.core.data.SceneInfo;
    import com.tencent.ai.core.data.SceneConfigInfo;
    import flash.utils.Dictionary;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.SceneNormalItemProfileInfo;
    import com.tencent.ai.core.scene.BaseSceneLayer;
    import com.tencent.ai.core.enum.SceneLayerDef;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.data.SceneLayerInfo;
    import com.tencent.ai.core.data.SceneItemInfo;
    import com.tencent.ai.core.scene.NormalItem;
    import flash.display.BitmapData;
    import com.tencent.ai.core.render.IBitmapDisplay;
    import  ©init._SafeStr_364;
    import __AS3__.vec.*;

    public class SceneProfileInfo 
    {

        private var _sceneInfo:SceneInfo;
        private var _sceneConfigInfo:SceneConfigInfo;
        private var _layers:Dictionary;
        public var profileNormalItemForeground:Vector.<SceneNormalItemProfileInfo>;
        public var totalSizeNormalItemForeground:int;
        public var profileNormalItemBackground:Vector.<SceneNormalItemProfileInfo>;
        public var totalSizeNormalItemBackground:int;
        public var profileNormalItemInteract:Vector.<SceneNormalItemProfileInfo>;
        public var totalSizeNormalItemInteract:int;
        public var totalSWFAssetScene:int;
        public var hashSWFAssetScene:Dictionary;

        public function SceneProfileInfo(_arg_1:SceneInfo, _arg_2:SceneConfigInfo, _arg_3:Dictionary)
        {
            this.sampleSceneStaticInfo(_arg_1, _arg_2, _arg_3);
        }

        public function sample():Dictionary
        {
            var _local_2:BaseSceneLayer;
            var _local_1:Dictionary = new Dictionary();
            _local_2 = this._layers[SceneLayerDef.LAYER_FOREGROUND];
            this.profileElements(_local_2, _local_1);
            _local_2 = this._layers[SceneLayerDef.LAYER_BACKGROUND];
            this.profileElements(_local_2, _local_1);
            _local_2 = this._layers[SceneLayerDef.LAYER_GROUND];
            this.profileElements(_local_2, _local_1);
            return (_local_1);
        }

        private function profileElements(_arg_1:BaseSceneLayer, _arg_2:Dictionary):void
        {
            var _local_4:BaseElement;
            var _local_5:String;
            var _local_6:Vector.<int>;
            var _local_3:Array = _arg_1.getElements();
            for each (_local_4 in _local_3) {
                _local_5 = _local_4.getType();
                _local_6 = _arg_2[_local_5];
                if (!_local_6){
                    _local_6 = new Vector.<int>();
                    _arg_2[_local_5] = _local_6;
                };
                _local_6.push(_local_4.id);
            };
        }

        private function sampleSceneStaticInfo(_arg_1:SceneInfo, _arg_2:SceneConfigInfo, _arg_3:Dictionary):void
        {
            var _local_4:BaseSceneLayer;
            var _local_5:SceneLayerInfo;
            var _local_6:SceneItemInfo;
            this._sceneInfo = _arg_1;
            this._sceneConfigInfo = _arg_2;
            this._layers = _arg_3;
            _local_4 = this._layers[SceneLayerDef.LAYER_FOREGROUND];
            this.profileNormalItemForeground = new Vector.<SceneNormalItemProfileInfo>();
            this.totalSizeNormalItemForeground = this.profileNormalItemInfo(_local_4.getNormalItems(), this.profileNormalItemForeground);
            _local_4 = this._layers[SceneLayerDef.LAYER_GROUND];
            this.profileNormalItemInteract = new Vector.<SceneNormalItemProfileInfo>();
            this.totalSizeNormalItemInteract = this.profileNormalItemInfo(_local_4.getNormalItems(), this.profileNormalItemInteract);
            _local_4 = this._layers[SceneLayerDef.LAYER_BACKGROUND];
            this.profileNormalItemBackground = new Vector.<SceneNormalItemProfileInfo>();
            this.totalSizeNormalItemBackground = this.profileNormalItemInfo(_local_4.getNormalItems(), this.profileNormalItemBackground);
            this.hashSWFAssetScene = new Dictionary();
            this.totalSWFAssetScene = 0;
            for each (_local_5 in this._sceneConfigInfo.layerList) {
                for each (_local_6 in _local_5.itemList) {
                    if (!this.hashSWFAssetScene[_local_6.resPath]){
                        this.hashSWFAssetScene[_local_6.resPath] = _local_6.resPath;
                        this.totalSWFAssetScene++;
                    };
                };
            };
        }

        private function profileNormalItemInfo(_arg_1:Array, _arg_2:Vector.<SceneNormalItemProfileInfo>):int
        {
            var _local_4:NormalItem;
            var _local_5:SceneNormalItemProfileInfo;
            var _local_6:BitmapData;
            var _local_3:int;
            for each (_local_4 in _arg_1) {
                _local_5 = new SceneNormalItemProfileInfo();
                _local_5.className = _local_4.className;
                _local_5.resPath = _local_4.resPath;
                _local_6 = (_local_4.getDisplay() as IBitmapDisplay).bitmapData;
                _local_5.size = ((_local_6.width * _local_6.height) * 4);
                _local_3 = (_local_3 + _local_5.size);
                _arg_2.push(_local_5);
            };
            return (_local_3);
        }

        public function toString():String
        {
            var _local_2:String;
            var _local_3:SceneNormalItemProfileInfo;
            var _local_1 = (("#===== " + this._sceneConfigInfo.name) + " 场景静态数据 =====#\n");
            _local_1 = (_local_1 + (("# SWF 资源总数：" + this.totalSWFAssetScene) + "\n"));
            for each (_local_2 in this.hashSWFAssetScene) {
                _local_1 = (_local_1 + (("  " + _local_2) + "\n"));
            };
            _local_1 = (_local_1 + (((("\n# 前景层（" + this.profileNormalItemForeground.length) + " 个，共 ") + (this.totalSizeNormalItemForeground / 0x0400).toFixed(2)) + " KB）\n"));
            for each (_local_3 in this.profileNormalItemForeground) {
                _local_1 = (_local_1 + (((((("  " + _local_3.className) + " | ") + (_local_3.size / 0x0400).toFixed(2)) + "KB | ") + _local_3.resPath) + "\n"));
            };
            _local_1 = (_local_1 + (((("# 背景层（" + this.profileNormalItemBackground.length) + " 个，共 ") + (this.totalSizeNormalItemBackground / 0x0400).toFixed(2)) + " KB）\n"));
            for each (_local_3 in this.profileNormalItemBackground) {
                _local_1 = (_local_1 + (((((("  " + _local_3.className) + " | ") + (_local_3.size / 0x0400).toFixed(2)) + "KB | ") + _local_3.resPath) + "\n"));
            };
            _local_1 = (_local_1 + (((("# 交互层（" + this.profileNormalItemInteract.length) + " 个，共 ") + (this.totalSizeNormalItemInteract / 0x0400).toFixed(2)) + " KB）\n"));
            for each (_local_3 in this.profileNormalItemInteract) {
                _local_1 = (_local_1 + (((((("  " + _local_3.className) + " | ") + (_local_3.size / 0x0400).toFixed(2)) + "KB | ") + _local_3.resPath) + "\n"));
            };
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_364()
        {
        }


    }
}//package com.tencent.ai.core.debug

// _SafeStr_364 = " SceneProfileInfo" (String#15101)



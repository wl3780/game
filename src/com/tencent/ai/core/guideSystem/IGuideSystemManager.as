// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.guideSystem.IGuideSystemManager

package com.tencent.ai.core.guideSystem
{
    import flash.events.IEventDispatcher;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import flash.display.BitmapData;

    public interface IGuideSystemManager extends IEventDispatcher 
    {

        function initialize():Boolean;
        function finalize():void;
        function openASystemDialog(_arg_1:String="", _arg_2:Function=null, _arg_3:int=0, _arg_4:String="normal", _arg_5:int=0):IGuideSystemElement;
        function closeTopSystemDialog():void;
        function openASystemAlert(_arg_1:Point, _arg_2:String="", _arg_3:Function=null, _arg_4:int=0, _arg_5:String="normal", _arg_6:int=0):IGuideSystemElement;
        function closeTopSystemAlert():void;
        function getAArrow(_arg_1:Point, _arg_2:Function=null, _arg_3:String="E", _arg_4:int=90, _arg_5:String="normal", _arg_6:int=0):IGuideSystemElement;
        function getGoArrow(_arg_1:Point=null, _arg_2:Function=null, _arg_3:String="E", _arg_4:int=90, _arg_5:String="normal", _arg_6:int=0):IGuideSystemElement;
        function getASceneArrow(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:Function=null, _arg_5:String="E", _arg_6:int=90, _arg_7:String="normal", _arg_8:int=0):IGuideSystemElement;
        function getAActivityArrow(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:Function=null, _arg_5:int=90, _arg_6:int=0):IGuideSystemElement;
        function getAMask(_arg_1:Rectangle, _arg_2:String="", _arg_3:Function=null, _arg_4:int=0):IGuideSystemElement;
        function getAKeyShowBar(_arg_1:int, _arg_2:String="", _arg_3:Function=null, _arg_4:int=0):IGuideSystemElement;
        function getACopyMovie(_arg_1:String=null, _arg_2:BitmapData=null, _arg_3:int=150, _arg_4:Function=null, _arg_5:int=0):IGuideSystemElement;
        function getATweenAlert(_arg_1:String, _arg_2:int=150, _arg_3:Function=null, _arg_4:int=0):IGuideSystemElement;
        function getADarkScreen(_arg_1:int=90, _arg_2:Function=null, _arg_3:int=0):IGuideSystemElement;
        function getAInteractiveAlert(_arg_1:int=1, _arg_2:String="", _arg_3:String=null, _arg_4:BitmapData=null, _arg_5:Function=null, _arg_6:int=0, _arg_7:Boolean=true, _arg_8:int=0):IGuideSystemElement;
        function deleteSystemDialogById(_arg_1:int):void;
        function deleteSystemAlertById(_arg_1:int):void;
        function deleteElementById(_arg_1:int):void;
        function clearAllGuideSystemElement():void;
        function dispatchAEvent(_arg_1:int, _arg_2:int):void;

    }
}//package com.tencent.ai.core.guideSystem


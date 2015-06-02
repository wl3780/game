package com.tencent.ai.core.element
{
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.display.IDisplay;
    import com.tencent.ai.core.enum.Direction;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.events.EventDispatcher2;
    import com.tencent.ai.core.render.IRenderObject;
    
    import flash.display.BlendMode;
    import flash.geom.Rectangle;

    public class BaseElement extends EventDispatcher2 implements IRenderObject 
    {
        public var renderLevel:int = -1;
        public var mapX:int;
        public var mapZ:int;
        public var mapY:int;
        public var mapID:int;
        public var mapDeep:int = 0;
        public var hasSceneRender:Boolean = true;
        public var id:uint;
        public var loaded:Boolean;
        public var classID:int;
        public var sPrev:Object;
        public var sNext:BaseElement;

        protected var m_posX:int;
        protected var m_posY:int;
        protected var m_direction:int;
        protected var m_type:String;
        protected var m_display:IDisplay;
        protected var m_parent:IElementContainer;
        protected var m_deepOffset:int;

        public function BaseElement(type:String)
        {
            this.m_type = type;
            this.initThis();
        }

        protected function initThis():void
        {
            this.classID = ElementType.CLASS_ID_BASE;
            this.reset();
        }

        public function setBlendMode(_arg_1:String):void
        {
            if (_arg_1 == "") {
                _arg_1 = BlendMode.NORMAL;
            }
            if (this.m_display != null) {
                this.m_display.blendMode = _arg_1;
            }
        }

        public function getType():String
        {
            return (this.m_type);
        }

        public function render(_arg_1:int):void
        {
        }

        public function getDisplay():IDisplay
        {
            return (this.m_display);
        }

        public function getPosX():int
        {
            return (this.m_display.x);
        }

        public function setPosX(_arg_1:int):void
        {
            this.m_posX = _arg_1;
            if (this.m_display != null) {
                this.m_display.x = this.m_posX;
            }
        }

        public function getPosY():int
        {
            return (this.m_display.y);
        }

        public function setPosY(_arg_1:int):void
        {
            this.m_posY = _arg_1;
            if (this.m_display != null) {
                this.m_display.y = this.m_posY;
            }
        }

        public function setPosXY(_arg_1:int, _arg_2:int):void
        {
            this.m_posX = _arg_1;
            this.m_posY = _arg_2;
            if (this.m_display != null) {
                this.m_display.x = this.m_posX;
                this.m_display.y = this.m_posY;
            }
        }

        public function setMapX(_arg_1:int):void
        {
            this.mapX = _arg_1;
            this.setPosX(this.mapX);
        }

        public function setMapZ(_arg_1:int):void
        {
            this.mapZ = _arg_1;
            this.mapDeep = (_arg_1 + this.m_deepOffset);
            this.setPosY((this.mapZ - this.mapY));
        }

        public function setMapY(_arg_1:int):void
        {
            this.mapY = _arg_1;
            this.setPosY((this.mapZ - this.mapY));
        }

        public function setMapXZY(_arg_1:int, _arg_2:int, _arg_3:int):void
        {
            this.mapX = _arg_1;
            this.mapZ = _arg_2;
            this.mapY = _arg_3;
            this.mapDeep = (_arg_2 + this.m_deepOffset);
            this.setPosX(this.mapX);
            this.setPosY((this.mapZ - this.mapY));
        }

        public function setDeepOffset(_arg_1:int):void
        {
            this.m_deepOffset = _arg_1;
            this.mapDeep = (this.m_deepOffset + this.mapZ);
        }

        public function getDeepOffset():int
        {
            return (this.m_deepOffset);
        }

        public function setMapPosition(_arg_1:MapPosition):void
        {
            this.m_deepOffset = _arg_1.deepOffset;
            this.setMapXZY(_arg_1.x, _arg_1.z, _arg_1.y);
        }

        public function getMapPosition():MapPosition
        {
            return (new MapPosition(this.mapX, this.mapZ, this.mapY, this.m_deepOffset));
        }

        public function setParentContainer(_arg_1:IElementContainer):void
        {
            this.m_parent = _arg_1;
        }

        public function getParentContainer():IElementContainer
        {
            return (this.m_parent);
        }

        public function getDirection():int
        {
            return (this.m_direction);
        }

        public function setDirection(_arg_1:int):void
        {
            this.m_direction = _arg_1;
        }

        public function reset():void
        {
            this.setBlendMode("");
            this.id = 0;
            this.m_posX = 0;
            this.m_posY = 0;
            this.mapX = 0;
            this.mapZ = 0;
            this.mapY = 0;
            this.mapID = 0;
            this.mapDeep = 0;
            this.m_deepOffset = 0;
            this.m_direction = Direction.RIGHT;
            this.m_parent = null;
        }

        public function dispose():void
        {
        }

        public function get alpha():Number
        {
            return (this.m_display.alpha);
        }

        public function set alpha(_arg_1:Number):void
        {
            this.m_display.alpha = _arg_1;
        }

        public function getBoundsInMap():Rectangle
        {
            return (null);
        }

    }
}

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
            return this.m_type;
        }

        public function render(_arg_1:int):void
        {
        }

        public function getDisplay():IDisplay
        {
            return this.m_display;
        }

        public function getPosX():int
        {
			if (this.m_display) {
            	return this.m_display.x;
			} else {
				return this.m_posX;
			}
        }
        public function setPosX(value:int):void
        {
            this.m_posX = value;
            if (this.m_display != null) {
                this.m_display.x = this.m_posX;
            }
        }

        public function getPosY():int
        {
			if (this.m_display) {
            	return this.m_display.y;
			} else {
				return this.m_posY;
			}
        }
        public function setPosY(value:int):void
        {
            this.m_posY = value;
            if (this.m_display != null) {
                this.m_display.y = this.m_posY;
            }
        }

        public function setPosXY(px:int, py:int):void
        {
            this.m_posX = px;
            this.m_posY = py;
            if (this.m_display != null) {
                this.m_display.x = this.m_posX;
                this.m_display.y = this.m_posY;
            }
        }

        public function setMapX(value:int):void
        {
            this.mapX = value;
            this.setPosX(this.mapX);
        }

        public function setMapZ(value:int):void
        {
            this.mapZ = value;
            this.mapDeep = value + this.m_deepOffset;
            this.setPosY(this.mapZ - this.mapY);
        }

        public function setMapY(value:int):void
        {
            this.mapY = value;
            this.setPosY(this.mapZ - this.mapY);
        }

        public function setMapXZY(mx:int, mz:int, my:int):void
        {
            this.mapX = mx;
            this.mapZ = mz;
            this.mapY = my;
            this.mapDeep = mz + this.m_deepOffset;
            this.setPosX(this.mapX);
            this.setPosY(this.mapZ - this.mapY);
        }

        public function setDeepOffset(value:int):void
        {
            this.m_deepOffset = value;
            this.mapDeep = this.m_deepOffset + this.mapZ;
        }
        public function getDeepOffset():int
        {
            return this.m_deepOffset;
        }

        public function setMapPosition(map:MapPosition):void
        {
            this.m_deepOffset = map.deepOffset;
            this.setMapXZY(map.x, map.z, map.y);
        }

        public function getMapPosition():MapPosition
        {
            return new MapPosition(this.mapX, this.mapZ, this.mapY, this.m_deepOffset);
        }

        public function setParentContainer(p:IElementContainer):void
        {
            this.m_parent = p;
        }
        public function getParentContainer():IElementContainer
        {
            return this.m_parent;
        }

        public function getDirection():int
        {
            return this.m_direction;
        }
        public function setDirection(value:int):void
        {
            this.m_direction = value;
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
            return this.m_display.alpha;
        }
        public function set alpha(value:Number):void
        {
            this.m_display.alpha = value;
        }

        public function getBoundsInMap():Rectangle
        {
            return null;
        }

    }
}

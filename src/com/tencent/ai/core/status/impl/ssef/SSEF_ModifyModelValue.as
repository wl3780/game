// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.status.impl.ssef.SSEF_ModifyModelValue

package com.tencent.ai.core.status.impl.ssef
{
    import com.tencent.ai.core.actor.model.OpAttribItem;
    import com.tencent.ai.core.actor.model.AN;
    import com.tencent.free.logging.assert;
    import com.tencent.ai.core.actor.model.OpMultiplyValue;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.actor.model.OpNumerical;
    import com.tencent.ai.core.actor.model.OpSetValue;
    import  ©init._SafeStr_1267;

    public class SSEF_ModifyModelValue extends SSEF_Base 
    {

        protected var m_isModify:Boolean;
        protected var m_opItem:OpAttribItem;

        public function SSEF_ModifyModelValue()
        {
            this.m_isModify = false;
        }

        protected function createOPItem():OpAttribItem
        {
            var _local_2:OpAttribItem;
            var _local_1:int = m_info.data_1;
            var _local_3:AN = AN.ATTRIB[m_info.data_2];
            if (_local_3 == null){
                assert(true, ("[SSEF_ModifyModelValue] 没有找到更改属性 m_info.data_2 = " + m_info.data_2));
            };
            var _local_4:String = _local_3.attribName;
            var _local_5:Number = m_info.data_3;
            switch (_local_1){
                case 1:
                    _local_2 = new OpMultiplyValue(_local_4, DEFINE.CAST_FLOAT(_local_5), m_info.index, m_info.priority);
                    break;
                case 2:
                    _local_2 = new OpNumerical(_local_4, (m_info.data_4 == 1), DEFINE.CAST_FLOAT(m_info.data_5), _local_3.getValue(_local_5), m_info.index, m_info.priority);
                    break;
                case 3:
                    _local_2 = new OpSetValue(_local_4, _local_3.getValue(_local_5), m_info.index, m_info.priority);
                    break;
            };
            if (_local_2 == null){
                assert(true, (("[SSEF_ModifyModelValue] 可更改类型  m_info.data_1 = " + _local_1) + ","));
            };
            return (_local_2);
        }

        override public function finalize():void
        {
            if (this.m_isModify){
                this.m_isModify = false;
                m_target.getModel().removeOpAttribItem(this.m_opItem);
            };
            super.finalize();
        }

        override public function execute():void
        {
            if (!this.m_isModify){
                this.m_isModify = true;
                this.m_opItem = this.createOPItem();
                m_target.getModel().addOpAttribItem(this.m_opItem);
            };
        }

        public /*  ©init. */ function _SafeStr_1267()
        {
        }


    }
}//package com.tencent.ai.core.status.impl.ssef

// _SafeStr_1267 = " SSEF_ModifyModelValue" (String#14492)



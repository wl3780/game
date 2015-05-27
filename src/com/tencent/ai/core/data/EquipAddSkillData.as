// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.EquipAddSkillData

package com.tencent.ai.core.data
{
    import flash.utils.IExternalizable;
    import com.tencent.ai.core.utils.IXMLSerialize;
    import flash.utils.IDataOutput;
    import flash.utils.IDataInput;
    import  ©init._SafeStr_244;

    public class EquipAddSkillData implements IExternalizable, IXMLSerialize 
    {

        public var addLevel:uint;
        public var actionID:uint;


        public function toString():String
        {
            return ((((("{" + this.addLevel) + ",") + this.actionID) + "}"));
        }

        public function writeExternal(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.actionID);
            _arg_1.writeUnsignedInt(this.addLevel);
        }

        public function readExternal(_arg_1:IDataInput):void
        {
            this.actionID = _arg_1.readUnsignedInt();
            this.addLevel = _arg_1.readUnsignedInt();
        }

        public function decode(_arg_1:XML):void
        {
            this.addLevel = int(_arg_1.@lvl);
            this.actionID = int(_arg_1.@action_id);
        }

        public function encode()
        {
            return (new XML((((('<add_skill_data lvl="' + this.addLevel) + '" action_id="') + this.actionID) + '"/>')));
        }

        public /*  ©init. */ function _SafeStr_244()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_244 = " EquipAddSkillData" (String#14201)



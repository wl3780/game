// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.MsgIconData

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.free.utils.CFunction;
    import com.tencent.ai.core.enum.MailType;
    import  ©init._SafeStr_283;

    public class MsgIconData 
    {

        public static const MSGICONTYPE_SKILL:String = (DEFINE.ICON_RES_SRC + "msgicon_skill.png");
        public static const MSGICONTYPE_CAREER_WEAR:String = (DEFINE.ICON_RES_SRC + "msgicon_bodylevelup.png");
        public static const MSGICONTYPE_CAREER_TRANS:String = (DEFINE.ICON_RES_SRC + "msgicon_bodyevolution.png");
        public static const MSGICONTYPE_PROP:String = (DEFINE.ICON_RES_SRC + "msgicon_prop.png");
        public static const MSGICONTYPE_GIFT:String = (DEFINE.ICON_RES_SRC + "msgicon_gift.png");
        public static const MSGICONTYPE_GIFT_2:String = (DEFINE.ICON_RES_SRC + "msgicon_gift2.png");
        public static const MSGICONTYPE_MILITARY_RANK:String = (DEFINE.ICON_RES_SRC + "msgicon_military.png");
        public static const BADGE_AWARD:String = (DEFINE.ICON_RES_SRC + "msgicon_military2.png");
        public static const MSGICONTYPE_OTHERS:String = "";
        public static const MSGICONTYPE_SUBLIME:String = MSGICONTYPE_CAREER_TRANS;
        public static const MSGICONTYPE_ITEM_AWARD:String = (DEFINE.ICON_RES_SRC + "msgicon_gift.png");
        public static const BACK_FULL:String = (DEFINE.ICON_RES_SRC + "msgicon_gift.png");
        public static const OPEN_HUO_DONG:String = (DEFINE.ICON_RES_SRC + "msgicon_huodong.png");
        public static const MSGICONTYPE_ADV_MOVIE:String = (DEFINE.ICON_RES_SRC + "msgicon_adv.png");
        public static const MSGICONTYPE_MERCENARY_MOVIE:String = (DEFINE.ICON_RES_SRC + "msgicon_adv.png");
        public static const MSGICONTYPE_MERCENARY_GIFT:String = (DEFINE.ICON_RES_SRC + "msgicon_gift2.png");
        public static const MSGICONTYPE_FAMILY_NOTIFY:String = (DEFINE.ICON_RES_SRC + "msgicon_gift2.png");

        public var priority:int;
        public var callback:CFunction;
        private var _url:String;
        public var tipsContent:String = "";
        private var _mailType:int;


        public static function getMsgIconURLByMailType(_arg_1:int):String
        {
            switch (_arg_1){
                case MailType.CAREER_TRANS:
                    return (MSGICONTYPE_CAREER_TRANS);
                case MailType.SKILL_CAN_UPDATE:
                    return (MSGICONTYPE_SKILL);
                case MailType.CAREER_WEAR:
                    return (MSGICONTYPE_CAREER_WEAR);
                case MailType.UPGRADE_SURE:
                    return (MSGICONTYPE_GIFT_2);
                case MailType.UPGRADE_SURE_NEW:
                    return (MSGICONTYPE_GIFT_2);
                case MailType.UPGRADE_SUPPLY:
                    return (MSGICONTYPE_GIFT);
                case MailType.MILITARY_RANK_UPGRADE:
                    return (MSGICONTYPE_MILITARY_RANK);
                case MailType.BADGE_AWARD:
                    return (BADGE_AWARD);
                case MailType.SUBLIME:
                    return (MSGICONTYPE_SUBLIME);
                case MailType.ITEM_AWARD:
                    return (MSGICONTYPE_GIFT);
                case MailType.LANTERN_FESTIVAL_AWARD:
                    return (MSGICONTYPE_GIFT);
                case MailType.OPEN_HUO_DONG:
                    return (OPEN_HUO_DONG);
                case MailType.BACK_FULL:
                case MailType.BACK_FULL_WITH_MODULE:
                    return (BACK_FULL);
                case MailType.OPEN_ADV_MOVIE:
                    return (MSGICONTYPE_ADV_MOVIE);
                case MailType.OPEN_MERCENARY_MOVIE:
                    return (MSGICONTYPE_MERCENARY_MOVIE);
                case MailType.OPEN_MERCENARY_GIFT:
                    return (MSGICONTYPE_MERCENARY_GIFT);
                case MailType.JOIN_TEAM:
                    return (MSGICONTYPE_CAREER_TRANS);
                case MailType.CAREER_PROMOTE:
                    return (MSGICONTYPE_CAREER_TRANS);
                case MailType.FAMILY_NOTIFY:
                    return (MSGICONTYPE_FAMILY_NOTIFY);
            };
            return ("");
        }

        public static function getPriority(_arg_1:int):int
        {
            switch (_arg_1){
                case MailType.SKILL_CAN_UPDATE:
                    return (1);
                case MailType.JOIN_TEAM:
                case MailType.CAREER_PROMOTE:
                case MailType.CAREER_WEAR:
                    return (2);
                case MailType.CAREER_TRANS:
                    return (3);
                case MailType.SUBLIME:
                    return (4);
                case MSGICONTYPE_PROP:
                    return (5);
                case MailType.UPGRADE_SUPPLY:
                    return (6);
                case MailType.UPGRADE_SURE:
                    return (7);
                case MailType.UPGRADE_SURE_NEW:
                    return (7);
                case MailType.MILITARY_RANK_UPGRADE:
                    return (8);
                case MailType.BADGE_AWARD:
                    return (9);
                case MSGICONTYPE_OTHERS:
                    return (9);
                case MailType.LANTERN_FESTIVAL_AWARD:
                case MailType.ITEM_AWARD:
                    return (10);
            };
            return (0);
        }

        public static function fromTypeToChinese(_arg_1:int):String
        {
            if (_arg_1 == MailType.SKILL_CAN_UPDATE){
                return ("潜能升级");
            };
            if (_arg_1 == MailType.CAREER_WEAR){
                return ("机体升级");
            };
            if (_arg_1 == MailType.CAREER_TRANS){
                return ("机型进化");
            };
            if (_arg_1 == MailType.UPGRADE_SUPPLY){
                return ("升级礼包");
            };
            if (_arg_1 == MailType.MILITARY_RANK_UPGRADE){
                return ("军衔升级");
            };
            if (_arg_1 == MailType.BADGE_AWARD){
                return ("徽章授予");
            };
            if (_arg_1 == MailType.SUBLIME){
                return ("机型觉醒");
            };
            if (_arg_1 == MailType.OPEN_HUO_DONG){
                return ("点击打开");
            };
            if (_arg_1 == MailType.ITEM_AWARD){
                return ("智能战斗的道具奖励");
            };
            if (_arg_1 == MailType.LANTERN_FESTIVAL_AWARD){
                return ("元宵灯谜会排行榜奖励");
            };
            if ((((_arg_1 == MailType.BACK_FULL)) || ((_arg_1 == MailType.BACK_FULL_WITH_MODULE)))){
                return ("背包满了，奖励暂存");
            };
            if (_arg_1 == MailType.JOIN_TEAM){
                return ("新兵入列");
            };
            if (_arg_1 == MailType.CAREER_PROMOTE){
                return ("机型进阶");
            };
            return ("新消息");
        }


        public function get mailType():int
        {
            return (this._mailType);
        }

        public function set mailType(_arg_1:int):void
        {
            this._mailType = _arg_1;
            this.priority = getPriority(_arg_1);
        }

        public function get url():String
        {
            return (this._url);
        }

        public function set url(_arg_1:String):void
        {
            this._url = _arg_1;
        }

        public /*  ©init. */ function _SafeStr_283()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_283 = " MsgIconData" (String#14270)



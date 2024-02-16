/* 𝑻𝒓𝒊𝒈𝒈𝒆𝒓 𝑺𝒄𝒆𝒏𝒂𝒓𝒊𝒐:-
"𝐢𝐟 𝐀𝐜𝐜𝐨𝐮𝐧𝐭 𝐓𝐲𝐩𝐞 𝐂𝐡𝐚𝐧𝐠𝐞𝐝 𝐭𝐡𝐞𝐧 𝐬𝐞𝐧𝐝 𝐚𝐧 𝐞𝐦𝐚𝐢𝐥 𝐭𝐨 𝐚𝐥𝐥 𝐫𝐞𝐥𝐚𝐭𝐞𝐝 𝐜𝐨𝐧𝐭𝐚𝐜𝐭𝐬 𝐨𝐟 𝐩a𝐫𝐭𝐢𝐜𝐮𝐥𝐚𝐫 𝐚𝐜𝐜𝐨𝐮𝐧𝐭," */

trigger AccountTrigger on Account (after update) {
    if(Trigger.isAfter){
        if(Trigger.isUpdate){
            AccountTriggerHelper.sendEmailToRelatedContact(Trigger.new, Trigger.oldMap);
        }
    }
}
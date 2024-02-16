/* Trigger Scenario - Write a trigger on contact to prevent duplicate records based on Contact Email and Contact Phone. */

trigger ContactTrigger on Contact (before insert, before update) {
    if(Trigger.isbefore && (Trigger.isInsert || Trigger.isUpdate)){
        ContactTriggerHelper.checkDuplicateContacts(Trigger.new, Trigger.oldMap);
    }
}
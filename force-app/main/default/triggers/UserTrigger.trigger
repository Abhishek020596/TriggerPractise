trigger UserTrigger on User (after update) {
    If(Trigger.isAfter && (Trigger.isUpdate)){
        UserTriggerHelper.userChangeLocation(Trigger.new,Trigger.oldMap);
    }
}
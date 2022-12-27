trigger ContactLimitTrigger on Contact (before insert, after insert, before update, after update) {
    ContactLimitHandler.MainMethod(trigger.new);
}
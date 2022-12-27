trigger ContactMetaDataTrigger on Account (after insert ,after update) {
	if(trigger.isInsert){
        ContactMetaDataHandler.MainMethod(trigger.new);
    }
}

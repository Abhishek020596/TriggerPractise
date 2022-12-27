public class ContactLimitHandler {
	public static void MainMethod(List<Contact> conList){
        Set<Id> IdSet =	new Set<Id>();
        for(Contact cot : conList) {
            if(cot.accountID != null) {
                IdSet.add(cot.accountId);
            }
        }
        Integer contactListCount = [SELECT COUNT() FROM CONTACT WHERE accountID IN: IdSet];
        
        if(contactListCount > 3) {
            for(contact cop : conList) {
                cop.addError('cannot have more than 3 contacts per account');
            }
        }        
    }
}
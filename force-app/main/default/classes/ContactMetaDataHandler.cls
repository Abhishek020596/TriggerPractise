public class ContactMetaDataHandler {
	 public static void MainMethod(List<Account> accList){
        List<String> listphone = new List<String>();
        Map<String,String> nameMap = new Map<String,String>();
        Map<String,String> emailMap = new Map<String,String>();
        
        for(ContactMetaData__mdt metaData : [SELECT Phone__c,Name__c,Email__c FROM ContactMetaData__mdt]){
            if(metaData.Name__c !=null){
                nameMap.put(metaData.Phone__c,metaData.Name__c);
            }
            if(metaData.Email__c !=null){
                emailMap.put(metaData.Phone__c,metaData.Email__c);
            }
            if(metaData.Phone__c!=null){
                listphone.add(metaData.Phone__c);
            }
        }

        List<Contact> conList = new List<Contact>();
        String id;
        String phoneNum ; 
        
        Map<Id,Decimal> accMap = new Map<Id,Decimal>();
        for(Account acc :accList){
            if(listphone.contains(acc.Phone)){
                id = acc.Id;
                phoneNum = acc.Phone;
                accMap.put(acc.Id,acc.Number_Of_Contacts__c);
            } 
        }
        for(Integer i=1; i<=accMap.get(id); i++){
            Contact newContact = new Contact();
            newContact.AccountId = id;
            newContact.LastName = nameMap.get(phoneNum);
            newContact.Phone = phoneNum;
            newContact.Email = emailMap.get(phoneNum);
            conList.add(newContact);
        }
        UPSERT conList;
    }
}
/* This is Account Trigger Helper Class */

public class AccountTriggerHelper {
    public static void sendEmailToRelatedContact(List<Account> newRecord, Map<Id, Account> oldMapRecord){
        Set<Id> accRecordIds = new Set<Id>();
        if(!newRecord.isEmpty()){
            for(Account acc : newRecord){
                if(oldMapRecord != null && oldMapRecord.get(acc.Id).Type != acc.Type){
                    accRecordIds.add(acc.Id);
                }
            }
        }
        List<Messaging.SingleEmailMessage> emailMessage = new List<Messaging.SingleEmailMessage>();
        for(Contact relatedContacts : [SELECT Id, AccountId, LastName, Email 
                                       FROM Contact WHERE AccountId IN: accRecordIds AND Email != null]){
                                           if(relatedContacts.Email != null){
                                               Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                                               email.setTargetObjectId(relatedContacts.Id);
                                               email.setSenderDisplayName('System Administrator');
                                               email.setSubject('Account related contacts');
                                               String bodyofHtml = 'Dear ' + relatedContacts.LastName + ' ,<br>';
                                               bodyofHtml += 'Your Account has successfully updated';
                                               email.setHtmlBody(bodyofHtml);
                                               email.setToAddresses(new List<String>{relatedContacts.Email});
                                               emailMessage.add(email);
                                           }
                                       }
        if(!emailMessage.isEmpty()){
            messaging.sendEmail(emailMessage);
        }
        
    }
}
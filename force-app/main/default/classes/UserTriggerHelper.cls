public class UserTriggerHelper {
    public static void userChangeLocation(List<User> userRecord, Map<Id, User> useroldRecord){
        Map<Id, String> userMap = new Map<Id, String>();
        if(userRecord != null && !userRecord.isEmpty()){
            for(User uc: userRecord){
                if(userRecord != null && useroldRecord != null && (uc.Country != useroldRecord.get(uc.Id).Country)){
                    userMap.put(uc.Id, uc.Country);
                }
            }
        }
        
        List<Opportunity> oppList = new List<Opportunity>();
        if(!userMap.isEmpty()){
            List<Opportunity> oppVal = [SELECT Id, OwnerId, Location__c FROM Opportunity WHERE OwnerId =: userMap.keySet()];
            for(Opportunity opp : oppVal){
                opp.Location__c = userMap.get(opp.OwnerId);
                oppList.add(opp);
            }
        }
        if(!oppList.isEmpty()){
            UPDATE oppList;
        }
    }
}
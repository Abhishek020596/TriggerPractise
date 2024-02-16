public class ContactTriggerHelper {

    // Method to check for duplicate contacts
    public static void checkDuplicateContacts(List<Contact> contactRecord, Map<Id, Contact> oldMapRecord){
        // Maps to store unique phone numbers and email addresses
        Map<String, Contact> mapPhone = new Map<String, Contact>();
        Map<String, Contact> mapEmail = new Map<String, Contact>();

        // Query to fetch contacts with non-null email or phone
        for(Contact con : [SELECT Id, LastName, Email, Phone 
                            FROM Contact Where Email != null OR Phone != null]){
            // Populate the maps with unique phone numbers and email addresses
            mapPhone.put(con.Phone, con);
            mapEmail.put(con.Email, con);
        }

        // Loop through the new contact records to check for duplicates
        for(Contact con : contactRecord){
            // Check for duplicate phone numbers
            if((con.Phone != null && mapPhone.ContainsKey(con.Phone)) ||
                (con.Phone != null && mapPhone.ContainsKey(con.Phone) && con.Phone != oldMapRecord.get(con.Id).Phone)){
                    con.Phone.addError('Duplicate Phone Number');
            }
            // Check for duplicate email addresses
            else if((con.Email != null && mapEmail.ContainsKey(con.Email)) ||
                    (con.Email != null && mapEmail.ContainsKey(con.Email) && con.Email != oldMapRecord.get(con.Id).Email)){
                        con.Email.addError('Duplicate Email Address');
            }
        }
    }
}

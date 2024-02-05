public class mapacc 
{
    public static void acon()

    {map<Id,List<opportunity>> accountopMap = new map<id,List<opportunity>>();
	map<Id,List<contact>> accountContactMap = new map<id,List<contact>>();
    List<Account> lstAccount = [SELECT Id, name, (SELECT Id, Name FROM opportunities) FROM Account];
     List<Account> lstcontact = [SELECT Id, name, (SELECT Id, Name FROM contacts) FROM Account];
    
    for(Account acc : lstAccount)
    {
        accountopMap.put(acc.id, acc.opportunities);
    }
     for(Account acc : lstcontact)
    {
        accountContactMap.put(acc.id, acc.contacts);
    }
    
    System.debug(accountopMap);
     System.debug(accountContactMap);
     
    }
}
public class countcontact {
	@future
    public static void countacc(list<id> accid)
    {
        list<account> acclist = [select id, (select id from contacts) from account where id in: accid];
        for(account acc : acclist)
        {
            acc.numberofcontact__c = acc.contacts.size();
        }
        if(!acclist.isempty())
        {
            update acclist;
        }
        throw new AuraHandledException('Forced error');
    }
}
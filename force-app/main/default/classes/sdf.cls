public class sdf {
    public static void m(list<contact> clis)
    {
        set<id> acid = new set<id>();
        set<id> acidactve = new set<id>();
        for(contact c: clis)
        {
            acid.add(c.accountid);
        }
        list<account> aclis = new list<account>();
        aclis = [select id,active__c from account where id in:acid];
        for(account ac: aclis)
        {
            if(ac.active__c == 'Yes')
            {
                acidactve.add(ac.id);
            }
        }
        for(contact cc: clis)
        {
            if(acidactve.contains(cc.AccountId) && cc.primary__c==true)
            {
                cc.adderror('can not delete');
            }
        }
        /*for(account acv: aclis)//1->account
        {
             for(contact ccb: acv.contacts)//9->contact
            {
                if(acv.Active__c=='yes' && ccb.primary__c==true)
                {
                    ccb.adderror('can not delete');
                }
            }
        }*/
        
        
    }

}
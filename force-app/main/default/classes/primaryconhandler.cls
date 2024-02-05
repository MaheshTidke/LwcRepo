public class primaryconhandler 
{
    public static void afterupdation(list<contact> conlis,map<id,contact> oldconmap)
    {
        set<id> acid = new set<id>();
        set<id> primaryset = new set<id>();
        list<account> aclis =  new list<account>();
        list<account> aclisupdate =  new list<account>();
        list<contact> conlisupdate =  new list<contact>();
        for(contact c: conlis)
        {
            system.debug(oldconmap);
            if(oldconmap == null || (c.primary__c != oldconmap.get(c.id).primary__c && c.primary__c == true))
            {
                primaryset.add(c.id);
           		acid.add(c.accountid);
            }
            
        }
        aclis = [select id,name,(select id,name,primary__c from contacts where primary__c = true) from account where id in :acid];
        for(account ac : aclis)
        {
            for(contact cc:ac.contacts)
            {
                if(primaryset.contains(cc.id))
                {
                    cc.primary__c = true;
                    ac.Primary_Contact_Name__c = cc.Name;
                    aclisupdate.add(ac);
                }
                else
                {
                    cc.primary__c = false;
                    conlisupdate.add(cc);
                }
            }
        }
        update conlisupdate;
        update aclisupdate;
    }
    /*
    public static void afterinsertionandundeletion(list<contact> conlis)
    {
        set<id> acid = new set<id>();
        set<id> primaryset = new set<id>();
        list<account> aclis =  new list<account>();
        list<account> aclisupdate =  new list<account>();
        list<contact> conlisupdate =  new list<contact>();
        for(contact c: conlis)
        {
            if(c.primary__c == true)
            {
                primaryset.add(c.id);
           		acid.add(c.accountid);
            }
            
        }
        aclis = [select id,name,(select id,name,primary__c from contacts where primary__c = true) from account where id in :acid];
        for(account ac : aclis)
        {
            for(contact cc:ac.contacts)
            {
                if(primaryset.contains(cc.id))
                {
                    cc.primary__c = true;
                    ac.Primary_Contact_Name__c = cc.Name;
                    aclisupdate.add(ac);
                }
                else
                {
                    cc.primary__c = false;
                    conlisupdate.add(cc);
                }
            }
        }
        update conlisupdate;
        update aclisupdate;
    }
    
    public static void afterdeletion(list<contact> conlis)
    {
        set<id> acid = new set<id>();
        set<id> primaryset = new set<id>();
        list<account> aclis =  new list<account>();
        list<account> aclisupdate =  new list<account>();
        list<contact> conlisupdate =  new list<contact>();
        for(contact c: conlis)
        {
            if(c.primary__c == true)
            {
                primaryset.add(c.id);
           		acid.add(c.accountid);
            }
            
        }
        aclis = [select id,name,(select id,name,primary__c from contacts ) from account where id in :acid];
        integer count = 0;
        for(account ac : aclis)
        {
            system.debug(ac);
            for(contact cc:ac.contacts)
            {
                if(count == 0)
                {
                    system.debug(cc);
                    cc.primary__c = true;
                    conlisupdate.add(cc);
                    ac.Primary_Contact_Name__c = cc.Name;
                    aclisupdate.add(ac);
                }
                count++;
            }
        }
        update conlisupdate;
        update aclisupdate;
    }*/
}
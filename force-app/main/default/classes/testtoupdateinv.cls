@istest
public class testtoupdateinv 
{
    @istest
    public static void setg()
    {
        list<account> aclis1 = new list<account>();
        for(integer i = 0;i<5;i++)
        {
            
            if(i==2)
            {
                account aa = new account(name = 'invupdate '+i,AnnualRevenue = 100005);
                aclis1.add(aa);
            }
            else
            {
              account aa = new account(name = 'invupdate '+i,AnnualRevenue = 10000); 
                aclis1.add(aa);
            }
            
        }
        insert aclis1;
        set<id> acid =new set<id>();
       	for( account y : aclis1)
        {
            acid.add(y.id);
        }
        
        list<account> acl = new list<account>();
        list<account> acla = new list<account>();
        acl = [select id,name,annualrevenue,invip__c from account where id in : acid];
        integer count = 0;
        for(account am : acl)
        {
            if(count < 2)
            {
                am.AnnualRevenue = 100002;
                acla.add(am);
            }
            else if(count >=2)
            {
                am.AnnualRevenue = 999;
                acla.add(am);
            }
            count = count + 1;
        }
        update acla;
        
        
		list<account> axc = new list<account>();
        axc = [select id,name,annualrevenue,invip__c from account where id in : acid];
        integer coun = 0;
        decimal abn = 100002;
        decimal abn1 = 999;
        for(account il : axc)
        {
           if(il.AnnualRevenue > 100000)
            {
                //system.assertequals(il.AnnualRevenue,abn);
                system.assertequals(il.invip__c,true);
            }
            else if(il.AnnualRevenue < 100000)
            {
                system.assertequals(il.invip__c,false);
            }
        }
    }

}
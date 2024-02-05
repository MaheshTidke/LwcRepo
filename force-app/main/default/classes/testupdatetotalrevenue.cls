@istest
public class testupdatetotalrevenue 
{
    
    @testsetup
    public static void createdata()
    {
        bank__c bn = new bank__c(Name = 'worldbank');
        insert bn;
        
        list<branch__c> branlis = new list<branch__c>();
        for(integer i = 0; i < 9 ; i++)
        {
            if(i==0)
            {
                branch__c na = new branch__c(Bank__c = bn.Id,name = 'maheshbranch'+i,total_revenue__c=null);
                branlis.add(na);
            }
            else
            {
               branch__c n = new branch__c(Bank__c = bn.Id,name = 'maheshbranch'+i,total_revenue__c=0);
               branlis.add(n); 
            }
            
        }
        insert branlis;
        
        list<accounto__c> lisac = new list<accounto__c>();
        for(branch__c bb : branlis)
        {
            for(integer g =0 ;g < 9; g++)
            {
                
                if(g==0)
                {
                    accounto__c acna = new accounto__c(name = 'maheshacc'+g, Account__c=bb.id,account_type__c ='Saving',Balance__c=null);
                    lisac.add(acna);
                }
                else
                {
                    accounto__c acn = new accounto__c(name = 'maheshacc'+g, Account__c=bb.id,account_type__c ='Saving',Balance__c=90000);
                    lisac.add(acn);
                }
            }
        }
        
        insert lisac;
    }
    @istest
    public static void testactual()
    {
        
        list<branch__c> getbrann = new list<branch__c>();
        getbrann = [select id,name,total_revenue__c,(select id,name,Balance__c from Accounts__r) from branch__c];
        test.startTest();
        update getbrann;
        
        for(branch__c vnb : getbrann)
        {
            for(accounto__c cx : vnb.Accounts__r)
            {
                
                system.assertEquals(vnb.total_revenue__c,0);
            }
            
        }
        test.stopTest();
    }
    
}
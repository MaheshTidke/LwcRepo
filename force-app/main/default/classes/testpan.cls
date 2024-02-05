@istest
public class testpan
{
	@istest 
    public static void testpanappp()
    {
        list<black__c> testblack = new list<black__c>();
        string s = 're';
        integer po=81234;
        for(integer r=0;r<5;r++)
        {
            black__c v = new black__c(name = 'bla'+r,pancard__c='re'+r,pho__c='');//re0,re1,re2,re3,re4;
            testblack.add(v);
            
        }
        insert testblack;
        list<app__c> phonelis = new list<app__c>();
        for(black__c b :testblack)
        {string oll='098';
            app__c pl = new app__c(name = 'app'+b.name,pancard__c =b.pancard__c,pho__c=oll);//090,091,092,093,094
         
            phonelis.add(pl);
        }
        insert phonelis;
        
        set<id> blid = new set<id>();
        set<string> panid = new set<string>();
        
        for(app__c aaa :phonelis)
        {
            for(black__c cc :testblack)
            {
                if(cc.pancard__c == aaa.pancard__c)
                {
                    system.assertequals('098',aaa.pho__c);
                    
                }
                
            }
        }
        
    }
}
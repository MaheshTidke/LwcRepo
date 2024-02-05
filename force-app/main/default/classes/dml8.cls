public class dml8 
{
    public static void del()
    {
        list<account> acclist = new list<account>();
        acclist  = [select id,name,noofopp__c from account where noofopp__c>3];
        delete acclist;
    }

}
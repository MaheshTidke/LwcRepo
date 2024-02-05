public class deletefile
{
    public static void del()
    {
        list<Transaction__c> s = new list<Transaction__c>();
        s = [SELECT Name, Id FROM Transaction__c];
        delete s;
    }

}
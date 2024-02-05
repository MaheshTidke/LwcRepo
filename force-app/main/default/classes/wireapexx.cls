public with sharing class wireapexx
{
    @AuraEnabled(cacheable=true)
    public static list<account> getaccountlistforwiredemo() 
    {
        list<account> aclis = new list<account>();
        aclis=[select id,name,type from account limit 5];
        return aclis;
    }
}
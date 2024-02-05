public with sharing class getpofilename {
    @AuraEnabled(cacheable=true)
    public static list<profile> profnames() 
    {
        list<profile> proflis = new list<profile>();
        proflis = [select name from profile];
        return proflis;


    }
}
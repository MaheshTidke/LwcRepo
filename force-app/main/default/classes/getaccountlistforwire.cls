public with sharing class getaccountlistforwire {
    @AuraEnabled(cacheable=true)
    public static list<account> getaccountlistforwiredemo(string ml) 
    {
        list<account> aclis = new list<account>();
        if(ml != null)
        {
            
        aclis=[select Id,Name,AnnualRevenue,Industry  from account where Industry =:ml limit 5];
        
        }
        if(!aclis.isempty())
        {
            return aclis;
        }
        
        return null;
    }
}
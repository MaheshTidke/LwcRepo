public class Objectapinamesofclass {
    @AuraEnabled(cacheable=true)
    public static list<EntityDefinition> objapinames()
    {
        list<EntityDefinition> objnames = new list<EntityDefinition>();
        objnames=[SELECT  QualifiedApiName FROM EntityDefinition order by QualifiedApiName]; 
        Return objnames;
    }

}
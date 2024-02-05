public class akjsd {
    public static list<EntityDefinition> objapinames()
    {
        list<EntityDefinition> objnames = new list<EntityDefinition>();
        objnames=[SELECT  QualifiedApiName FROM EntityDefinition order by QualifiedApiName]; 
        Return objnames;
    }

}
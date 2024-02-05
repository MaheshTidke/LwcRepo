public class ddd 
{
    public static void ma(){
    list<account> acc= new list<account>();
    acc = [select name from account where name like 'batc%'];
    delete acc;
}
}
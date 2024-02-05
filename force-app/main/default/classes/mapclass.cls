public class mapclass 
{
    public static void mapmethod()
    {
        map<integer,string> map1 = new map<integer,string>();
        map1.put(1,'mahesh');
        map1.put(2,'dinesh');
        map1.put(3,'yogesh');
        system.debug(map1);
        map1.put(1,'sakshi');
        system.debug(map1);
    }

}
public class leader 
{
    public static void printleader()
    {
        list<integer> list1 = new list<integer>{149, 1, 3, 2, 8, 70,5};
           integer h = list1.size();
        integer j;
        
        for(integer a=0;a<h;a++)
        {
            for(j = a + 1; j < h;j++)
            {
                if(list1[a]<=list1[j])
                    break;
            }
            if(j==h)
            {
                system.debug(list1[a]);
            }
        }
    }

}
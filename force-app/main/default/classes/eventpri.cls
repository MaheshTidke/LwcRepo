public class eventpri 
{
    public static string eve(string even)
    {
        string w;
        if(string.isBlank(even) ||	 even.length()>2)
        {
            return null;
            
            
        }
        if(even == 'CA')
        {
            w = 'high';
        }
        else
        {
            w='low';
        }
        return w;
       
    }

}
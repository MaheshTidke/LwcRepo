public class usecase1 
{
    public static void use()
    {   set<string> swt1 = new set<string>();
        list<list<string>> la = new list<list<string>>(); 
           
        list<string> l1 = new list<string>{'a;b;a;v;c','x;x;y;c;q'};
        list<string> l2= new list<string>{'m;b;h;j;m','u;k;j;u'};
            la.add(l1);
       		la.add(l2);
		//system.debug(la);
		//system.debug(la[0][0]); 
		//string f1 = la[0][0];
        //f1.split(';');
        //system.debug(f1.split(';'))
   		
        /*if(!la.isempty())
         {
             for(list<string> hg: la)
             {
                for(string fg: hg)
                {
                    system.debug(fg);
                    list<string> stmp = new list<string>(fg.split(';'));
                    stmp.sort();
                   Set<String> tmpSet = New Set<String>(stmp);
                    fg=string.join(New List<String>(tmpSet),';');
                    system.debug(fg);
                    
                    
                }
             }
         }
     */
     
     system.debug(la);
		for(integer i =0;i<la.size();i++)
        {
            for(integer j =0;j<la.size();j++)
            {
            string fg =(la[i][j]);
               
                    list<string> stmp = new list<string>(fg.split(';'));
                    stmp.sort();
                   Set<String> tmpSet = New Set<String>(stmp);
                    fg=string.join(New List<String>(tmpSet),';');
                    //system.debug(fg);
                 la[i][j]=fg;
            }
        }
     system.debug(la);
		
    }
    
}
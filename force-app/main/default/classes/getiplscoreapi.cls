public class getiplscoreapi 
{
    public static list<integer> call1q(string t2,string t1,date matchdate)
    {
        http hp = new http();
        list<integer> g = new list<integer>();
        string ss;
        httpresponse res = new httpresponse();
        httprequest req = new httprequest();
        string tt2 = t2;
        string tt1 = t1;
        date matchdatee = matchdate;
        system.debug('date after passing'+matchdatee);
        
        //String formattedDate = matchdate.format('yyyy-MM-dd');
        //System.debug(formattedDate); // output: 2023-04-21
        
        // String dt = DateTime.newInstance(matchdatee.year(),matchdatee.month(),matchdatee.day()).format('YYYY-MM-DD');
        //system.debug(dt);
        string cur='https://api.cricapi.com/v1/currentMatches?apikey=4b8d1dfc-0336-4922-a6c2-9c975b0d21b3';
        req.setEndpoint(cur);
        req.setmethod('GET');
        
        
        
        res = hp.send(req);
        
        map<string,object> map11 = (map<string,object>)json.deserializeuntyped(res.getBody());
        //system.debug(map11);
        list<object> map22 = (list<object>)map11.get('data');
        for(object obs : map22)
        {
            system.debug(obs);
        }
        system.debug(map22);
        for (Object matchObj : map22)
        {
            Map<String, Object> match = (Map<String, Object>) matchObj;
            List<Object> teamInfo = (List<Object>) match.get('teamInfo');
            String team1Name = (String) ((Map<String, Object>) teamInfo[0]).get('name');
            String team2Name = (String) ((Map<String, Object>) teamInfo[1]).get('name');
            String datea = (String) match.get('date');
            
            List<Object> score = (List<Object>) match.get('score');
            integer score1 = (integer) ((Map<String, Object>) score[0]).get('r');
            integer score2 = (integer) ((Map<String, Object>) score[0]).get('w');
            //integer score3 = (integer) ((Map<String, Object>) score[0]).get('o');
            String inning = (String) ((Map<String, Object>) score[0]).get('inning');
            //System.debug('Team 1: ' + team1Name);
            //System.debug('Team 2: ' + team2Name);
            //System.debug('Date: ' + datea);
            //System.debug('Score: ' + score1 + '/' + score2 + ' (' + inning + ')');
            if(team1Name == tt1 && team2Name == tt2)
            {
                System.debug('Team 1: ' + team1Name);
                System.debug('Team 2: ' + team2Name);
                System.debug('Date: ' + datea);
                //System.debug('Score: ' + score1 + '/' + score2 +'over='+ score3 +' (' + inning + ')');
                 //ss = 'Score: ' + score1 + '/' + score2 +'over='+ score3 +' (' + inning + ')';
                g.add(score1);
                //g.add(score2);
                //g.add(score3);
            }
            
        }
        system.debug(g);
        return g;
        
    }
    
}
@isTest
public class TestOppWithOppChild {
    static testMethod void testInsert() {
        Opportunity opp = new Opportunity(Name='Test Opp',closedate=system.today(), StageName='Closed Won');
        insert opp;
        //oppchild__c opChild = [select name,(select oppchild__r.name__c from oppchild__c) from Opportunity ];
//System.assertEquals(opp.Name, opChild.Name);
    }
    static testMethod void testUpdate() {
        Opportunity opp = new Opportunity(Name='Test Opp', closedate=system.today(),StageName='Prospecting');
        insert opp;
        opp.StageName = 'Closed Won';
        update opp;
        oppchild__c opChild = [SELECT Name, Opportunity__c FROM oppchild__c WHERE Opportunity__c = :opp.id];
        System.assertEquals(opp.Name, opChild.Name);
    }
}
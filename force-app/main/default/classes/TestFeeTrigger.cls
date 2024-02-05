@isTest
public class TestFeeTrigger {
    static testMethod void testIndiaFee() {
        Accounto__c ac = new Accounto__c(Name='Test Account', Country__c='India', Fee__c=100);
        insert ac;
        System.assertEquals(90, ac.Fee__c);
    }
    static testMethod void testUKFee() {
        Accounto__c ac = new Accounto__c(Name='Test Account', Country__c='UK', Fee__c=100);
        insert ac;
        System.assertEquals(80, ac.Fee__c);
    }
    static testMethod void testUSAFee() {
        Accounto__c ac = new Accounto__c(Name='Test Account', Country__c='USA', Fee__c=100);
        insert ac;
        System.assertEquals(70, ac.Fee__c);
    }
    static testMethod void testJapanFee() {
        Accounto__c ac = new Accounto__c(Name='Test Account', Country__c='Japan', Fee__c=100);
        insert ac;
        System.assertEquals(50, ac.Fee__c);
    }
    static testMethod void testOtherCountryFee() {
        Accounto__c ac = new Accounto__c(Name='Test Account', Country__c='Other', Fee__c=100);
        insert ac;
        System.assertEquals(100, ac.Fee__c);
    }
}
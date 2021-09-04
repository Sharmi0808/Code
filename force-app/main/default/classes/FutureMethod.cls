public with sharing class FutureMethod {
    @future
    public static void someFutureMethod(List<ID> recordIds){   
        List<Account> accts = [SELECT Name FROM Account WHERE Id IN :recordIds];
    }
}


public with sharing class BatchClass implements Database.Batchable<sObject>, Database.Stateful {
    String query = 'select id, name from Contact';
    Integer executeCount = 0;
    Integer recordCount = 0;
    
    public Database.QueryLocator start(Database.BatchableContext BC) {
        System.debug('Came to start method @ ' + System.now());
        return (Database.getQueryLocator(query));
    }

    public void execute(Database.BatchableContext BC, List<sObject> scope) {
        System.debug('Came to execute method @ ' + System.now() + '. Number of records: ' + scope.size());
        executeCount++;
        recordCount += scope.size();
        Contact con = (Contact)scope[0];
        System.debug('Contact Name; ' + con.Name);
    }

    public void finish(Database.BatchableContext BC) {
        System.debug('Came to finish method @ ' + System.now());
        System.debug('execute ran ' + executeCount + ' times.');
        System.debug('Records Processed: ' + recordCount + '.');
    }
}

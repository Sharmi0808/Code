public  with sharing class Queueableclass {
    String message;
    public QueueableClass(String message) {
        this.message = message;
    }
    public void execute(QueueableContext qc) {
        System.debug('Came into Queueablemethod.execute() @ ' + System.now() + '. message: ' + message);
        MyQueueableClass1 qc = new QueueableClass('Hello Sharmila');
        Id asyncJobId = System.enqueueJob(qc);
    }
}

public with sharing class LoanController {
    @AuraEnabled
    public static List<Loan__c> getLoans(){
String[] fieldsToCheck = new String[] {
    'LoanId__c', 'Amount__c', 'Repayment_Period_Months__c', 'Status__c'
};

Map<String, Schema.SObjectField> fieldDescribeTokens = Schema.SObjectType.Loan__c.fields.getMap();

for (String field : fieldsToCheck) {
    if (! fieldDescribeTokens.get(field).getDescribe().isAccessible()) {
        throw new System.NoAccessException();
    }
}
return [SELECT LoanId__c, Amount__c, Repayment_Period_Months__c, Status__c
		FROM Loan__c];
}

@AuraEnabled
public static Loan__c saveLoan(Loan__c loan){
    upsert loan;
    return loan;
}
}
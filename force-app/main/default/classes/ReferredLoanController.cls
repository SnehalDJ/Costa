public with sharing class ReferredLoanController {

    @AuraEnabled
public static List<Loan__c> getLoans(){
//     String[] fieldsToCheck = new String[] {
//     'LoanId__c', 'Amount__c', 'Repayment_Period_Months__c', 'Status__c'
// };

// Map<String, Schema.SObjectField> fieldDescribeTokens = Schema.SObjectType.Loan__c.fields.getMap();

// for (String field : fieldsToCheck) {
//     if (! fieldDescribeTokens.get(field).getDescribe().isAccessible()) {
//         throw new System.NoAccessException();
//     }
// }
System.debug('Retrieving loans..');
return [SELECT LoanId__c, Name, Amount__c, Repayment_Period_Months__c, Status__c
		FROM Loan__c
        WHERE Status__c= 'Referred' ];
}

// @AuraEnabled
// public static int getTotalamount(){
//     int[] lendedMoney = [SELECT Amount__c FROM Loan__c];

//     System.debug(lendedMoney);

//     for(int i: lendedMoney){
//         int total =  +i;
//     }
// }
}
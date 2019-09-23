public with sharing class ReferredLoanController {

@AuraEnabled
public static List<Loan__c> getLoans(){
//     String[] fieldsToCheck = new String[] {
//     'LoanId__c', Name, 'Amount__c', 'Repayment_Period_Months__c', 'Status__c'
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

@AuraEnabled
public static Loan__c updateLoan(Loan__c loan){
    upsert loan;
    System.debug('upserting via reviewer');
    System.debug(loan);
    return loan;
}
@AuraEnabled
public static Loan__c getCredit(Loan__c loan){
    loan.Credit_Score__c = Integer.valueof((Math.random() * 10));
    upsert loan;
    System.debug('Upserting after getting credit score');
    System.debug(loan);
    return loan;

}
}
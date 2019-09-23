public with sharing class LoanController {

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
		FROM Loan__c];
}

@AuraEnabled
public static Loan__c saveLoan(Loan__c loan){
    if(loan.Amount__c > 5000 || loan.Amount__c < 1000) {
        loan.Status__c = 'Rejected';
    } else if (loan.Amount__c > 3000) {
        loan.Status__c = 'Referred';
    } else {
        loan.Status__c = 'Approved';
    }
    upsert loan;
    return loan;
}
}
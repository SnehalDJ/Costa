public with sharing class LoanController {

    @AuraEnabled
    public static List<Loan__c> getLoans(){

        System.debug('Retrieving loans..');
        return [SELECT LoanId__c, Name, Amount__c, Repayment_Period_Months__c, Status__c
            FROM Loan__c
            WHERE OwnerId =: userInfo.getUserId()
            ORDER BY  LoanId__c DESC];
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
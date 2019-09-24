public with sharing class ReferredLoanController {

    @AuraEnabled
    public static List<Loan__c> getLoans(){

        System.debug('Retrieving loans..');
        return [SELECT LoanId__c, Name, Amount__c, Repayment_Period_Months__c, Status__c
            FROM Loan__c
            WHERE Status__c= 'Referred'
            ORDER BY  LoanId__c DESC ];
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
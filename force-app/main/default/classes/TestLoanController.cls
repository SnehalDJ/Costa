@isTest
public class TestLoanController {

    @isTest
    static void shouldReturnAllExistingLoans() {
        Loan__C carLoan = new Loan__C();
        carLoan.Amount__c = 4321;
        carLoan.Repayment_Period_Months__c = 9;
        carloan.Salary__c = 50000;
        insert carloan;

        Loan__C homeLoan = new Loan__C();
        homeLoan.Amount__c = 4321;
        homeLoan.Repayment_Period_Months__c = 9;
        homeLoan.Salary__c = 50000;
        insert homeLoan;

        List<Loan__C> loans = LoanController.getLoans();
        System.assert(loans.size() == 2);
    }

    @isTest
    static void shouldReferLoanForOver3K() {
        Loan__C carLoan = new Loan__C();
        carLoan.Amount__c = 4321;
        carLoan.Repayment_Period_Months__c = 9;
        carloan.Salary__c = 50000;
        insert carloan;

         List<Loan__C> loans = LoanController.getLoans();
         for (Loan__C loan: loans){
             System.assert(loan.Status__c == 'Referred');
         }
    }
}
({
	getCreditScore : function(component, event, helper) {
		
		var loan = component.get("v.referredLoan");
		var getCreditEvent = component.getEvent("getCredit");
		getCreditEvent.setParams({ "loan": loan });
        getCreditEvent.fire();
	},

	approvalHandler : function(component, event, helper) {

        var loan = component.get("v.referredLoan");
        component.set("v.referredLoan.Status__c", "Approved");
        var updateEvent = component.getEvent("updateLoanAmend");
        loan.Status__c ='Approved';
		updateEvent.setParams({ "loan": loan });
		console.log(JSON.stringify(loan));
        updateEvent.fire();
	},
	
	rejectionHandler : function(component, event, helper) {

		var loan = component.get("v.referredLoan");
        component.set("v.referredLoan.Status__c", "Rejected");
        var updateEvent = component.getEvent("updateLoanAmend");
		loan.Status__c ='Rejected';
		console.log(JSON.stringify(loan));
		updateEvent.setParams({ "loan": loan });
        updateEvent.fire();
	},

})
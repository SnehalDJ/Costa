({
	updateLoanAmend : function(component, newLoan) {
		var createEvent = component.getEvent("updateLoanAmend");
		createEvent.setParams({"loan": newLoan});
		createEvent.fire();
	}
})
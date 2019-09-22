({
	updateLoan : function(component, newLoan) {
		var createEvent = component.getEvent("updateLoan");
		createEvent.setParams({"loan": newLoan});
		createEvent.fire();
	}
})
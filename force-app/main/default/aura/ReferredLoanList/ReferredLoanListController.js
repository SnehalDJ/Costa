({
	handleUpdateLoan : function(component, event, helper) {
		var updatedLoan = event.getParam("loan");
		console.log("handling update in list");
		console.log(JSON.stringify(updatedLoan));
		helper.updateLoan(component, updatedLoan);
	},

	handleGetCredit : function(component, event, helper) {
		helper.getCreditScore(component, event.getParam("loan"));
	}
})
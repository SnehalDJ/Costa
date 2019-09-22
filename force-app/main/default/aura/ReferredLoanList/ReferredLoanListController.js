({
	handleLoanAmend : function(component, event, helper) {
		var updateLoanItem = event.getParam("loan");
		helper.updateLoanItem(component, updateLoanItem);
	}
})
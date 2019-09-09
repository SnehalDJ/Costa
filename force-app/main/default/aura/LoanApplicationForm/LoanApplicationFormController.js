({
	doInit : function(component, event, helper) {
		var action = component.get("c.getLoans");
		action.setCallback(this, function(response){
			var state = response.getState();
			if(state === "SUCCESS") {
				component.set("v.loans", response.getReturnValue());
			}else {
				console.log("Falied with state: "+state);
			}
		});
		$A.enqueueAction(action);
	},

	clickCreateLoan : function(component, event, helper) {
		var validLoan = component.find('loanform').reduce(function (validSoFar, inputCmp){
			inputCmp.showHelpMessageIfInvalid();
			return validSoFar && inputCmp.get('v.validity').valid;
		}, true);

		if(validLoan){
			var newLoan = component.get("v.newLoan");
			console.log("Create loan: " + JSON.stringify(newLoan));
			helper.createLoan(component, newLoan);
		}
	}
})
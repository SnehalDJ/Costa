({
	updateLoanItem : function(component, loan) {
		var action = component.get(c.updateLoan);
		action.setParams({
			"loan" : loan
		});
		action.setCallback(this, function(response){
			var state = response.getState();
			console.log(state);
			var loans = component.get("v.referredLoans");
				loans.push(response.getReturnValue());
				component.set("v.referredLoans", loans);
				console.log("loan updated in helper");
		});
		$A.enqueueAction(action);
	}
})
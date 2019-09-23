({
	updateLoan : function(component, loan) {
		console.log("In the helper for List");
		var action = component.get("c.updateLoan");
		action.setParams({
			"loan" : loan
		});
		action.setCallback(this, function(response){
			var state = response.getState();
			if (state === "SUCCESS") {
                // do nothing!
            }
		});
		$A.enqueueAction(action);
	},

	getCreditScore : function(component, loan) {
		var action = component.get("c.getCredit");
		action.setParams({
			"loan" : loan
		});
		console.log("handling credit in helper");
		action.setCallback(this, function(response){
			var state = response.getState();
			if (state === "SUCCESS") {
				var loans = component.get("v.referredLoans");
				
				for (var i = 0; i < loans.length; i++) {
                    if (loans[i].Id == loan.Id) {
                        loans[i].Credit_Score__c = response.getReturnValue().Credit_Score__c;
                        break;
                    }
				}
				component.set("v.referredLoans", loans); 
            }
		});
		$A.enqueueAction(action);
	}

})
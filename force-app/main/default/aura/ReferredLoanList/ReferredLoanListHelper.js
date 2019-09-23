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
	}

})
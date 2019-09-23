({
	createLoan : function(component, loan) {
		var action = component.get("c.saveLoan");

		action.setParams({
			"loan" : loan
		});

		action.setCallback(this, function(response){
			var state = response.getState();
			console.log("Create loan: " + JSON.stringify(state));
			// if(JSON.stringify(state) === SUCCESS){
				var loans = component.get("v.loans");
				loans.push(response.getReturnValue());
				component.set("v.loans", loans);
				console.log("loan created in helper");
			// }
		});
		$A.enqueueAction(action);
	},

	// createLoan: function(component, newLoan) {
    //     var createEvent = component.getEvent("createLoan");
    //     createEvent.setParams({ "loan": newLoan });
    //     createEvent.fire();
    // }

})
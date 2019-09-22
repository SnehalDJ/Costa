({
	doInit : function(component, event, helper) {
		var action = component.get("c.getLoans");
		console.log(JSON.stringify(action));
		action.setCallback(this, function(response){
			var state = response.getState();
			if(state === "SUCCESS") {
				component.set("v.referredLoans", response.getReturnValue());
			}else {
				console.log("Falied with state: "+state);
			}
		});
		$A.enqueueAction(action);
	},

	handleUpdateLoan: function(component, event, helper) {
			var updatedLoan = event.getParam("loan");
			helper.updateLoan(component, updatedLoan);
	}
})
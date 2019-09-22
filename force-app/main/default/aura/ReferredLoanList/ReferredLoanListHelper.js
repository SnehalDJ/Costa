({

	saveLoan: function(component, expense, callback) {
        var action = component.get("c.saveLoan");
        action.setParams({
            "loan": loan
        });
        if (callback) {
            action.setCallback(this, callback);
        }
        $A.enqueueAction(action);
    },


	// updateLoan : function(component, loan) {
	// 	var action = component.get(c.updateLoan);
	// 	action.setParams({
	// 		"loan" : loan
	// 	});
	// 	action.setCallback(this, function(response){
	// 		var state = response.getState();
	// 		console.log("Handler for list");
	// 		if (state === "SUCCESS") {
    //             // do nothing!
    //         }
	// 	});
	// 	$A.enqueueAction(action);
	// }

	createLoan: function(component, loan) {
        this.saveLoan(component, loan, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var loans = component.get("v.referredLoans");
                loans.push(response.getReturnValue());
                component.set("v.referredLoans", loans);
            }
        });
    },
    updateLoan: function(component, loan) {
        this.saveLoan(component, loan);
    },

})
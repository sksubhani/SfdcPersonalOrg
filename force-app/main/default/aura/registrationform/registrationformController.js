({
    doSubmit : function(cmp, evt, hlpr) {
        var firstName = cmp.get("v.firstName");
        alert('Hello ' + firstName);
        alert('Event: ' + evt.type);
        cmp.set("v.lastName", "Hello " + firstName);
    },
    
    demoComplete : function(cmp, evt, hlpr) {
        //alert('Event: ' + evt.type);
        
        //alert('Checked: ' + cmp.get("v.checked"));
        
        alert("Demo Attended: " + cmp.find("demoStatus").get("v.checked"));
        
        hlpr.onDemoAttended(cmp, evt);
    }
    
})

//Handling alerts in case they appear anywhere in the app
UIATarget.onAlert = function onAlert(alert)
{
        var title = alert.name();

        UIALogger.logWarning("Alert with title '" + title + "' encountered!");
        return true;
}

#import "tuneup_js/tuneup.js"

var target = UIATarget.localTarget();
var application = target.frontMostApp();
var window = application.mainWindow();

/*test("TC00 - Log Element Tree", function(target, application) {       
    
    logElementTree();

});*/

//TC0.1 - Getting some device information
test("TC0.1 - Gettting some device information", function(target, application) {
   delay(5);
   UIALogger.logMessage("The connected device is an " +target.model());
   UIALogger.logMessage("The OS is " +target.systemName());
   UIALogger.logMessage("The iOS version is " +target.systemVersion());
   UIALogger.logMessage("The name of the device is " +target.name());
});

//TC02 - No device name
test("TC02 - Switch to Books View", function(target, application) {
	 delay(1);
	 UIALogger.logMessage("Tapping on the 'Switch View' button");
	 window.buttons()["Switch View"].tap();
	 delay(2);
	 logElementTree();
	 UIALogger.logMessage("NavigationBar label " +application.navigationBar().name());
	 if (application.navigationBar().name() == "Famous Books") {
	 	UIALogger.logPass("Books page loaded");
	 } else {
	 	UIALogger.logFail("Books page did not load");
	 }
	 
});

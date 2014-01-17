
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

//TC01 - Text to be modified
test("TC01 - Text to be modified", function(target, application) {
    logElementTree();	 
	delay(1);
    window.textFields()[0].tap();
    delay(1);
    application.keyboard().typeString("hello world");
    application.keyboard().typeString("\n");
	delay(1); 
	window.buttons()["modifyTextButton"].tap(); 
	delay(2); 
	UIALogger.logMessage("Text is " + window.staticTexts()["simpleLabel"].text); // need to figure out how to get the text
	 
});	 

//TC02 - Text to be modified - idiot
test("TC02 - Text to be modified", function(target, application) {
    // logElementTree();	 
	delay(1);
    window.textFields()[0].tap();
    delay(1);
    application.keyboard().typeString("don't be an idiot!");
    application.keyboard().typeString("\n");
	delay(1); 
	window.buttons()["modifyTextButton"].tap(); 
	delay(2); 
	logElementTree();
	if (application.alert().scrollViews()[0].staticTexts()["Actung!"].isValid()) { 
		application.alert().buttons()["OK"].tap(); 
	 	UIALogger.logPass("Alert showed up");
	 
	} else {
	 	UIALogger.logFail("Alert failed to show up");	 
	}
	 
	UIALogger.logMessage("Text is " + window.staticTexts()["simpleLabel"].text); // need to figure out how to get the text
	 
});	 


//TC03 - Switch to Books View
test("TC03 - Switch to Books View", function(target, application) {
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

//TC05 - Switch to Books View
test("TC05 - Switch back to Main View", function(target, application) {
	 delay(1);
	 UIALogger.logMessage("Tapping on the 'Canary' button");
	 application.navigationBar().buttons()[0].tap();
	 delay(1);
	 if (application.navigationBar().name() == "Canary") {
	 	UIALogger.logPass("Main page loaded");
	 } else {
	 	UIALogger.logFail("Main page did not load");
	 }	 
});


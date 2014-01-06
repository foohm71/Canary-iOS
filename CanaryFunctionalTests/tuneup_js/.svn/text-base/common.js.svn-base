/**
 * Adds a delay before performing the next action
 * @param accepts number in seconds
 */
function delay(seconds){
	UIATarget.localTarget().delay(seconds);
}

/**
 * This is different than delay. It doesn't delay the next action but rather allows you to temporarily change the duration of the grace period for object resolution.
 * pushTimeout - Stores the current timeout value on a stack and sets a new timeout value.
 * popTimeout - Retrieves the previous timeout value from a stack, restores it as the current timeout value, and returns it.
 * @param accepts number in seconds
 */
function timeout(seconds){
	UIATarget.localTarget().pushTimeout(seconds);
	UIATarget.localTarget().popTimeout();	
}

/**
 * Simply logs the element hierarchy tree
 */
function logElementTree(){
	delay(1);
	UIATarget.localTarget().logElementTree();
}

/**
 * Puts the application in background for the specified period and then brings it back to foreground
 * @param - accepts number in seconds 
 */
function deactivate(seconds){
	UIATarget.localTarget().deactivateAppForDuration(seconds);
}

/**
 * Blows all the cache data and does a forced refresh to reflect it on front-end
 * Puts the application in original state
 */
function clearAllData(){
	UIATarget.localTarget().frontMostApp().mainWindow().navigationBar().buttons()["Clear Cache"].tap();
	delay(2);
	UIATarget.localTarget().frontMostApp().mainWindow().navigationBar().buttons()["Manual refresh"].tap();
	delay(2);
}
#import <Foundation/Foundation.h>

//#include <ApplicationServices/ApplicationServices.h>
#include <Carbon/Carbon.h>

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	//AGAIN, with display manager...
	
	GDHandle firstScreenDevice = DMGetFirstScreenDevice(true);
	
	//get the first screen display information
	
	//VDSwitchInfoPtr firstScreenMode;
//	
//	DMGetDisplayMode(firstScreenDevice, firstScreenMode);
//	
	
	
	//Do some configuration...
	
	Handle theCurrentState;
	
	OSErr configErr;
	
	configErr = DMBeginConfigureDisplays(&theCurrentState);
	
	if (configErr != 0) {
		NSLog([NSString stringWithFormat:@"WTF an error happened with begin configure: %d",configErr]);
	}
	
	//Now let's do some disabling...
	
	GDHandle currentScreen = firstScreenDevice;
	
	while (DMGetNextScreenDevice(currentScreen, true)) {
		currentScreen = DMGetNextScreenDevice(currentScreen, true);
		
		DMDisableDisplay(currentScreen, theCurrentState);
	}
	
	configErr = DMEndConfigureDisplays(theCurrentState);
	
	if (configErr != 0) {
		NSLog([NSString stringWithFormat:@"WTF an error happened with end configure: %d",configErr]);
	}
    // insert code here...
	
	//CGDirectDisplayID mainDisplay = CGMainDisplayID();
//	
//	CGDisplayConfigRef config; // 1
//	
//	CGBeginDisplayConfiguration (&config); // 2
//	
//	CFDictionaryRef currentMode = CGDisplayCurrentMode(mainDisplay);
//	
//	//Print out current display mode FOR FUN
//	
//	NSLog(@"Main display details:");
//	NSLog([[NSDictionary dictionaryWithDictionary:(NSDictionary*)currentMode] description]);
//	
//	if (!CGDisplayIsAsleep(mainDisplay)) {
//		NSLog([NSString	stringWithFormat:@"Main display %d is active you FUCK", mainDisplay]);
//	}
//	
//	CGDisplayCount displayCount;
//	
//	CGGetActiveDisplayList(0, NULL, &displayCount);
	
	//CGConfigureDisplayMode (config, mainDisplay, currentMode);
//	
//	CGError err = CGCompleteDisplayConfiguration (config, kCGConfigureForSession );
	
	//NSLog([NSString stringWithFormat:@"Display count is: %d", displayCount]);
//	
//	CGDirectDisplayID* displayIDs = new CGDirectDisplayID[displayCount];
//	
//	CGGetActiveDisplayList(0, displayIDs, &displayCount);
//	
//	for (int i = 0; i < displayCount; i++) {
//		NSLog([NSString stringWithFormat:@"Settings for display: %d",displayIDs[i]]);
//		NSLog(@"");
//		CFDictionaryRef modeForPrint = CGDisplayCurrentMode(displayIDs[i]);
//		NSLog([[NSDictionary dictionaryWithDictionary:(NSDictionary*)modeForPrint] description]);
//		NSLog(@"");
//	}
	
	//NSLog(@"The following modes are available for the main display:");
//	
//	CFArrayRef availableModesForMainDisplay = CGDisplayAvailableModes(mainDisplay);
//	
//	for (int i = 0; i < CFArrayGetCount(availableModesForMainDisplay); i++) {
//		NSLog([[NSDictionary dictionaryWithDictionary:(NSDictionary*)CFArrayGetValueAtIndex(availableModesForMainDisplay, i)] description]);
//	}
	
	//CGDisplayIOServicePort(<#CGDirectDisplayID display#>);
	
    //NSLog([@"Screen configuration complete!  Return code: " stringByAppendingFormat:@"%d",err]);
	
	//Leave this alone
    [pool drain];
    return 0;
}

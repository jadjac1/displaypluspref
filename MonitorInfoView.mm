//
//  MonitorInfoView.m
//  DisplayPlus
//
//  Created by Jan Staunton on 23/09/2009.
//  Copyright 2009 Jan Staunton. All rights reserved.
//

#import "MonitorInfoView.h"
//#include <IOService.h>
#include <IOKit/IOKitLib.h>
//#include <Kernel/IOKit/IOService.h>


@implementation MonitorInfoView

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil displayID:(CGDirectDisplayID)theid {
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		//theBox = view;
		theDisplayID = theid;
	}
	
	return self;
}

- (void)awakeFromNib {
	//View has been loaded, set some SHIT
	[theBox setTitle:@""];
	[theBox setBoundsOrigin:NSMakePoint(0, 11)];
	
	
	//Set the button...
	//Set graphical indicactor...
	boolean_t displayasleep = CGDisplayIsAsleep(theDisplayID);
	
	if (displayasleep) {
		[enabledDisabledButton setTitle:@"Enable"];
		//[enabledGraphicIndicator setImage:[NSImage imageNamed:@"disabled.png"]];
	}
	else {
		[enabledDisabledButton setTitle:@"Disable"];
		//[enabledGraphicIndicator setImage:[NSImage imageNamed:@"enabled.png"]];
		//[enabledDisabledButton setNeedsDisplay:YES];
	}
	
	CGDisplayCount displayCount;
	//Get display count...
	CGGetOnlineDisplayList(0, NULL, &displayCount);
	
	if (displayCount == 1) {
		[enabledDisabledButton setEnabled:NO];
	}
	
	
	
	
	
	//Set resolution label...
	NSDictionary* currentDisplayMode = [NSDictionary dictionaryWithDictionary:(NSDictionary*)CGDisplayCurrentMode(theDisplayID)];
	[currentDisplayMode retain];
	
//	NSLog(@"Display details:");
//	NSLog([currentDisplayMode description]);
	
	io_service_t ioServicePort = CGDisplayIOServicePort(theDisplayID);
	//NSLog([@"IOService port for display: " stringByAppendingFormat:@"%d",ioServicePort]);
	io_name_t displayName;
	
	IORegistryEntryGetName(ioServicePort, displayName);
	
	NSString* actualDisplayName = [NSString stringWithFormat:@"Display Name: %s", displayName];
	[displayNameLabel setTitleWithMnemonic:actualDisplayName];
	
	//Get display name:
	
//	CFDataRef vendorID, deviceID, model;
//	
//	//vendorID = IORegistryEntrySearchCFProperty(ioServicePort,kIOServicePlane,CFSTR("vendor-id"),kCFAllocatorDefault,kIORegistryIterateRecursively | kIORegistryIterateParents);
//    //deviceID = IORegistryEntrySearchCFProperty(ioServicePort,kIOServicePlane,CFSTR("device-id"),kCFAllocatorDefault,kIORegistryIterateRecursively | kIORegistryIterateParents);
//    model = (CFDataRef)IORegistryEntrySearchCFProperty(ioServicePort,kIOServicePlane,CFSTR("model"),kCFAllocatorDefault,kIORegistryIterateRecursively | kIORegistryIterateParents);
//	
//	NSString* actualDisplayName = [[NSString alloc] initWithBytes:CFDataGetBytePtr(model) length:CFDataGetLength(model) encoding:NSUTF8StringEncoding];
//	actualDisplayName = [@"Display Name: " stringByAppendingString:actualDisplayName];
//	[displayNameLabel setTitleWithMnemonic:actualDisplayName];
	
	
	//Display resolution
	
	
	NSString* tmpString = @"Display Resolution: ";
	
	id widthValue = [currentDisplayMode valueForKey:@"Width"];
	id heightValue = [currentDisplayMode valueForKey:@"Height"];
//	
//	//NSLog([heightValue description]);
	NSString* heightValueString = [heightValue description];
	NSString* widthValueString = [widthValue description];
//	NSLog(heightValueString);
	//NSLog([currentDisplayMode description]);
	//NSLog([[heightValue class] description]);
	
	//NSNumber* tmpNumber = heightValue;
	
	tmpString = [[[tmpString stringByAppendingString:widthValueString] stringByAppendingString:@" x "] stringByAppendingString:heightValueString];
			
	[displayResolutionLabel setTitleWithMnemonic:tmpString];
	
	//Set internal/external label...
	if (CGDisplayIsBuiltin(theDisplayID)) {
		[internalExternalLabel setTitleWithMnemonic:@"Internal Display"];
	}
	else {
		[internalExternalLabel setTitleWithMnemonic:@"External Display"];
	}
}

- (IBAction) handleButtons:(id)sender {
	if (sender == enabledDisabledButton) {
		NSLog(@"LOL you pressed the button....");
		
		//Get an IO Service port...
		
		io_service_t ioServicePort = CGDisplayIOServicePort(theDisplayID);
		//NSLog([@"IOService port for display: " stringByAppendingFormat:@"%d",ioServicePort]);
		//Now we have an IO Service port.... need to send it a command...
		
		//setPowerLevel
		
		
	}
}



@end

//
//  MonitorInfoView.m
//  DisplayPlus
//
//  Created by Jan Staunton on 23/09/2009.
//  Copyright 2009 Jan Staunton. All rights reserved.
//

#import "MonitorInfoView.h"


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
	
	NSString* tmpString = @"Display Resolution: ";
	
	id heightValue = [currentDisplayMode valueForKey:@"Height"];
	
	//NSLog([heightValue description]);
	NSString* heightValueString = [heightValue description];
	NSLog(heightValueString);
	
	//NSLog([[heightValue class] description]);
	
	//NSNumber* tmpNumber = heightValue;
	
	//tmpString = [tmpString stringByAppendingString:heightValueString];
			
	[displayResolutionLabel setTitleWithMnemonic:tmpString];
	
	//Set internal/external label...
	if (!CGDisplayIsBuiltin(theDisplayID)) {
		[internalExternalLabel setTitleWithMnemonic:@"Internal Display"];
	}
	else {
		[internalExternalLabel setTitleWithMnemonic:@"External Display"];
	}
}

- (IBAction) handleButtons:(id)sender {
	if (sender == enabledDisabledButton) {
		NSLog(@"LOL you pressed the button....");
	}
}



@end

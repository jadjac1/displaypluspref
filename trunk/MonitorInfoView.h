//
//  MonitorInfoView.h
//  DisplayPlus
//
//  Created by Jan Staunton on 23/09/2009.
//  Copyright 2009 Jan Staunton. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#include <ApplicationServices/ApplicationServices.h>

@interface MonitorInfoView : NSViewController {

	IBOutlet NSBox*			theBox;
	IBOutlet NSButton*		enabledDisabledButton;
	IBOutlet NSImageView*	enabledGraphicIndicator;
	IBOutlet NSTextField*	displayResolutionLabel;
	IBOutlet NSTextField*	internalExternalLabel;
	IBOutlet NSTextField*	displayNameLabel;
	
	CGDirectDisplayID		theDisplayID;
	
	
}

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil displayID:(CGDirectDisplayID)theid;

- (IBAction) handleButtons:(id)sender;

@end

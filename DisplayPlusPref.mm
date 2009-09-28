//
//  DisplayPlusPref.m
//  DisplayPlus
//
//  Created by Jan Staunton on 17/09/2009.
//  Copyright (c) 2009 Jan Staunton. All rights reserved.
//

#import "DisplayPlusPref.h"

#include <ApplicationServices/ApplicationServices.h>
#import "MonitorInfoView.h"

#define kMonitorViewHeight 150


@implementation DisplayPlusPref

//@synthesize theScrollView;

- (void) mainViewDidLoad
{
	//Establish listener for monitor connection changes...
	
	
	//Create the new to scroll...
	
	NSPoint tmpPoint;
	
	tmpPoint.x = 0;
	tmpPoint.y = 0;
	
	//[viewToScroll setFrameOrigin:tmpPoint];
	
//	theClipView = [[NSClipView alloc] initWithFrame:[theScrollView documentVisibleRect]];
//	[theClipView setNeedsDisplay:YES];
//	[theClipView setFrameOrigin:tmpPoint];
//	
//	//[theClipView setDocumentView:viewToScroll];
//	
//	[theScrollView setContentView:theClipView];
	
	
	//test image
	
	//NSImage* testImage = [NSImage imageNamed:@"test.jpg"];
	
	//NSImage* testImage = [[NSImage alloc] initWithContentsOfFile:@"/Users/Jan/Pictures/orangeflower.jpg"];
//	
//	NSRect imageRect = NSMakeRect(0, 0, [testImage size].width, [testImage size].height);
//	
//	//imageRect = NSMakeRect(0, 0, 2000, 4000);
//	
//	NSLog([NSString stringWithFormat:@"sanity check %f",imageRect.size.height]);
//	
//	
//	NSImageView* test = [[NSImageView alloc] initWithFrame:imageRect];
//	[test setBounds:imageRect];
//	
//	[test setImage:testImage];
//	
//	
//	[theScrollView setDocumentView:test];
//	
//	NSTextField* testField = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 4000, 4000)];
	
	
	//[theScrollView setHasHorizontalScroller:NO];
	
	//if (theScrollView == NULL) {
//		NSLog(@"theScrollView not linked properly...");
//	}
//	
//	[theScrollView setDocumentView:testField];
	
	
	//viewToScroll = [[NSView alloc] initWithFrame:[theScrollView documentVisibleRect]];
//	
//	NSPoint tmpPoint;
//	
//	tmpPoint.x = 0;
//	tmpPoint.y = 0;
//					
//	[viewToScroll setFrameOrigin:tmpPoint];
	
	//Need to populate view with the currently connected monitors...
	
	
	[self refreshInterface];
}

- (void) refreshInterface {
	//I reckon we can garbage collect these mofos...  keep the actions around tho...
	
	//Clear the view
	
	if (viewToScroll) {
	[viewToScroll release];
	}
	
	viewToScroll = [[FlippedNSView alloc] initWithFrame:[theScrollView documentVisibleRect]];
	[viewToScroll setNeedsDisplay:YES];
	
	
	
	NSPoint tmpPoint;
	
	tmpPoint.x = 0;
	tmpPoint.y = 0;
	
	[viewToScroll setFrameOrigin:tmpPoint];
	
	//[viewToScroll setBoundsRotation:-90];
	
	[theScrollView setDocumentView:viewToScroll];
	
	//NSClipView* theClipView = [[NSClipView alloc] initWithFrame:[theScrollView documentVisibleRect]];
//	[theClipView setNeedsDisplay:YES];
//	[theClipView setFrameOrigin:tmpPoint];
//	
	//[theClipView setDocumentView:viewToScroll];
//	
//	[theScrollView setContentView:theClipView];
	
	
	
	//Clear the buttons
	
	[buttonList removeAllObjects];
	
	//okies, first we need to detect the monitors...
	
	//Using an array of serial numbers...
	
	//Get display count...
	CGGetOnlineDisplayList(0, NULL, &displayCount);
	
	//Display count achieved...
	//Now get some IDs...
	CGDirectDisplayID* connectedDisplays = new CGDirectDisplayID[displayCount];
	
	//Set up serial array
	if (theDisplaySerials != NULL) {
		delete theDisplaySerials;
	}
	
	theDisplaySerials = new uint32_t[displayCount];
	
	//Now.... loop those IDs...
	
	for (int i = 0; i < displayCount; i++) { //For each display...
		
		
		
		CGDirectDisplayID currentID = connectedDisplays[i];
		
		
		MonitorInfoView* tmpView = [[MonitorInfoView alloc] initWithNibName:@"MonitorInfoView.nib" bundle:[self bundle] displayID:currentID];
		[[tmpView view] setFrameOrigin:NSMakePoint(0, i*[[tmpView view] frame].size.height)];
												   
		[viewToScroll addSubview:[tmpView view]];
		
		
		//boolean_t displayasleep = CGDisplayIsAsleep(currentID);
//		
//		//Store serial...
//		theDisplaySerials[i] = CGDisplaySerialNumber(currentID);
//		
//		NSButton* tempButton = [[NSButton alloc] initWithFrame:NSRectFromCGRect(CGRectMake([viewToScroll frame].size.width-70-35,
//																						   (kMonitorViewHeight/2),
//																						   70, 25))];
//		
//		[tempButton setButtonType:NSMomentaryPushInButton];
//		[tempButton setBezelStyle:NSTexturedRoundedBezelStyle];
//		[tempButton setImagePosition:NSNoImage];
//		
//		if (displayasleep) {
//			[tempButton setTitle:@"Disabled"];
//		}
//		else {
//			[tempButton setTitle:@"Enabled"];
//		}
//		
//		//Add target to this class...
//		
//		[tempButton setTarget:self];
//		[tempButton setAction:@selector(handleButton:)];
//		[tempButton setNeedsDisplay:YES];
//		
//		//Add to buttonList...
//		
//		[buttonList addObject:tempButton];
//		
//		
//		//Now create the view...
//		
//		FlippedNSBox* tempMainView = [[FlippedNSBox alloc] initWithFrame:
//				NSRectFromCGRect(CGRectMake(0, i*kMonitorViewHeight, [viewToScroll frame].size.width, kMonitorViewHeight))];
//		
//		[tempMainView setTitle:@""];
//		
//		[tempButton setFrame:NSMakeRect([tempMainView frame].size.width-70-35,
//										(kMonitorViewHeight/2)-25,
//										70, 25)];
//		
//		[tempMainView addSubview:tempButton];
//		
//		//Add a graphic...
//		
//		NSImageView* indicatorView = [[NSImageView alloc] initWithFrame:NSMakeRect(0,
//																				   0,
//																				   10,
//																				   20)];
//		if (displayasleep) {
//			[indicatorView setImage:[NSImage imageNamed:@"disabled.tiff"]];
//		}
//		else {
//			[indicatorView setImage:[NSImage imageNamed:@"enabled.tiff"]]; 
//		}
//		
//		[indicatorView setFrame:NSMakeRect([tempMainView frame].size.width-70-5,
//										   (kMonitorViewHeight/2)-80,
//										   10,
//										   kMonitorViewHeight)];
//		
//		[indicatorView setFrame:NSMakeRect(25,
//										   25,
//										   10,
//										   20)];
//			 
//		[tempMainView addSubview:indicatorView];
//	
//			 
//			 //Add a dividor line...
//			 
//		
//		
//		NSBox* verticalLine = [[NSBox alloc] initWithFrame:NSMakeRect([tempMainView frame].size.width-135,
//																	  5,
//																	  5,
//																	  kMonitorViewHeight-35)];
//		
//		[verticalLine setTitle:@""];
//		[tempMainView addSubview:verticalLine];
//		
//		//Set some monitor specific information...
//		
//		NSTextField* monitorNameLabel = [[NSTextField alloc] initWithFrame:NSMakeRect(5,
//																					  5,
//																					  50,
//																					  25)];
//		
//		
//		
////		[monitorNameLabel setTitleWithMnemonic:CGDisplayModelNumber(currentID)];
//		[monitorNameLabel setTitleWithMnemonic:@"twat!"];
//		[monitorNameLabel setEditable:NO];
//		[monitorNameLabel setSelectable:NO];
//		
//		[tempMainView addSubview:monitorNameLabel];
//		
////		[tempMainView 
//		[viewToScroll addSubview:tempMainView];
//		
//		
//		CGDirectDisplayID mainDisplay = CGMainDisplayID();
//			
//			CFDictionaryRef currentMode = CGDisplayCurrentMode(mainDisplay);
//			
//			//Print out current display mode FOR FUN
//			
//			NSLog(@"Main display details:");
//			NSLog([[NSDictionary dictionaryWithDictionary:(NSDictionary*)currentMode] description]);
//		
		
	}
										

	
	
}

- (void) handleButton:(id)sender {
	
	if (sender == theDisplayPreferencesButton) {
		//Open display prefs
		//NSLog(@"Opening Display Preferences...");
		[[NSWorkspace sharedWorkspace] openFile:@"/System/Library/PreferencePanes/Displays.prefPane" withApplication:nil andDeactivate:NO];
		
	}
	//Other buttons...
	
}

@end

//
//  DisplayPlusPref.h
//  DisplayPlus
//
//  Created by Jan Staunton on 17/09/2009.
//  Copyright (c) 2009 Jan Staunton. All rights reserved.
//

#import <PreferencePanes/PreferencePanes.h>
#import "FlippedNSView.h"
#import "FlippedNSBox.h"


@interface DisplayPlusPref : NSPreferencePane 
{

	IBOutlet NSButton*		theDisplayPreferencesButton;
	IBOutlet NSScrollView*	theScrollView;
	
	FlippedNSView*					viewToScroll;
	//NSClipView*				theClipView;
	
	uint32_t*				theDisplaySerials;
	CGDisplayCount			displayCount;
	
	NSMutableArray*			buttonList;
	
	
}

- (void) mainViewDidLoad;
- (void) refreshInterface;
- (void) handleButton:(id)sender;

//@property (nonatomic, retain) NSScrollView* theScrollView;

@end

//
//  DisplayPlusPref.h
//  DisplayPlus
//
//  Created by Jan Staunton on 17/09/2009.
//  Copyright (c) 2009 Jan Staunton. All rights reserved.
//

#import <PreferencePanes/PreferencePanes.h>


@interface DisplayPlusPref : NSPreferencePane 
{

	IBOutlet NSScrollView* theScrollView;
	
}

- (void) mainViewDidLoad;
- (void) refreshInterface;

@property (nonatomic, retain) NSScrollView* theScrollView;

@end

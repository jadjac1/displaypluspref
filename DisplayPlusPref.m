//
//  DisplayPlusPref.m
//  DisplayPlus
//
//  Created by Jan Staunton on 17/09/2009.
//  Copyright (c) 2009 Jan Staunton. All rights reserved.
//

#import "DisplayPlusPref.h"

#include <ApplicationServices/ApplicationServices.h>


@implementation DisplayPlusPref

@synthesize theScrollView;

- (void) mainViewDidLoad
{
	//Establish listener for monitor connection changes...
	
		
	
	//Need to populate view with the currently connected monitors...
	[self refreshInterface];
}

- (void) refreshInterface {
	
}

@end

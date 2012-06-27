//
//  AppDelegate.h
//  PowerHour
//
//  Created by MARC W REGAN on 6/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    NSInteger _seconds;
    NSInteger _drinks;
    BOOL _firstRun;
    BOOL _showingDrinkLabel;
    NSInteger _drinkLabelCount;
    NSInteger _goBootCount;
}

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *drinkLabel;
@property (weak) IBOutlet NSTextField *secondsLabel;
@property (weak) IBOutlet NSTextField *drinksLabel;
@property (weak) IBOutlet NSImageView *mainPicture;

@end

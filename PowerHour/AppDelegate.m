//
//  AppDelegate.m
//  PowerHour
//
//  Created by MARC W REGAN on 6/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate

@synthesize window = _window;
@synthesize drinkLabel = _drinkLabel;
@synthesize secondsLabel = _secondsLabel;
@synthesize drinksLabel = _drinksLabel;
@synthesize mainPicture = _mainPicture;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    [self.drinksLabel setStringValue:@"0"];
    [self.secondsLabel setStringValue:@""];
    
    _seconds  = 60;
    _drinks = 0;
    _firstRun = YES;
    
    [self performSelector:@selector(timerFired:) withObject:nil afterDelay:1];
}


- (void)nextSong:(id) sender {
    NSString* path = [[NSBundle mainBundle] pathForResource:@"NextSong" ofType:@"scpt"];
    NSURL* url = [NSURL fileURLWithPath:path];NSDictionary* errors = [NSDictionary dictionary];
    NSAppleScript* appleScript = [[NSAppleScript alloc] initWithContentsOfURL:url error:&errors];
    [appleScript executeAndReturnError:nil];
}

- (void)timerFired:(id) sender {
    
    
    if (_seconds == 10) {
        // Get ready to drink
        [self getReady:self];
        
    } else if (_seconds == 0) {
        // Drink
        
        _drinks++;
        
        if (_drinks == 60) {
            [self performSelector:@selector(goBoot:) withObject:nil afterDelay:.1];
            NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"drink" ofType:@"wav"];
            NSSound *sound = [[NSSound alloc] initWithContentsOfFile:resourcePath byReference:YES];
            [sound play];
            return;
        }
        
        [self performSelector:@selector(driiiink:) withObject:nil afterDelay:.1];
        
        
        _seconds = 60;
        
    } 
    
    [self.secondsLabel setStringValue:[NSString stringWithFormat:@"%d", _seconds]];
    [self.drinksLabel setStringValue:[NSString stringWithFormat:@"%d", _drinks]];
    
    [self performSelector:@selector(timerFired:) withObject:nil afterDelay:1];
    
    _seconds--;
}

- (void)getReady:(id) sender {
    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"getready" ofType:@"wav"];
    NSSound *sound = [[NSSound alloc] initWithContentsOfFile:resourcePath byReference:YES];
    [sound play];
}

- (void)driiiink:(id) sender {
    
    [self.drinkLabel setHidden: (_drinkLabelCount % 2)];
    
    if (_drinkLabelCount == 0) {
        [self nextSong:self];
        NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"drink" ofType:@"wav"];
        NSSound *sound = [[NSSound alloc] initWithContentsOfFile:resourcePath byReference:YES];
        [sound play];
    }
    
    if (_drinkLabelCount == 3) {
        _drinkLabelCount = 0;
    } else {
        [self performSelector:@selector(driiiink:) withObject:nil afterDelay:.8];
        _drinkLabelCount++;
    }
}

- (void)goBoot:(id) sender { 
    
    self.mainPicture.image = [NSImage imageNamed:[NSString stringWithFormat:@"boot%d.bmp", _goBootCount+1]];
    [self.drinkLabel setStringValue:@"Go Boot!"];
    
    [self.drinkLabel setHidden: (_goBootCount % 2)];
    
    if (_goBootCount == 3) {
        _goBootCount = 0;
    } else {
        _goBootCount++;
    }
    
     [self performSelector:@selector(goBoot:) withObject:nil afterDelay:.7];
    
}



@end

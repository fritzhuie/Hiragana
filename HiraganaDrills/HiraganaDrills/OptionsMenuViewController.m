//
//  OptionsMenuViewController.m
//  HiraganaDrills
//
//  Created by Fritz Huie on 4/17/15.
//  Copyright (c) 2015 FritzHuie. All rights reserved.
//

#import "OptionsMenuViewController.h"
#import "AppDelegate.h"
@import UIKit;

@implementation OptionsMenuViewController{
    AppDelegate* delegate;
}

@synthesize pairToggle;
@synthesize soundToggle;

- (void)viewDidLoad {
    delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    [pairToggle setOn:delegate.includePairs];
    [soundToggle setOn:delegate.sound];
    
}

- (IBAction)pairsSwitchToggled:(id)sender {
    delegate.includePairs = [self.pairToggle isOn];
}
- (IBAction)soundToggled:(id)sender {
    delegate.sound = [self.soundToggle isOn];
}

@end
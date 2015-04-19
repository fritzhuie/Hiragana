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

- (void)viewDidLoad {
    delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    [pairToggle setOn:delegate.includePairs];
    
}

- (IBAction)pairsSwitchToggled:(id)sender {
    if ([self.pairToggle isOn])
        delegate.includePairs = YES;
    else
        delegate.includePairs = NO;
}

@end
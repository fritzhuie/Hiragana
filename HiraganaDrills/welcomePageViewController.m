//
//  welcomePageViewController.m
//  HiraganaDrills
//
//  Created by Fritz Huie on 5/20/15.
//  Copyright (c) 2015 FritzHuie. All rights reserved.
//

#import "welcomePageViewController.h"
#import "AppDelegate.h"

@interface welcomePageViewController ()

@end

@implementation welcomePageViewController{
    AppDelegate* delegate;
}

@synthesize hiriganaPressed;
@synthesize katakanaPressed;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}
- (IBAction)hiriganaPressed:(id)sender {
    delegate.katakanaSelected = NO;
    NSLog(@"hirigana set");
}
- (IBAction)katakanaPressed:(id)sender {
    delegate.katakanaSelected = YES;
    NSLog(@"katakana set");

}

@end

//
//  welcomePageViewController.m
//  HiraganaDrills
//
//  Created by Fritz Huie on 5/20/15.
//  Copyright (c) 2015 FritzHuie. All rights reserved.
//

#import "welcomePageViewController.h"
#import "ViewController.h"

@interface welcomePageViewController ()

@end

@implementation welcomePageViewController{
}

@synthesize hiraganaButton;
@synthesize katakanaButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}
- (IBAction)hiraganaSelected:(id)sender {
    [ViewController setKatakana:NO];
    [self performSegueWithIdentifier:@"beginDrill" sender:self];
}
- (IBAction)katakanaSelected:(id)sender {
    [ViewController setKatakana:YES];
    [self performSegueWithIdentifier:@"beginDrill" sender:self];
}

@end

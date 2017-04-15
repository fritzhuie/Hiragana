//
//  CheatSheetViewController.m
//  HiraganaDrills
//
//  Created by Fritz Huie on 4/15/17.
//  Copyright © 2017 FritzHuie. All rights reserved.
//

#import "CheatSheetViewController.h"

@import UIKit;

@interface CheatSheetViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *characterListImage;
@end

@implementation CheatSheetViewController {
    UIImage* hiragana;
    UIImage* hiraganatenten;
    UIImage* katakana;
    UIImage* katakanatenten;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"CheatSheetViewController loaded");
    hiragana = [UIImage imageNamed:@"hirasheet"];
    hiraganatenten = [UIImage imageNamed:@"hirasheettenten"];
    katakana = [UIImage imageNamed:@"katasheet"];
    katakanatenten = [UIImage imageNamed:@"kanasheettenten"];
    _characterListImage.image = hiragana;
}

- (IBAction)hiraButtonPressed:(UIButton *)sender {
    _characterListImage.image = hiragana;
}

- (IBAction)hiraTenButtonPressed:(UIButton *)sender {
    _characterListImage.image = hiraganatenten;
}

- (IBAction)kataButtonPressed:(UIButton *)sender {
    _characterListImage.image = katakana;
}

- (IBAction)kataTenButtonPressed:(UIButton *)sender {
    _characterListImage.image = katakanatenten;
}

@end

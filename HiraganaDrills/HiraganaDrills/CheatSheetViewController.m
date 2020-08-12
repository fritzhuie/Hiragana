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
@property (weak, nonatomic) IBOutlet UIButton *b1;
@property (weak, nonatomic) IBOutlet UIButton *b2;
@property (weak, nonatomic) IBOutlet UIButton *b3;
@property (weak, nonatomic) IBOutlet UIButton *b4;

@property (weak, nonatomic) IBOutlet UIImageView *characterListImage;
@end

@implementation CheatSheetViewController {

}

UIColor* lightGreen;
UIColor* lightGrey;
- (IBAction)closeButtonPressed:(UIButton *)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    lightGreen = [UIColor colorWithRed:220.0/255.0 green:244.0/255.0 blue:221.0/255.0 alpha:1.0];
    lightGrey = [UIColor colorWithRed:220.0/255.0 green:220.0/255.0 blue:220.0/255.0 alpha:1.0];

    _characterListImage.image = [UIImage imageNamed:@"hirasheet"];
    [self resetButtonColors];
    self.b1.backgroundColor = lightGreen;
}

- (void)resetButtonColors {
    self.b1.backgroundColor = lightGrey;
    self.b2.backgroundColor = lightGrey;
    self.b3.backgroundColor = lightGrey;
    self.b4.backgroundColor = lightGrey;
}

- (IBAction)hiraButtonPressed:(UIButton *)sender {
    _characterListImage.image = [UIImage imageNamed:@"hirasheet"];
    [self resetButtonColors];
    self.b1.backgroundColor = lightGreen;
}

- (IBAction)hiraTenButtonPressed:(UIButton *)sender {
    _characterListImage.image = [UIImage imageNamed:@"hirasheettenten"];
    [self resetButtonColors];
    self.b2.backgroundColor = lightGreen;
}

- (IBAction)kataButtonPressed:(UIButton *)sender {
    _characterListImage.image = [UIImage imageNamed:@"katasheet"];
    [self resetButtonColors];
    self.b3.backgroundColor = lightGreen;
}

- (IBAction)kataTenButtonPressed:(UIButton *)sender {
    _characterListImage.image = [UIImage imageNamed:@"kanasheettenten"];
    [self resetButtonColors];
    self.b4.backgroundColor = lightGreen;
}

@end

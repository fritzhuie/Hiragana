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

- (void)viewDidLoad {
    [super viewDidLoad];
    _characterListImage.image = [UIImage imageNamed:@"hirasheet"];
    
}

- (IBAction)hiraButtonPressed:(UIButton *)sender {
    _characterListImage.image = [UIImage imageNamed:@"hirasheet"];
}

- (IBAction)hiraTenButtonPressed:(UIButton *)sender {
    _characterListImage.image = [UIImage imageNamed:@"hirasheettenten"];
}

- (IBAction)kataButtonPressed:(UIButton *)sender {
    _characterListImage.image = [UIImage imageNamed:@"katasheet"];
}

- (IBAction)kataTenButtonPressed:(UIButton *)sender {
    _characterListImage.image = [UIImage imageNamed:@"kanasheettenten"];
}

@end

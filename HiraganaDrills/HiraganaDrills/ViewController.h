//
//  ViewController.h
//  HiraganaDrills
//
//  Created by Fritz Huie on 4/14/15.
//  Copyright (c) 2015 FritzHuie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(nonatomic, strong) NSMutableArray* remaining;
@property (nonatomic, strong) NSDictionary* hirigana;
@property (nonatomic, strong) NSDictionary* hiriganaPairs;

@property (weak, nonatomic) IBOutlet UILabel *hiriganaLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UIButton *next;
@property (weak, nonatomic) IBOutlet UIButton *answer;

@property (weak, nonatomic) IBOutlet UIButton *beginDrillButton;
@property (weak, nonatomic) IBOutlet UIButton *beginDrillButtonSmall;
@property (weak, nonatomic) IBOutlet UILabel *counter;
@property (weak, nonatomic) IBOutlet UILabel *allDoneLabel;
@property (weak, nonatomic) IBOutlet UIButton *wrongButton;
@property (weak, nonatomic) IBOutlet UIImageView *cardBackImage;

@end


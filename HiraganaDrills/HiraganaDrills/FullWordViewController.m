//
//  FullWordViewController.m
//  HiraganaDrills
//
//  Created by Fritz Huie on 5/26/15.
//  Copyright (c) 2015 FritzHuie. All rights reserved.
//

#import "FullWordViewController.h"
#import "kanaLibrary.h"
#import "CharacterView.h"

@interface KanaButton : UILabel {}
-(void)setColor;
-(void)inititalizeAtPosition:(CGRect) rect;
@end

@implementation KanaButton {
    NSString* currentKana;
}

-(void)setColor{
    [self setBackgroundColor:[UIColor blueColor]];
}

-(void)inititalizeAtPosition:(CGRect) rect {
    [self setFrame:rect];
    [self setText:@"ぁ"];
    [self setAdjustsFontSizeToFitWidth:true];
    [self setTextAlignment:NSTextAlignmentCenter];
    [self drawTextInRect:rect];
}

@end

@interface FullWordViewController ()
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGestureRecogniser;

@end

@implementation FullWordViewController {
    NSArray* wordList;
    NSString* currentWord;
    NSDictionary* hirakanaLibrary;
    NSDictionary* katakanaLibrary;
    NSDictionary* wordLibrary;
    NSMutableArray* wordView;
}

@synthesize tapGestureRecogniser;

- (void)viewDidLoad {
    [super viewDidLoad];
    hirakanaLibrary = HIRAGANA_DICT;
    katakanaLibrary = KATAKANA_DICT;
    wordList = [HIRAGANA_WORD_DICT allKeys];
    wordView = [[NSMutableArray alloc]init];
    [self createTestButton];
}

- (void)createTestButton {
    KanaButton* b = [[KanaButton alloc]init];
    [self.view addSubview:b];
    [b inititalizeAtPosition:CGRectMake(200, 200, 100, 100)];
    [wordView addObject:b];
    [wordView[0] setColor];
}

- (IBAction)newWordButtonPressed:(id)sender {
    
}

- (void)showNewWord {
    currentWord = wordList[0]; //static for testing
}

- (IBAction)tapDetected:(id)sender {
    NSLog(@"X:%f Y:%f", [tapGestureRecogniser locationInView: self.view].x, [tapGestureRecogniser locationInView:self.view].y);
}



@end

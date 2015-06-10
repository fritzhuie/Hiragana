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

#define WORD_VIEW_WIDTH 320.0f
#define WORD_VIEW_HEIGHT 150.0f
#define WORD_VIEW_Y 74.0f

@interface FullWordViewController ()
@property (weak, nonatomic) IBOutlet UILabel *kanaWordLabel;
@property (weak, nonatomic) IBOutlet UIView *wordView;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGestureRecogniser;
@property (weak, nonatomic) IBOutlet UILabel *answerBox;

@end

@implementation FullWordViewController {
    NSArray* wordList;
    NSString* currentWord;
    NSArray* views;
    NSDictionary* kanaLibrary;
    NSDictionary* wordLibrary;
}

@synthesize wordView,tapGestureRecogniser, kanaWordLabel, answerBox;

- (void)viewDidLoad {
    [super viewDidLoad];
    kanaLibrary = HIRAGANA_DICT;
    wordList = [HIRAGANA_WORD_DICT allKeys];
    answerBox.hidden = YES;
    [self showNewWord];
}

- (IBAction)newWordButtonPressed:(id)sender {
    [self showNewWord];
}

- (void)showNewWord {
    currentWord = wordList[0]; //static for testing

//TODO: Import word list and select random word
    kanaWordLabel.text = [currentWord stringByReplacingOccurrencesOfString:@"/" withString:@""];
}

- (NSString *) translate:(NSString *)key {
    if ([kanaLibrary objectForKey:key])
        return [kanaLibrary objectForKey:key];
    else
        return @"error";
}

- (void)showAnswerForKanaAt:(CGPoint)location{
    if ([wordList containsObject:currentWord]) {
        NSArray* a = [currentWord componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"/"]];
        CGFloat wordLength = ([currentWord length]/2)+((int)[currentWord length]% (int)2.0f);
        CGFloat boxWidth =  320.0 / wordLength;
        NSString* selectedKana;
        int i = 0;
        while(i < wordLength){
            if (location.x < ((i+1)*boxWidth)){
                selectedKana = a[i];
                break;
            }i++;}
        kanaWordLabel.text = [[currentWord stringByReplacingOccurrencesOfString:a[i] withString:[self translate:selectedKana]] stringByReplacingOccurrencesOfString:@"/" withString:@""];
    }

//TODO: init CharacterView for each character, move animations and logic to that class
}

- (void)playAnswerAnimationForWord:(NSString*)answer WithBounds:(CGRect)bounds{
    [answerBox setFrame:bounds];
    [answerBox setBounds:bounds];
    answerBox.text = answer;
    answerBox.hidden = NO;
}

- (IBAction)tapDetected:(id)sender {
    NSLog(@"X:%f Y:%f", [tapGestureRecogniser locationInView:wordView].x, [tapGestureRecogniser locationInView:wordView].y);
    [self showAnswerForKanaAt:[tapGestureRecogniser locationInView:wordView]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

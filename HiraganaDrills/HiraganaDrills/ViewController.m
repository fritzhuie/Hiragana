//
//  ViewController.m
//  hirigana drills
//
//  Created by Fritz huie on 11/9/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "ViewController.h"

@import Foundation;

@implementation ViewController{
    NSString *currentDisplayed;
}

@synthesize next;
@synthesize answer;
@synthesize hiriganaLabel;
@synthesize answerLabel;
@synthesize beginDrillButtonSmall;
@synthesize beginDrillButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self populatehiriganaDictionary];
    [self showDefaultInterface];
}

- (void)showDefaultInterface{
    beginDrillButtonSmall.hidden = YES;
    hiriganaLabel.hidden = YES;
    answerLabel.hidden = YES;
    beginDrillButton.hidden = NO;
    answer.hidden = YES;
    next.hidden = YES;
}

- (void)showDrillInterface {
    beginDrillButtonSmall.hidden = NO;
    hiriganaLabel.hidden = NO;
    answerLabel.hidden = YES;
    beginDrillButton.hidden = YES;
    answer.hidden = NO;
    next.hidden = NO;
}

- (void)showCompletedInterface {
    [self showDefaultInterface];
    hiriganaLabel.hidden = NO;
}

- (void)answerCorrectly{
    [self showNewHirigana];
}

- (IBAction)bigButtonPressed:(id)sender {
    [self answerCorrectly];
}

- (IBAction)Start:(id)sender {
    [self showDrillInterface];
    _remaining = [NSMutableArray arrayWithArray:_hirigana.allKeys];
    [self showNewHirigana];
}

- (void)showNewHirigana
{
    answerLabel.hidden = YES;
    
    if (_remaining.count > 0) {
        int i = rand()%_remaining.count;
        currentDisplayed = _remaining[i];
        [_remaining removeObject:_remaining[i]];
        hiriganaLabel.text = currentDisplayed;
    }else{
        hiriganaLabel.text = @"√";
        [self showCompletedInterface];
    }
    NSLog(@"remaining: %lu", (unsigned long)_remaining.count);
}

- (IBAction)help:(id)sender {
    answerLabel.hidden = NO;
    if (currentDisplayed) {
        answerLabel.text = [self translate:currentDisplayed];
        [_remaining addObject:currentDisplayed];
    }else{
        NSLog(@"Current not set");
        return;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *) translate:(NSString *)key {
    if ([_hirigana objectForKey:key])
        return [_hirigana objectForKey:key];
    
    NSLog(@"Failed to find match for key: \"%@\", attempt to return: %@", key, [_hirigana objectForKey:key]);
    return @"err";
    
}

- (void) populatehiriganaDictionary{
    _hirigana = @{
                  @"ぁ": @"a",
                  @"い": @"i",
                  @"う": @"u",
                  @"え": @"e",
                  @"お": @"o",
                  @"か": @"ka",
                  @"き": @"ki",
                  @"く": @"ku",
                  @"け": @"ke",
                  @"こ": @"ko",
                  @"さ": @"sa",
                  @"し": @"shi",
                  @"す": @"su",
                  @"せ": @"se",
                  @"そ": @"so",
                  @"た": @"ta",
                  @"ち": @"chi",
                  @"つ": @"tsu",
                  @"て": @"te",
                  @"と": @"to",
                  @"な": @"na",
                  @"に": @"ni",
                  @"ぬ": @"nu",
                  @"ね": @"ne",
                  @"の": @"no",
                  @"は": @"ha",
                  @"ひ": @"hi",
                  @"ふ": @"hu",
                  @"へ": @"he",
                  @"ほ": @"ho",
                  @"ま": @"ma",
                  @"み": @"mi",
                  @"む": @"mu",
                  @"め": @"me",
                  @"も": @"mo",
                  @"や": @"ya",
                  @"ゆ": @"yu",
                  @"よ": @"yo",
                  @"ら": @"ra",
                  @"り": @"ri",
                  @"る": @"ru",
                  @"れ": @"re",
                  @"ろ": @"ro",
                  @"わ": @"wa",
                  @"を": @"wo",
                  @"ん": @"n",
                  @"が": @"ga",
                  @"ぎ": @"gi",
                  @"ぐ": @"gu",
                  @"げ": @"ge",
                  @"ご": @"go",
                  @"ざ": @"za",
                  @"じ": @"ji",
                  @"ず": @"zu",
                  @"ぜ": @"ze",
                  @"ぞ": @"zo",
                  @"だ": @"da",
                  @"ぢ": @"di",
                  @"づ": @"du",
                  @"で": @"de",
                  @"ど": @"do",
                  @"ば": @"ba",
                  @"び": @"bi",
                  @"ぶ": @"bu",
                  @"べ": @"be",
                  @"ぼ": @"bo",
                  @"ぱ": @"pa",
                  @"ぴ": @"pi",
                  @"ぷ": @"pu",
                  @"ぺ": @"pe",
                  @"ぽ": @"po"
                  };
    
    _hiriganaPairs = [[NSArray alloc] initWithObjects:
                      @"きゃ", @"きゅ", @"きょ",
                      @"ぎゃ", @"ぎゅ", @"ぎょ",
                      @"しゃ", @"しゅ", @"しょ",
                      @"じゃ", @"じゅ", @"じょ",
                      @"ちゃ", @"ちゅ", @"ちょ",
                      @"にゃ", @"にゅ", @"にょ",
                      @"ひゃ", @"ひゅ", @"ひょ",
                      @"びゃ", @"びゅ", @"びょ",
                      @"ぴゃ", @"ぴゅ", @"ぴょ", nil];
}



@end


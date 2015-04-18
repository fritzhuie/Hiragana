//
//  ViewController.m
//  hirigana drills
//
//  Created by Fritz huie on 11/9/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@import Foundation;

@implementation ViewController{
    NSString *currentDisplayed;
    int errorCount;
    AppDelegate* delegate;
}

@synthesize next, wrongButton, answer, hiriganaLabel, answerLabel, beginDrillButtonSmall, beginDrillButton, allDoneLabel;
@synthesize counter;


- (void)viewDidLoad {
    [super viewDidLoad];
    [self populatehiriganaDictionary];
    [self showDefaultInterface];
    delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
}

- (void)showDefaultInterface{
    beginDrillButtonSmall.hidden = YES;
    hiriganaLabel.hidden = YES;
    answerLabel.hidden = YES;
    beginDrillButton.hidden = NO;
    allDoneLabel.hidden = YES;
    answer.hidden = YES;
    next.hidden = YES;
    counter.hidden = YES;
    wrongButton.hidden = YES;
}

- (void)showDrillInterface {
    beginDrillButtonSmall.hidden = NO;
    hiriganaLabel.hidden = NO;
    answerLabel.hidden = YES;
    beginDrillButton.hidden = YES;
    answer.hidden = NO;
    next.hidden = NO;
    counter.hidden = NO;
    allDoneLabel.hidden = YES;
    wrongButton.hidden = NO;
}

- (void)showCompletedInterface {
    [self showDefaultInterface];
    hiriganaLabel.hidden = NO;
    counter.hidden = NO;
    allDoneLabel.hidden = YES;
    wrongButton.hidden = YES;
}

- (void)answerCorrectly{
    [self showNewHirigana];
}

- (IBAction)correctPressed:(id)sender {
    [self answerCorrectly];
}

- (IBAction)Start:(id)sender {
    [self showDrillInterface];
    
    //disable or enable hirigana pairs
    errorCount = 0;
    if (delegate.includePairs) {
        _remaining = [NSMutableArray arrayWithArray:_hiriganaPairs.allKeys];
        [self sizeForPairs:TRUE];
    }else{
        _remaining = [NSMutableArray arrayWithArray:_hirigana.allKeys];
        [self sizeForPairs:TRUE];
    }
    
    counter.text = [NSString stringWithFormat:@"Remaining: %lu", (unsigned long)_remaining.count];
    [self showNewHirigana];
}

- (void)sizeForPairs:(BOOL)pairs {

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
        counter.text = [NSString stringWithFormat: @"Repeated: %lu", (long)errorCount];
        [self showCompletedInterface];
    }
    
    if (_remaining.count) {
        counter.text = [NSString stringWithFormat:@"Remaining: %lu", (unsigned long)_remaining.count];
    }
}
- (IBAction)incorrectPressed:(id)sender {
    if (currentDisplayed) {
        [_remaining addObject:currentDisplayed];
        [self showNewHirigana];
        errorCount+=1;
    }else{
        NSLog(@"Current not set");
        return;
    }
}

- (IBAction)help:(id)sender {
    NSString *displayAnswer = [NSString stringWithFormat:@"\" %@ \"", [self translate:currentDisplayed]];
    answerLabel.text = displayAnswer;
    answerLabel.hidden = NO;
    
    //TODO: Play kana sound
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *) translate:(NSString *)key {
    if ([_hiriganaPairs objectForKey:key])
        return [_hiriganaPairs objectForKey:key];
    NSLog(@"Failed to find match for key: \"%@\", attempt to return: %@", key, [_hiriganaPairs objectForKey:key]);
    return @"err";
}

- (void) alert: (NSString*) message{
    UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@""
                                                     message:message
                                                    delegate:self
                                           cancelButtonTitle:@"close"
                                           otherButtonTitles: nil];
    [alert show];
}

- (void) populatehiriganaDictionary{
    _hirigana = @{
                  @"ぁ": @"a", @"い": @"i", @"う": @"u", @"え": @"e",
                  @"お": @"o", @"か": @"ka", @"き": @"ki", @"く": @"ku",
                  @"け": @"ke", @"こ": @"ko", @"さ": @"sa", @"し": @"shi",
                  @"す": @"su", @"せ": @"se", @"そ": @"so", @"た": @"ta",
                  @"ち": @"chi", @"つ": @"tsu", @"て": @"te", @"と": @"to",
                  @"な": @"na", @"に": @"ni", @"ぬ": @"nu", @"ね": @"ne",
                  @"の": @"no", @"は": @"ha", @"ひ": @"hi", @"ふ": @"hu",
                  @"へ": @"he", @"ほ": @"ho", @"ま": @"ma", @"み": @"mi",
                  @"む": @"mu", @"め": @"me", @"も": @"mo", @"や": @"ya",
                  @"ゆ": @"yu", @"よ": @"yo", @"ら": @"ra", @"り": @"ri",
                  @"る": @"ru", @"れ": @"re", @"ろ": @"ro", @"わ": @"wa",
                  @"を": @"wo", @"が": @"ga", @"ぎ": @"gi", @"ぐ": @"gu",
                  @"げ": @"ge", @"ご": @"go", @"ざ": @"za", @"じ": @"ji",
                  @"ず": @"zu", @"ぜ": @"ze", @"ぞ": @"zo", @"だ": @"da",
                  @"ぢ": @"di", @"づ": @"du", @"で": @"de", @"ど": @"do", 
                  @"ば": @"ba", @"び": @"bi", @"ぶ": @"bu", @"べ": @"be", 
                  @"ぼ": @"bo", @"ぱ": @"pa", @"ぴ": @"pi", @"ぷ": @"pu", 
                  @"ぺ": @"pe", @"ぽ": @"po", @"ん": @"n"
                  };
    
    _hiriganaPairs = @{
                       @"ぁ": @"a", @"い": @"i", @"う": @"u", @"え": @"e",
                       @"お": @"o", @"か": @"ka", @"き": @"ki", @"く": @"ku",
                       @"け": @"ke", @"こ": @"ko", @"さ": @"sa", @"し": @"shi",
                       @"す": @"su", @"せ": @"se", @"そ": @"so", @"た": @"ta",
                       @"ち": @"chi", @"つ": @"tsu", @"て": @"te", @"と": @"to",
                       @"な": @"na", @"に": @"ni", @"ぬ": @"nu", @"ね": @"ne",
                       @"の": @"no", @"は": @"ha", @"ひ": @"hi", @"ふ": @"hu",
                       @"へ": @"he", @"ほ": @"ho", @"ま": @"ma", @"み": @"mi",
                       @"む": @"mu", @"め": @"me", @"も": @"mo", @"や": @"ya",
                       @"ゆ": @"yu", @"よ": @"yo", @"ら": @"ra", @"り": @"ri",
                       @"る": @"ru", @"れ": @"re", @"ろ": @"ro", @"わ": @"wa",
                       @"を": @"wo", @"が": @"ga", @"ぎ": @"gi", @"ぐ": @"gu",
                       @"げ": @"ge", @"ご": @"go", @"ざ": @"za", @"じ": @"ji",
                       @"ず": @"zu", @"ぜ": @"ze", @"ぞ": @"zo", @"だ": @"da",
                       @"ぢ": @"di", @"づ": @"du", @"で": @"de", @"ど": @"do",
                       @"ば": @"ba", @"び": @"bi", @"ぶ": @"bu", @"べ": @"be",
                       @"ぼ": @"bo", @"ぱ": @"pa", @"ぴ": @"pi", @"ぷ": @"pu",
                       @"ぺ": @"pe", @"ぽ": @"po", @"ん": @"n",
                       @"きゃ": @"kya", @"きゅ": @"kyu", @"きょ": @"kyo",
                       @"ぎゃ": @"gya", @"ぎゅ": @"gyu", @"ぎょ": @"gyo", 
                       @"しゃ": @"shya", @"しゅ": @"shyu", @"しょ": @"shyo", 
                       @"じゃ": @"jya", @"じゅ": @"jyu", @"じょ": @"jyo", 
                       @"ちゃ": @"chya", @"ちゅ": @"chyu", @"ちょ": @"chyo", 
                       @"にゃ": @"nya", @"にゅ": @"nyu", @"にょ": @"nyo", 
                       @"ひゃ": @"hya", @"ひゅ": @"hyu", @"ひょ": @"hyo", 
                       @"びゃ": @"bya", @"びゅ": @"byu", @"びょ": @"byo", 
                       @"ぴゃ": @"pya", @"ぴゅ": @"pyu", @"ぴょ": @"pyo",
                       @"みゃ": @"mya", @"みゅ": @"myu", @"みょ": @"myo",
                       @"りゃ": @"rya", @"りゅ": @"ryu", @"りょ": @"ryo",
                       @"ぢゃ": @"dya(ja)", @"ぢゅ": @"dyu(ju)", @"ぢょ": @"dyo(jo)"
                       };
}

@end


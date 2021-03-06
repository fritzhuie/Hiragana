//
//  ViewController.m
//  hirigana drills
//
//  Created by Fritz huie on 11/9/14.
//  Copyright (c) 2014 Fritz Huie. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "kanaLibrary.h"
@import Foundation;

@interface ViewController () <AVAudioPlayerDelegate, AVSpeechSynthesizerDelegate>

@property(nonatomic, strong) NSMutableArray* remaining;
@property (nonatomic, strong) NSDictionary* hirigana;

@property (weak, nonatomic) IBOutlet UILabel *hiriganaLabel;
@property (weak, nonatomic) IBOutlet UIButton *unityChanRestartButton;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UIButton *next;
@property (weak, nonatomic) IBOutlet UIButton *answer;


@property (weak, nonatomic) IBOutlet UIButton *beginDrillButtonSmall;
@property (weak, nonatomic) IBOutlet UILabel *counter;

@property (weak, nonatomic) IBOutlet UIButton *wrongButton;
@property (weak, nonatomic) IBOutlet UIImageView *cardBackImage;

@property (strong, nonatomic) AVAudioPlayer* soundPlayer;
@property (strong, nonatomic) AVSpeechSynthesizer *synthesizer;
@property (weak, nonatomic) IBOutlet UIButton *soundToggle;
@property (weak, nonatomic) IBOutlet UIButton *revealAnswerButton;
@property (weak, nonatomic) IBOutlet UIButton *pairToggleButton;

@end

BOOL katakanaSelected;

@implementation ViewController{
    NSString *currentDisplayed;
    int errorCount;
    bool answerRevealed;
    bool willIncludePairs;
    AppDelegate* delegate;
    NSDictionary* kanaLibrary;
}

+ (bool)katakanaSelected { return katakanaSelected; }
+ (void)setKatakana:(bool)setKatakana { katakanaSelected = setKatakana; }

@synthesize next, answerLabel, unityChanRestartButton, wrongButton, answer, hiriganaLabel, beginDrillButtonSmall, cardBackImage, soundToggle, revealAnswerButton, pairToggleButton;
@synthesize counter;
@synthesize soundPlayer;

#define SOUND_TOGGLE_DIABLED YES


- (void)viewDidLoad {
    [super viewDidLoad];
    willIncludePairs = NO;
    delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    self.synthesizer = [[AVSpeechSynthesizer alloc] init];
    [soundToggle setImage:[UIImage imageNamed:(delegate.sound ? @"sound.png" : @"nosound.png")] forState:UIControlStateNormal];
    [pairToggleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [pairToggleButton setBackgroundImage:[UIImage imageNamed:@"buttonStrikethrough"] forState:UIControlStateNormal];
    [self startDrill];
}

- (void)showDrillInterface {
    unityChanRestartButton.hidden = YES;
    beginDrillButtonSmall.hidden = NO;
    hiriganaLabel.hidden = NO;
    answer.hidden = NO;
    next.hidden = NO;
    counter.hidden = NO;
    wrongButton.hidden = YES;
    cardBackImage.hidden = NO;
    soundToggle.hidden = SOUND_TOGGLE_DIABLED;
    revealAnswerButton.hidden = NO;
}


- (void)showCompletedInterface {
    answerLabel.hidden = YES;
    unityChanRestartButton.hidden = NO;
    hiriganaLabel.hidden = YES;
    answer.hidden = YES;
    next.hidden = YES;
    counter.hidden = YES;
    wrongButton.hidden = YES;
    cardBackImage.hidden = YES;
    soundToggle.hidden = YES;
    revealAnswerButton.hidden = YES;
    hiriganaLabel.hidden = NO;
    counter.hidden = YES;
    wrongButton.hidden = YES;
    cardBackImage.hidden = YES;
    soundToggle.hidden = YES;
    revealAnswerButton.hidden = YES;
}

- (IBAction)soundTogglePressed:(id)sender {
    delegate.sound = delegate.sound ? NO : YES;
    [soundToggle setImage:[UIImage imageNamed:(delegate.sound ? @"sound.png" : @"nosound.png")] forState:UIControlStateNormal];
}
- (IBAction)pairTogglePressed:(id)sender {
    willIncludePairs = willIncludePairs ? NO : YES;
    if (willIncludePairs) {
        [pairToggleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [pairToggleButton setBackgroundImage:[UIImage imageNamed:@"buttonNoStrikethrough"] forState:UIControlStateNormal];
    }else{
        [pairToggleButton setBackgroundImage:[UIImage imageNamed:@"buttonStrikethrough"] forState:UIControlStateNormal];
    }
    [self startDrill];
}

- (IBAction)correctPressed:(id)sender {
    [self showNewHirigana];
}

- (IBAction)Start:(id)sender {
    [self startDrill];
}

//startDrill
- (void)startDrill{
    if (katakanaSelected){
        kanaLibrary = (willIncludePairs ? KATAKANA_PAIR_DICT : KATAKANA_DICT);
        NSLog(@"katakana set");
    }else{
        kanaLibrary = (willIncludePairs ? HIRAGANA_PAIR_DICT : HIRAGANA_DICT);
        NSLog(@"hirigana set");
    }

    errorCount = 0;
    _remaining = [NSMutableArray arrayWithArray:kanaLibrary.allKeys];

    counter.text = [NSString stringWithFormat:@"%lu", (unsigned long)_remaining.count];
    [self showNewHirigana];
    [self showDrillInterface];
}

- (void)showNewHirigana
{
    revealAnswerButton.hidden = NO;
    answerLabel.hidden = YES;
    
    if (_remaining.count > 0) {
        int i = rand()%_remaining.count;
        currentDisplayed = _remaining[i];
        [_remaining removeObject:_remaining[i]];
        hiriganaLabel.text = currentDisplayed;
    }else{
        hiriganaLabel.text = @"√";
        counter.text = [NSString stringWithFormat: @"Repeats: %lu", (long)errorCount];
        [self showCompletedInterface];
    }
    
    if (_remaining.count) {
        counter.text = [NSString stringWithFormat:@"%lu", (unsigned long)_remaining.count];
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

- (IBAction)kanaTapped:(id)sender {
    [self revealAnswer];
    revealAnswerButton.hidden = YES;
    wrongButton.hidden = NO;
}

- (IBAction)revealAnswerButtonPressed:(id)sender
{
    [self revealAnswer];
    revealAnswerButton.hidden = YES;
    wrongButton.hidden = NO;
}

- (IBAction)help:(id)sender {

}

- (void)revealAnswer
{
    NSString *displayAnswer = [NSString stringWithFormat:@"\" %@ \"", [self translate:currentDisplayed]];
    answerLabel.text = displayAnswer;
    answerLabel.hidden = NO;
    if (delegate.sound) {
        NSString* soundPath = [NSString stringWithFormat:@"kana/%@", kanaLibrary[currentDisplayed]];
        if(soundPath)
            NSLog(soundPath);
        else
            NSLog(@"Soundpath not defined");
        NSString* audioFilePath = [[NSBundle mainBundle] pathForResource:soundPath ofType:@"mp3"];
        if ([[NSFileManager defaultManager] fileExistsAtPath:audioFilePath]) {
            NSLog(@"path exists");
            NSURL *pathAsURL = [[NSURL alloc]initFileURLWithPath:audioFilePath];

            // Init audio player
            NSError *error;
            soundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:pathAsURL error:&error];

            // Check out what's wrong in case that the player doesn't init.
            if (error) {
                NSLog(@"%@", [error localizedDescription]);
            }
            else{
                //pre-load the audio into the buffer
                [soundPlayer prepareToPlay];
                [soundPlayer play];
            }
        }
    }else{
        NSLog(@"Sound is off");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSString *) translate:(NSString *)key {
    if ([kanaLibrary objectForKey:key])
        return [kanaLibrary objectForKey:key];
    else
        return @"error";
}

- (void) alert: (NSString*) message{
    UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@""
                                                     message:message
                                                    delegate:self
                                           cancelButtonTitle:@"close"
                                           otherButtonTitles: nil];
    [alert show];
}

@end


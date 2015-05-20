//
//  ViewController.m
//  hirigana drills
//
//  Created by Fritz huie on 11/9/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "hiriganaLibrary.h"
@import Foundation;

@interface ViewController () <AVAudioPlayerDelegate, AVSpeechSynthesizerDelegate>

@property(nonatomic, strong) NSMutableArray* remaining;
@property (nonatomic, strong) NSDictionary* hirigana;

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

@property (strong, nonatomic) AVAudioPlayer* soundPlayer;
@property (strong, nonatomic) AVSpeechSynthesizer *synthesizer;
@property (weak, nonatomic) IBOutlet UIButton *soundToggle;
@property (weak, nonatomic) IBOutlet UIButton *revealAnswerButton;

@end


@implementation ViewController{
    NSString *currentDisplayed;
    int errorCount;
    bool answerRevealed;
    AppDelegate* delegate;
}

@synthesize next, wrongButton, answer, hiriganaLabel, answerLabel, beginDrillButtonSmall, beginDrillButton, allDoneLabel, cardBackImage, soundToggle, revealAnswerButton;
@synthesize counter;
@synthesize soundPlayer;


- (void)viewDidLoad {
    [super viewDidLoad];
    [self showDefaultInterface];
    delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    self.synthesizer = [[AVSpeechSynthesizer alloc] init];
    [soundToggle setImage:[UIImage imageNamed:(delegate.sound ? @"sound.png" : @"nosound.png")] forState:UIControlStateNormal];
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
    cardBackImage.hidden = YES;
    soundToggle.hidden = YES;
    revealAnswerButton.hidden = YES;
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
    cardBackImage.hidden = NO;
    soundToggle.hidden = NO;
    revealAnswerButton.hidden = YES;
}

- (void)showCompletedInterface {
    [self showDefaultInterface];
    hiriganaLabel.hidden = NO;
    counter.hidden = NO;
    allDoneLabel.hidden = YES;
    wrongButton.hidden = YES;
    cardBackImage.hidden = YES;
    soundToggle.hidden = YES;
    revealAnswerButton.hidden = YES;
}

- (IBAction)soundTogglePressed:(id)sender {
    delegate.sound = delegate.sound ? NO : YES;
    [soundToggle setImage:[UIImage imageNamed:(delegate.sound ? @"sound.png" : @"nosound.png")] forState:UIControlStateNormal];
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
        _remaining = [NSMutableArray arrayWithArray:HIRAGANA_PAIR_DICT.allKeys];
        [self sizeForPairs:TRUE];
    }else{
        _remaining = [NSMutableArray arrayWithArray:HIRAGANA_DICT.allKeys];
        [self sizeForPairs:TRUE];
    }
    
    counter.text = [NSString stringWithFormat:@"%lu", (unsigned long)_remaining.count];
    [self showNewHirigana];
}

- (void)sizeForPairs:(BOOL)pairs {

}

- (void)showNewHirigana
{
    answerLabel.hidden = YES;
    revealAnswerButton.hidden = NO;
    
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

- (IBAction)revealAnswerButtonPressed:(id)sender
{
    [self revealAnswer];
    revealAnswerButton.hidden = YES;
}

- (IBAction)help:(id)sender {

}
- (void)revealAnswer
{
    NSString *displayAnswer = [NSString stringWithFormat:@"\" %@ \"", [self translate:currentDisplayed]];
    answerLabel.text = displayAnswer;
    answerLabel.hidden = NO;

    //TODO: Play kana sound
    if (delegate.sound) {
        NSString* soundPath = [NSString stringWithFormat:@"kana/%@", HIRAGANA_PAIR_DICT[currentDisplayed]];
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
                // may avoid, as it's not always possible to pre-load the audio.
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
    // Dispose of any resources that can be recreated.
}

- (NSString *) translate:(NSString *)key {
    if ([HIRAGANA_PAIR_DICT objectForKey:key])
        return [HIRAGANA_PAIR_DICT objectForKey:key];
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


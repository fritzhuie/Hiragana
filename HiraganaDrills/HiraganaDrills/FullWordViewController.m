//
//  FullWordViewController.m
//  HiraganaDrills
//
//  Created by Fritz Huie on 5/26/15.
//  Copyright (c) 2015 FritzHuie. All rights reserved.
//

#import "FullWordViewController.h"
#import "kanaLibrary.h"

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
    // Do any additional setup after loading the view.
    kanaLibrary = HIRAGANA_DICT;
    wordList = [HIRAGANA_WORD_DICT allKeys];
    answerBox.hidden = YES;
}

- (IBAction)newWordButtonPressed:(id)sender {
    currentWord = wordList[0];
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
        CGFloat wordLength = ([currentWord length]/2)+1;
        CGFloat boxWidth =  320.0 / wordLength;
        NSString* selectedKana;
        int i = 0;
        while(i < wordLength){
            if (location.x < ((i+1)*boxWidth)){
                selectedKana = a[i];
                break;
            }i++;}
        NSLog([self translate:selectedKana]);
        CGRect tapBoxRect = CGRectMake(50, 50, 50, 50);
        [self playAnswerAnimationForWord:[self translate:selectedKana] WithBounds:tapBoxRect];
    }

    /*
    //create opaque view over character with romanji, that animates fadeout
     */
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

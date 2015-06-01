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

@end

@implementation FullWordViewController {
    NSArray* wordList;
    NSString* currentWord;
    NSArray* views;
}

@synthesize wordView,tapGestureRecogniser, kanaWordLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    wordList = [HIRAGANA_WORD_DICT allKeys];
}

- (IBAction)newWordButtonPressed:(id)sender {
    currentWord = wordList[0];
    kanaWordLabel.text = [currentWord stringByReplacingOccurrencesOfString:@"/" withString:@""];
}

- (void)showAnswerForKanaAt:(CGPoint)location{
    CGFloat wordLength = ([currentWord length]/2)+1;
    NSLog(@"%fl", wordLength);
    CGFloat boxWidth =  320.0 / wordLength;
    //(WORD_VIEW_WIDTH, WORD_VIEW_HEIGHT); CGPointMake(0.0, WORD_VIEW_Y);
    NSString* selectedKana;
    int i = 0;
    while(i < wordLength){
        if (location.x < ((i+1)*boxWidth)){
            NSArray* a = [currentWord componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"/"]];
            selectedKana = a[i];
            break;
        }i++;}
    CGRect tapBoxRect = CGRectMake(WORD_VIEW_WIDTH/wordLength*i, WORD_VIEW_Y, WORD_VIEW_WIDTH/wordLength, WORD_VIEW_HEIGHT);
    UIView* answerView = [[UIView alloc]initWithFrame:tapBoxRect];
    answerView.backgroundColor = [UIColor whiteColor];
    answerView.opaque = YES;
    //create opaque view over character with romanji, that animates fadeout
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

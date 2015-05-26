//
//  FullWordViewController.m
//  HiraganaDrills
//
//  Created by Fritz Huie on 5/26/15.
//  Copyright (c) 2015 FritzHuie. All rights reserved.
//

#import "FullWordViewController.h"
#import "kanaLibrary.h"

@interface FullWordViewController ()
@property (weak, nonatomic) IBOutlet UILabel *kanaWordLabel;
@property (weak, nonatomic) IBOutlet UIView *wordView;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGestureRecogniser;

@end

@implementation FullWordViewController {
    NSArray* wordList;
    NSString* currentWord;
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

- (NSString *)returnCharacterInTapBoundary:(CGPoint)location{
    int wordLength = (int)(([currentWord length]/2)+1);
    NSLog(@"%i", wordLength);
    float boxWidth =  320.0 / wordLength;

    int i = 0;
    while(i < wordLength){
        if (location.x < ((i+1)*boxWidth)){
            NSArray* a = [currentWord componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"/"]];
            //NSLog(@"Numer in array: %i | #%i | %@", wordLength, i, a[i]);
            return a[i];
        }
        i++;
    }
    return nil;
}

- (IBAction)tapDetected:(id)sender {
    NSLog(@"X:%f Y:%f", [tapGestureRecogniser locationInView:wordView].x, [tapGestureRecogniser locationInView:wordView].y);
    NSString* a = [self returnCharacterInTapBoundary:[tapGestureRecogniser locationInView:wordView]];
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

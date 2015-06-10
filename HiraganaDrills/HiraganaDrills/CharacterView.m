//
//  CharacterView.m
//  HiraganaDrills
//
//  Created by Fritz Huie on 6/4/15.
//  Copyright (c) 2015 FritzHuie. All rights reserved.
//

#import "CharacterView.h"

@interface CharacterView ()

@property BOOL isDisplayingKanji;
@property BOOL isDisplayingRomanji;

@end

@implementation CharacterView

- (void) displayKana:(NSString*)character withDimensions:(CGRect)dimensions{
    
}

- (BOOL) isDisplayingText{
    return YES;
}

- (void) translateToRomanji{

}

- (void) clearView{

}

- (void)printIfexists{
    NSLog(@"CharacterView created");
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

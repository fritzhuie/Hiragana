//
//  CharacterView.h
//  HiraganaDrills
//
//  Created by Fritz Huie on 6/4/15.
//  Copyright (c) 2015 FritzHuie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CharacterView : UIView

- (BOOL) isDisplayingText;
- (void) translateToRomanji;
- (void) clearView;
- (void) displayKana:(NSString*)character withDimensions:(CGRect)dimensions;
- (void) printIfexists;

@end

 //
//  SlideBarView.h
//  SlideBar
//
//  Created by PANDA on 15/7/27.
//  Copyright (c) 2015年 PANDA. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SliderDelegate;

@interface SlideBarView : UIView



- (instancetype)initWithColor:(UIColor *)color withTag:(NSInteger)tag;

@property (nonatomic, weak) id<SliderDelegate>delegate;

@end

@protocol SliderDelegate <NSObject>

-(void)didSelectColor:(float)colorNumber didSelectColorTag:(NSInteger)colorTag;

@end
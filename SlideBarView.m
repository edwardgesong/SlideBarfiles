//
//  SlideBarView.m
//  SlideBar
//
//  Created by PANDA on 15/7/27.
//  Copyright (c) 2015年 PANDA. All rights reserved.
//

#import "SlideBarView.h"
#import "UIColor+FlatUI.h"
#define CGRectSetPos( r, x, y ) CGRectMake( x, y, r.size.width, r.size.height )



@interface SlideBarView ()


@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) UIView *slideBlock;

@end
@implementation SlideBarView


- (instancetype)initWithColor:(UIColor *)color withTag:(NSInteger)tag
{
    self = [super init];
    if (self)
    {
        self.tag = tag;
        _color = color;
    }
    return self;
}

- (void)layoutSubviews
{
    self.backgroundColor = self.color;

    if (!self.slideBlock)
    {
        [self addBlock];
    }
}




-(void)addBlock
{
    CGRect frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, 10, self.frame.size.height);
    self.slideBlock = [[UIView alloc] initWithFrame:frame];
    self.slideBlock.backgroundColor = [UIColor silverColor];
    [self addSubview:self.slideBlock];
    self.slideBlock.frame = CGRectSetPos( self.slideBlock.frame, (self.frame.size.width-self.slideBlock.frame.size.width)/2, 0.0f);
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    
    CGPoint location = [touch locationInView:self];
    if (location.x >= self.frame.size.width-self.slideBlock.frame.size.width/2) {
        location.x = self.frame.size.width-self.slideBlock.frame.size.width/2;
    }
    if (location.x <= self.slideBlock.frame.size.width/2 ) {
        location.x = self.slideBlock.frame.size.width/2;
    }
    self.slideBlock.frame = CGRectSetPos( self.slideBlock.frame, location.x-self.slideBlock.frame.size.width/2, 0.0f);
    
    //NSLog(@"Touch x: %f y: %f <-Start here",location.x, location.y);
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    if (location.x >= self.frame.size.width-self.slideBlock.frame.size.width/2) {
        location.x = self.frame.size.width-self.slideBlock.frame.size.width/2;
    }
    if (location.x <= self.slideBlock.frame.size.width/2 ) {
        location.x = self.slideBlock.frame.size.width/2;
    }
    if (self.tag == 1) {
        [self setBackgroundColor: [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:(location.x-self.slideBlock.frame.size.width/2)/(self.frame.size.width-self.slideBlock.frame.size.width)]];
//        colorValueRed =(location.x-self.slideBlock.frame.size.width/2)/(self.frame.size.width-self.slideBlock.frame.size.width);
    }
    else if(self.tag == 2){
        [self setBackgroundColor: [UIColor colorWithRed:0.0f green:0.0f blue:1.0f alpha:(location.x-self.slideBlock.frame.size.width/2)/(self.frame.size.width-self.slideBlock.frame.size.width)]];
    }
    else if(self.tag == 3){
        [self setBackgroundColor: [UIColor colorWithRed:0.0f green:1.0f blue:0.0f alpha:(location.x-self.slideBlock.frame.size.width/2)/(self.frame.size.width-self.slideBlock.frame.size.width)]];
    }
    if ([self.delegate respondsToSelector:@selector(didSelectColor: didSelectColorTag:)])
    {
        //NSLog(@"!!!!!!!!!!!!!!!!!!!!!!!!!!%.5f",location.x-self.slideBlock.frame.size.width/2);
        float value = (location.x-self.slideBlock.frame.size.width/2)/(self.frame.size.width-self.slideBlock.frame.size.width);
        [self.delegate didSelectColor:value didSelectColorTag:self.tag];
    }
    self.slideBlock.frame = CGRectSetPos( self.slideBlock.frame, location.x-(self.slideBlock.frame.size.width/2), 0.0f);
    
    
    
    
    
    //NSLog(@"Touch x: %f y: %f <-Move to here: ",location.x, location.y);
//*********************************************delegate**************************************************

}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    //[self setBackgroundColor: [UIColor colorWithRed:255/255.0F green:50/255.0F blue:60/255.0F alpha:1.0F]];
    //NSLog(@"<-End here: ");
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];

    if ([self.delegate respondsToSelector:@selector(didSelectColor: didSelectColorTag:)])
    {
        //NSLog(@"!!!!!!!!!!!!!!!!!!!!!!!!!!%.5f",location.x-self.slideBlock.frame.size.width/2);
        float value = (location.x-self.slideBlock.frame.size.width/2)/(self.frame.size.width-self.slideBlock.frame.size.width);
        [self.delegate didSelectColor:value didSelectColorTag:self.tag];
    }
}


@end

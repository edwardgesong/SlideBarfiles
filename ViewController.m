//
//  ViewController.m
//  SlideBar
//
//  Created by PANDA on 15/7/27.
//  Copyright (c) 2015年 PANDA. All rights reserved.
//

#import "ViewController.h"
#import "SlideBarView.h"

@interface ViewController () <SliderDelegate>
@property (weak, nonatomic) IBOutlet UILabel *colorLabelValueRed;
@property (weak, nonatomic) IBOutlet UILabel *colorLabelValueBlue;
@property (weak, nonatomic) IBOutlet UILabel *colorLabelValueGreen;

@end

@implementation ViewController


float redValueFinal = 127.5;
float blueValueFinal = 127.5;
float greenVluaeFinal = 127.5;
float cornerRadius = 6;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SlideBarView *slideBarRed = [[SlideBarView alloc] initWithColor:[UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:0.5f] withTag:1];
    SlideBarView *slideBarBlue = [[SlideBarView alloc] initWithColor:[UIColor colorWithRed:0.0f green:0.0f blue:1.0f alpha:0.5f] withTag:2];
    SlideBarView *slideBarGreen = [[SlideBarView alloc] initWithColor:[UIColor colorWithRed:0.0f green:1.0f blue:0.0f alpha:0.5f] withTag:3];
    
    slideBarRed.frame = CGRectMake(40, 350, 300, 15);
    slideBarBlue.frame = CGRectMake(40, 450, 300, 15);
    slideBarGreen.frame = CGRectMake(40, 550, 300, 15);
    
    slideBarRed.delegate = self;
    slideBarBlue.delegate = self;
    slideBarGreen.delegate = self;
    
    slideBarRed.layer.cornerRadius = cornerRadius;
    slideBarRed.layer.masksToBounds = YES;
    
    slideBarBlue.layer.cornerRadius = cornerRadius;
    slideBarBlue.layer.masksToBounds = YES;

    slideBarGreen.layer.cornerRadius = cornerRadius;
    slideBarGreen.layer.masksToBounds = YES;

    [self.view addSubview:slideBarRed];
    [self.view addSubview:slideBarBlue];
    [self.view addSubview:slideBarGreen];
    
    
}

#pragma mark - SliderBarView Delegate functions

- (void) didSelectColor:(float)colorNumber didSelectColorTag:(NSInteger)colorTag
{
    float displayNum = colorNumber*255;
    if (colorTag == 1){
        self.colorLabelValueRed.text = [NSString stringWithFormat:@"%.1f",displayNum];
        redValueFinal = displayNum;
    }
    else if (colorTag ==2){
        self.colorLabelValueBlue.text = [NSString stringWithFormat:@"%.1f",displayNum];
        blueValueFinal = displayNum;
    }
    else if(colorTag == 3){
        self.colorLabelValueGreen.text = [NSString stringWithFormat:@"%.1f",displayNum];
        greenVluaeFinal = displayNum;
        
    }
    //NSLog(@"Red: %.1f, Blue: %.1f, Green: %.1f",redValueFinal, blueValueFinal ,  greenVluaeFinal);
}


@end

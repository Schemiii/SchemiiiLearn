//
//  ViewController.m
//  AnimateFruits
//
//  Created by Daniel Schmidt on 08.11.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import "ViewController.h"

#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  [self setup];
}
- (void) setup{
  //Load Fruits and Pictures
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated. 
}

- (void)btnAnimate:(id)sender{
  [UIView animateWithDuration:1 animations:^
  {
    _cherry.frame=CGRectInset(_cherry.frame, _cherry.frame.size.width*0.25,_cherry.frame.size.height*0.25);
    _apple.alpha=0.0;
    _orange.frame=CGRectApplyAffineTransform(_orange.frame, CGAffineTransformTranslate(CGAffineTransformIdentity, -50, 0));
    _melon.transform = CGAffineTransformRotate(_melon.transform, DEGREES_TO_RADIANS(180));
    
  }completion:^(BOOL finished){
    if(finished){
      [_apple removeFromSuperview];
      [_orange removeFromSuperview];
    }
  }];
}

@end

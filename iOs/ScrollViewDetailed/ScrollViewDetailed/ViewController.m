//
//  ViewController.m
//  ScrollViewDetailed
//
//  Created by Daniel Schmidt on 27.12.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize imgUks;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
  UITouch *touch = [touches anyObject];
  if(touch.tapCount==1){
    CGPoint locofsingletouch = [touch locationInView:self.view];
    self.imgUks.center = locofsingletouch;
  }
}

- (IBAction)PanGestureRecognizer:(UIPanGestureRecognizer *)gesture{
  if(gesture.state == UIGestureRecognizerStateBegan || gesture.state == UIGestureRecognizerStateChanged || gesture.state == UIGestureRecognizerStateEnded){
    CGPoint locofpan = [gesture locationInView:self.view];
    self.imgUks.center=locofpan;
  }
}

@end

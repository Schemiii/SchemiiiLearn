//
//  ViewController.m
//  Triangle
//
//  Created by Daniel Schmidt on 08.11.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import "ViewController.h"

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
  //Setup the width and height
  self.triangleView.triangleGroundLength=300.;
  self.triangleView.triangleHeight=300.;
}

- (NSUInteger)supportedInterfaceOrientations{
  return UIInterfaceOrientationMaskAll;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

//
//  ViewController.m
//  Datumsrechner
//
//  Created by Daniel Schmidt on 02.11.12.
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)btnCalcDateDifference:(id)sender{
  //Test
  NSDate *now = [NSDate date];
  NSLog(@"%@",now);
  
}
-(void)btnPickDate:(id)sender{
  
}

@end

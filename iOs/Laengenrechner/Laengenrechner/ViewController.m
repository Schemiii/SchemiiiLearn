//
//  ViewController.m
//  Laengenrechner
//
//  Created by Daniel Schmidt on 25.10.12.
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
  _calc = [[LengthCalculator alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)Convert:(id)sender{
  NSLog(@"Calling Convert with input %@ \n",self.txtInput.text);
  [_calc setInput:self.txtInput.text];
  _lblMeters.text = [_calc getMeter];
  _lblZentimeters.text = [_calc getCentimeter];
  _lblFuss.text = [_calc getFoot];
  _lblZoll.text = [_calc getInch];
  
}

- (IBAction)btnAnimate:(id)sender {
}
@end

//
//  ViewController.m
//  Hallo Welt
//
//  Created by Daniel Schmidt on 25.10.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)btnCopy:(id)sender{
  [self.lblText setText:[self.txtText text]];
  NSLog(@"Copy Text : \"%@\" to Label",[self.txtText text]);
}

- (IBAction)btnConvert:(id)sender {
}

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

@end

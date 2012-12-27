//
//  ViewController.m
//  CLBSimulatorApp
//
//  Created by Daniel Schmidt on 27.12.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import "ViewController.h"
#import "CLBSimlib.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  self.textfield.text=[CLBSimlib SayHello];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

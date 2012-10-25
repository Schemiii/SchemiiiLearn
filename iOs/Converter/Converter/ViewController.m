//
//  ViewController.m
//  Converter
//
//  Created by Daniel Schmidt on 25.10.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import "ViewController.h"
#import "HexConverter.h"
#import "BinConverter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)btnConvertBin:(id)sender{
   self.lblOutput.text = [[[BinConverter alloc] initWithInt:[self.txtInput.text intValue]] convert];
}
- (void)btnConvertHex:(id)sender{
  self.lblOutput.text = [[[HexConverter alloc] initWithInt:[self.txtInput.text intValue]] convert];
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

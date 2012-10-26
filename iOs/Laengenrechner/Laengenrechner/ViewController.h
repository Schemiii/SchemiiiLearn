//
//  ViewController.h
//  Laengenrechner
//
//  Created by Daniel Schmidt on 25.10.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LengthCalculator.h"
@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtInput;
@property (weak, nonatomic) IBOutlet UILabel *lblMeters;
@property (weak, nonatomic) IBOutlet UILabel *lblZentimeters;
@property (weak, nonatomic) IBOutlet UILabel *lblZoll;
@property (weak, nonatomic) IBOutlet UILabel *lblFuss;
@property (readonly) LengthCalculator *calc;
- (IBAction) Convert : (id) sender;

@end

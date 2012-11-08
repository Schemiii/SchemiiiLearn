//
//  ViewController.h
//  Converter
//
//  Created by Daniel Schmidt on 25.10.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)btnAnimate:(id)sender;
- (IBAction)btnConvertBin:(id)sender;
- (IBAction)btnConvertHex:(id)sender;
- (IBAction)btnAnimate:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblOutput;
@property (weak, nonatomic) IBOutlet UITextField *txtInput;

- (IBAction)Convert:(id)sender;
@end

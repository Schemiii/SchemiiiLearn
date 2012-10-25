//
//  ViewController.h
//  Converter
//
//  Created by Daniel Schmidt on 25.10.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)btnConvertBin:(id)sender;
- (IBAction)btnConvertHex:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblOutput;
@property (weak, nonatomic) IBOutlet UITextField *txtInput;

@end

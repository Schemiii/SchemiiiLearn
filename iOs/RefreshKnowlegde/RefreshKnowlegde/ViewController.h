//
//  ViewController.h
//  RefreshKnowlegde
//
//  Created by Daniel Schmidt on 25.10.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)btnConvert:(id)sender;
- (IBAction)asd:(id)sender;
- (IBAction)btnConvert:(id)sender;
- (IBAction)btnConvertBin:(id)sender;
- (IBAction)btnCalcDateDifference:(id)sender;
- (IBAction)btnConvertToBin:(id)sender;
- (IBAction)CopyText:(id)sender;
- (IBAction)btnCalcDateDifference:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtText;
@property (weak, nonatomic) IBOutlet UILabel *lblText;

@end

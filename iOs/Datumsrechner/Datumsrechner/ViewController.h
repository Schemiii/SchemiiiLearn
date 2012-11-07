//
//  ViewController.h
//  Datumsrechner
//
//  Created by Daniel Schmidt on 02.11.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
@interface ViewController : UIViewController <UITextFieldDelegate>{
  @private
  Model* model;
}

@property (weak, nonatomic) IBOutlet UITextField *txtStartDate;
@property (weak, nonatomic) IBOutlet UITextField *txtEndDate;

-(IBAction)btnCalcDateDifference :(id)sender;

-(IBAction)btnPickDate:(id)sender;

@end

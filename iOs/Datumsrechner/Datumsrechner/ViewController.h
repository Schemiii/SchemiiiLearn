//
//  ViewController.h
//  Datumsrechner
//
//  Created by Daniel Schmidt on 02.11.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatePickerViewController.h"
#import "Model.h"
@interface ViewController : UIViewController <UITextFieldDelegate,UINavigationControllerDelegate,DatePickerDelegate>{
  @private
  Model* model;
  BOOL IsDatePickerStartDateActive;
  BOOL IsDatePickerEndDateActive;
}

@property (weak, nonatomic) IBOutlet UITextField *txtStartDate;
@property (weak, nonatomic) IBOutlet UITextField *txtEndDate;
@property (weak, nonatomic) IBOutlet UILabel *lblDifference;

-(IBAction)btnCalcDateDifference :(id)sender;
- (IBAction)btnTest:(id)sender;

@end

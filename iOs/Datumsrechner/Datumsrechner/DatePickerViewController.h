//
//  DatePickerViewController.h
//  Datumsrechner
//
//  Created by Daniel Schmidt on 07.11.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import <UIKit/UIKit.h>


@class DatePickerViewController;

@protocol DatePickerDelegate <NSObject>

- (BOOL) datePicker : (DatePickerViewController*) picker willPickDate : (NSDate*) theDate;
- (void) datePicker :(DatePickerViewController*) picker didPickDate : (NSDate*) theDate;

@end

@interface DatePickerViewController : UIViewController
@property id<DatePickerDelegate> dateDelegate;
- (IBAction)btnDidFinishDateSelection:(id)sender;
@property (weak, nonatomic) IBOutlet UIDatePicker *pkrDate;

//Probably should be read only
@property(readwrite,nonatomic,strong) NSDate* minDate;
@property(readwrite,nonatomic,strong) NSDate* maxDate;


@end


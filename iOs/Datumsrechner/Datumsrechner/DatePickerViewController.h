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

@interface DatePickerViewController : UIViewController<UINavigationBarDelegate>

@property (readwrite,nonatomic,strong) NSString* text;
@property id<DatePickerDelegate> dateDelegate;

@property (weak, nonatomic) IBOutlet UIDatePicker *pkrDate;
@property (weak, nonatomic) IBOutlet UILabel *lblInfo;

- (IBAction)btnDidFinishDateSelection:(id)sender;

- (void) alertUserWithMessage : (NSString*) theMessage;

- (void) setDatePickerToDate : (NSDate*) theDate;

- (IBAction)btnFoo:(id)sender;

@end


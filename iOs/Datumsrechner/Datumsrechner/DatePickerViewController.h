//
//  DatePickerViewController.h
//  Datumsrechner
//
//  Created by Daniel Schmidt on 07.11.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DatePickerViewController : UIViewController

@end

@protocol DatePickerDelegate <NSObject>

- (NSDate*) DatePicker : ReturnDate;

@end
//
//  ViewController.h
//  Datumsrechner
//
//  Created by Daniel Schmidt on 02.11.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
  
}

@property (weak, nonatomic) IBOutlet UITextView *txtStartDate;
@property (weak, nonatomic) IBOutlet UITextView *txtEndDate;

-(IBAction)btnCalcDateDifference :(id)sender;

-(IBAction)btnPickDate:(id)sender;


@end

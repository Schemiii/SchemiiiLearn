//
//  DatePickerViewController.m
//  Datumsrechner
//
//  Created by Daniel Schmidt on 07.11.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@end

@implementation DatePickerViewController

@synthesize minDate,maxDate;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
      NSLog(@"I was initialized");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnDidFinishDateSelection:(id)sender {
  if([self.dateDelegate datePicker:self willPickDate:self.pkrDate.date]){
    [self.dateDelegate datePicker:self didPickDate:self.pkrDate.date];
  }else{
    [self shakeView:self.view];
  }
}

- (void)shakeView:(UIView *)viewToShake
{
  CGFloat t = 2.0;
  CGAffineTransform translateRight  = CGAffineTransformTranslate(CGAffineTransformIdentity, t, 0.0);
  CGAffineTransform translateLeft = CGAffineTransformTranslate(CGAffineTransformIdentity, -t, 0.0);
  viewToShake.transform = translateLeft;
  [UIView animateWithDuration:0.07 delay:0.0 options:UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
    [UIView setAnimationRepeatCount:2.0];
    viewToShake.transform = translateRight;
  } completion:^(BOOL finished) {
    if (finished) {
      [UIView animateWithDuration:0.05 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        viewToShake.transform = CGAffineTransformIdentity;
      } completion:NULL];
    }
  }];
}

@end

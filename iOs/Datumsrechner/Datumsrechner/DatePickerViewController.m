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



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
#ifdef CAVEMAN
      NSLog(@"I was initialized");
#endif
    }
    return self;
}

- (void) setup{
  //Setup the View
  self.lblInfo.text=self.text;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self setup];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnDidFinishDateSelection:(id)sender {
  if([self.dateDelegate datePicker:self willPickDate:self.pkrDate.date]){
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
      [self.dateDelegate datePicker:self didPickDate:self.pkrDate.date];
    }];
  }else{
    [self shakeView:self.view];
  }
}

- (void) setDatePickerToDate : (NSDate*) theDate{
  self.pkrDate.date=theDate;
}


- (void)alertUserWithMessage:(NSString *)theMessage{
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Wrong Input" message:theMessage delegate:self cancelButtonTitle:@"Sorry, my Bad" otherButtonTitles:nil, nil];
  [alert show];
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

- (void)navigationBar:(UINavigationBar *)navigationBar didPopItem:(UINavigationItem *)item{
  NSLog(@"NavigationBarItem %@ was popped from the stack",item.description);
}
- (void)navigationBar:(UINavigationBar *)navigationBar didPushItem:(UINavigationItem *)item{
  NSLog(@"NavigationBarItem %@ was pushed onto the stack",item.description);
}
- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item{
  NSLog(@"NavigationBarItem %@ should be popped",item);
  return YES;
}
- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPushItem:(UINavigationItem *)item{
  NSLog(@"NavigationBarItem %@ should be pushed",item);
  return YES;
}

@end

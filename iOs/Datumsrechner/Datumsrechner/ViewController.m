//
//  ViewController.m
//  Datumsrechner
//
//  Created by Daniel Schmidt on 02.11.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import "ViewController.h"
#import "Date.h"
@interface Model (initWithNSDate)
-(id) initWithNSDate :
        (NSDate*) startDate :
        (NSDate*) endDate;
@end

@implementation Model(initWithNSDate)

-(id) initWithNSDate : (NSDate*) startDate :(NSDate*) endDate{
  self = [super init];
  if(self){
    Date *nstartDate = [[Date alloc] init];
    Date *nendDate = [[Date alloc]init];
    NSString *nstarts,*nends;
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"dd.mm.yyyy"];
    nstarts=[format stringFromDate:startDate];
    nends=[format stringFromDate:endDate];
    if([nstartDate dateFromNSString:nstarts] && [nendDate dateFromNSString:nends]){
      self=[self initWithDate:nstartDate endDate:nendDate];
    }
  }
  return self;
}

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    if(model==nil)
      model=[[Model alloc] initWithNSDate:[NSDate date] :[NSDate date]];
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)btnCalcDateDifference:(id)sender{
  //Test
  NSDate *now = [NSDate date];
  NSLog(@"%@",now);
  
  
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
  [textField resignFirstResponder];
  return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
  
  if(textField == self.txtEndDate){
    
  }else if(textField==self.txtStartDate){
    
  }
}
- (void) datePicker :(DatePickerViewController*) picker didPickDate : (NSDate*) theDate{
  NSLog(@"DatePicker returned %@",theDate);
}

- (BOOL) datePicker:(DatePickerViewController *)picker willPickDate:(NSDate *)theDate{
  if(self->IsDatePickerStartDateActive){
    return YES;
  }
  if(self->IsDatePickerEndDateActive){
    if([self->model.startDate.date timeIntervalSinceDate:theDate]>0)
      return YES;
  }
  return NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
  DatePickerViewController *datepicker;
  UINavigationController *navi;
  if([segue.identifier isEqualToString:@"StartDate"]){
    navi = [segue destinationViewController];
    datepicker=(DatePickerViewController*) [navi presentedViewController];
    datepicker.dateDelegate=self;
    datepicker.minDate=self->model.startDate.date;
    datepicker.maxDate=self->model.endDate.date;
    self->IsDatePickerStartDateActive=YES;
    self->IsDatePickerEndDateActive=NO;
  }else if([segue.identifier isEqualToString:@"EndDate"]){
    navi = [segue destinationViewController];
    datepicker=(DatePickerViewController*) [navi presentedViewController];
    datepicker.dateDelegate=self;
    datepicker.minDate=self->model.startDate.date;
    datepicker.maxDate=self->model.endDate.date;
    self->IsDatePickerEndDateActive=YES;
    self->IsDatePickerStartDateActive=NO;
  }
}
@end

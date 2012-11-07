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
    [format setDateFormat:@"dd.MM.yyyy"];
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
#ifdef CAVEMAN
  NSLog(@"ViewController : viewDidLoad called");
#endif
  [self setup];
}

- (void) setup{
#ifdef CAVEMAN
  NSLog(@"Setup called");
#endif
  if(model==nil){
    model=[[Model alloc] initWithNSDate:[NSDate date] :[NSDate date]];
#ifdef CAVEMAN
    NSLog(@"%@",model.description);
#endif
  }
  if(model!=nil){
    //Update Screen from Model
    self.txtStartDate.text=self->model.startDate.description;
    self.txtEndDate.text=self->model.endDate.description;
  }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)btnCalcDateDifference:(id)sender{
#ifdef CAVEMAN
#endif
  self.lblDifference.text=[[NSNumber numberWithInt:self->model.dayDifference]stringValue];
}

//I dont like the approach to edit the text field, so i won't implement this stuff
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
  //Convert theDate to absolute Date without time Components
  
  //Update the Model
  if(IsDatePickerStartDateActive)
    self->model.startDate.date=theDate;
  if(IsDatePickerEndDateActive)
    self->model.endDate.date=theDate;
  //Update the Screen, could do this with kv observing aswell
  self.txtStartDate.text=self->model.startDate.description;
  self.txtEndDate.text=self->model.endDate.description;
}

- (BOOL) datePicker:(DatePickerViewController *)picker willPickDate:(NSDate *)theDate{
  NSString *theMsg;
  if(self->IsDatePickerStartDateActive){
    if([self->model.endDate.date timeIntervalSinceDate:theDate]>0)
      return YES;
    theMsg=@"Please pick a date earlier than the end date!";
  }
  if(self->IsDatePickerEndDateActive){
    if([self->model.startDate.date timeIntervalSinceDate:theDate]<0)
      return YES;
    theMsg=@"Please pick a date later then the start date!";
  }
  [picker alertUserWithMessage:theMsg];
  return NO;
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
  //Nothin to do here
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
  if(viewController){
    if([viewController respondsToSelector:@selector(setDateDelegate:)]){
      [viewController performSelector:@selector(setDateDelegate:)withObject:self];
      if(IsDatePickerEndDateActive)
        [viewController performSelector:@selector(setText:) withObject:@"Please Enter the End Date"];
      if(IsDatePickerStartDateActive){
        [viewController performSelector:@selector(setText:) withObject:@"Please enter the Start Date"];
      }
    }
  }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
  DatePickerViewController *datepicker;
  UINavigationController *navi;
  if([segue.identifier isEqualToString:@"StartDate"]){
    navi = [segue destinationViewController];
    navi.delegate=self;
    self->IsDatePickerStartDateActive=YES;
    self->IsDatePickerEndDateActive=NO;
  }else if([segue.identifier isEqualToString:@"EndDate"]){
    navi = [segue destinationViewController];
    datepicker=(DatePickerViewController*) [navi presentedViewController];
    navi.delegate=self;
    self->IsDatePickerEndDateActive=YES;
    self->IsDatePickerStartDateActive=NO;
  }
}
@end

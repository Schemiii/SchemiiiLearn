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
-(void)btnPickDate:(id)sender{
  
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


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
  if([segue.identifier isEqualToString:@"StartDate"]){
    
  }else if([segue.identifier isEqualToString:@"EndDate"]){
    
  }
}
@end

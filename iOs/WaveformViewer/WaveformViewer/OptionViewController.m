//
//  OptionViewController.m
//  WaveformViewer
//
//  Created by Daniel Schmidt on 25.03.13.
//  Copyright (c) 2013 Daniel Schmidt. All rights reserved.
//

#import "OptionViewController.h"

@interface OptionViewController ()

@end

@implementation OptionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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

- (IBAction)finishEditingOptions:(id)sender {
  NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
  [f setNumberStyle:NSNumberFormatterDecimalStyle];

    NSNumber *start = [f numberFromString:self.txtStart.text];
    NSNumber *end = [f numberFromString:self.txtEnd.text];
  if(start==nil || end==nil){
    [[[UIAlertView alloc] initWithTitle:@"Only Integers allowed" message:nil delegate:nil cancelButtonTitle:@"Ok, sorry" otherButtonTitles: nil]show];
  }else{
    if([self.optiondelegate willFinishWithStartSim:[start integerValue] andEndSim:[end integerValue]]){
      [self dismissViewControllerAnimated:YES completion:^{
        [self.optiondelegate didFinishWithStartSim:[start integerValue] andEndSim:[end integerValue]];
      }];
    }else{
          [[[UIAlertView alloc] initWithTitle:@"End Sim can't be before Start Sim Point" message:nil delegate:nil cancelButtonTitle:@"Ok, of course!" otherButtonTitles: nil]show];
    }

  }
}
@end

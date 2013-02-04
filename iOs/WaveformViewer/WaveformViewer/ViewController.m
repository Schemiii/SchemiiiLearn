//
//  ViewController.m
//  WaveformViewer
//
//  Created by Daniel Schmidt on 04.02.13.
//  Copyright (c) 2013 Daniel Schmidt. All rights reserved.
//

#import "ViewController.h"
#import "SignalView.h"

@interface ViewController ()
- (void) setSignalHeight:(CGFloat) height;

@end

@implementation ViewController
@synthesize parser,signalHeight=_signalHeight,signalViewNameDict;

- (void)viewDidLoad
{
  [super viewDidLoad];
  NSString *vcdFile = @"simple";
  self.signalHeight=50;
  self.signalTimeUnitInPx=2;
  NSString *path = [[NSBundle mainBundle] pathForResource:vcdFile ofType:@"vcd"];
  self.parser = [[VCDParser alloc] initWithVCDFile:path];
  [self.parser parse];
  [self.signalTable setRowHeight:self.signalHeight];
  CGFloat signalDisplayLengthPx=[[parser.timesArray lastObject]floatValue]*self.signalTimeUnitInPx;
  self.signalScrView.contentSize = CGSizeMake(signalDisplayLengthPx, [[parser.signalDict allValues] count]*self.signalHeight);
  signalViewNameDict = [[NSMutableDictionary alloc]init];
  //For Each Signal create Signal Views,add them as Subviews and put the viewReference|View into the Dictionary.
  CGRect r;
  r.origin.x=0;
  r.size.height=self.signalHeight;
  r.size.width=signalDisplayLengthPx;
  for(Signal *s in [parser.signalDict allValues]){
    SignalView *sv = [[SignalView alloc] initWithFrame:r];
    sv.backgroundColor=[UIColor clearColor];
    [self.signalScrView addSubview:sv];
    [signalViewNameDict setObject:sv forKey:s.name];
    r.origin.y+=self.signalHeight;
  }
  //Go through timesArray and update Signal Views with values
  NSArray *signals = [parser.signalDict allValues];
  for(NSNumber *time in parser.timesArray) {
    for(Signal *signal in signals)
    {
      NSString *value = [signal.valueDict objectForKey:time];
      if(value != NULL)
      {
        //Get SignalView reference
        SignalView* sv = [signalViewNameDict objectForKey:signal.name];
        [sv addSignalValue:value ForTime:time];
        
      }
    }
  }

  }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setSignalHeight:(CGFloat)height{
  _signalHeight=height;
}
///**** UITableViewDataSourceDelegate Methods ***************************************
//Return Signalname in a UITableViewCell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
  UITableViewCell *cell = [self.signalTable dequeueReusableCellWithIdentifier:@"Cell"];
  if(cell==nil){
    cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
  }
  cell.textLabel.text=[[[self.parser.signalDict allValues] objectAtIndex:indexPath.row] name];
  return cell;
}
//Return the number of Elements in the Table View
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return [[parser.signalDict allValues] count];
}

//********************************************************************************************


///**** UIScrollViewDelegate Methods ************************************************

//********************************************************************************************

///**** UITableViewDelegate Methods ************************************************
//For dynamic drawing : draw line if cell will be displayed
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
  
}
//********************************************************************************************


@end

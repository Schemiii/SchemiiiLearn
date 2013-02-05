//
//  ViewController.m
//  WaveformViewer
//
//  Created by Daniel Schmidt on 04.02.13.
//  Copyright (c) 2013 Daniel Schmidt. All rights reserved.
//
#define INITIALSIGNALTIMEUNITPX 5
#define MAXSIGNALTIMEUNITPX 15
#define MINSIGNALTIMEUNITPX 2


#import "ViewController.h"
#import "SignalView.h"

@interface ViewController ()
- (void) setSignalRectHeight:(CGFloat) height;
- (void) setSignalDrawHeight:(CGFloat) height;
@end

@implementation ViewController
@synthesize parser,signalRectHeight=_signalHeight,signalViewNameDict,signalDrawHeight=_signalDrawHeight,simTimeFrom,simTimeTo;

- (void)viewDidLoad
{
  [super viewDidLoad];
  NSString *vcdFile = @"very_simple";
  self.signalRectHeight=50;
  self.signalDrawHeight=40;
  self.signalTimeUnitInPx=3;
  NSString *path = [[NSBundle mainBundle] pathForResource:vcdFile ofType:@"vcd"];
  self.parser = [[VCDParser alloc] initWithVCDFile:path];
  [self.parser parse];
  [self.signalTable setRowHeight:self.signalRectHeight];
  //Put Random SimTimes
  self.simTimeFrom=0;
  self.simTimeTo=[[parser.timesArray lastObject]floatValue];
  
  CGFloat signalDisplayLengthPx=[[parser.timesArray lastObject]floatValue]*self.signalTimeUnitInPx;
  self.signalScrView.contentSize = CGSizeMake(signalDisplayLengthPx, [[parser.signalDict allValues] count]*self.signalRectHeight);
  signalViewNameDict = [[NSMutableDictionary alloc]init];
  //For Each Signal create Signal Views,add them as Subviews and put the viewReference|View into the Dictionary.
  CGRect r;
  r.origin.x=0;
  r.size.height=self.signalRectHeight;
  r.size.width=signalDisplayLengthPx;
  for(Signal *s in [parser.signalDict allValues]){
    SignalView *sv = [[SignalView alloc] initWithFrame:r andLineHeightInPx:self.signalDrawHeight];
    sv.signalName=s.name;
    sv.backgroundColor=[UIColor clearColor];
    sv.timeUnitLengthInPx=self.signalTimeUnitInPx;
    [self.signalScrView addSubview:sv]; 
    [signalViewNameDict setObject:sv forKey:s.name];
    r.origin.y+=self.signalRectHeight;
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
        NSLog(@"Signal : %@  Time: %@  Value:%@",signal.name,time,value);
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
- (void) setSignalDrawHeight:(CGFloat)height{
  _signalDrawHeight=height;
}
- (void)setSignalRectHeight:(CGFloat)height{
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

//**** Gesture Recognizers *******************************************************************
- (void)signalsDoubleTap:(UITapGestureRecognizer *)gesture{
  if(gesture.state == UIGestureRecognizerStateEnded){
    self.signalTimeUnitInPx=INITIALSIGNALTIMEUNITPX;
    [self updateSignalViewsWithNewSignalTime];
  }
}
- (void)signalSwipe:(UIPinchGestureRecognizer *)gesture{
  static CGFloat initialScaleValue=INITIALSIGNALTIMEUNITPX;
  if(gesture.state == UIGestureRecognizerStateBegan){
    initialScaleValue=self.signalTimeUnitInPx;
  }
  if(gesture.state == UIGestureRecognizerStateChanged){    
    self.signalTimeUnitInPx=gesture.scale*initialScaleValue;
    if(self.signalTimeUnitInPx>MAXSIGNALTIMEUNITPX)
      self.signalTimeUnitInPx=MAXSIGNALTIMEUNITPX;
    if(self.signalTimeUnitInPx<MINSIGNALTIMEUNITPX)
      self.signalTimeUnitInPx=MINSIGNALTIMEUNITPX;
    [self updateSignalViewsWithNewSignalTime];
  }
}
//********************************************************************************************
- (void) updateSignalViewsWithNewSignalTime{
  CGRect r;
  r.origin.x=0;
  r.size.height=self.signalRectHeight;
  r.size.width=(self.simTimeTo-self.simTimeFrom)*self.signalTimeUnitInPx;
  for (SignalView *sv in [self.signalViewNameDict allValues]) {
    sv.frame=r;
    sv.timeUnitLengthInPx=self.signalTimeUnitInPx;
    r.origin.y+=self.signalRectHeight;
  }
  self.signalScrView.contentSize = CGSizeMake(r.size.width, [[parser.signalDict allValues] count]*self.signalRectHeight);
}

@end

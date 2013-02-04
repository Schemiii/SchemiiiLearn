//
//  ViewController.m
//  WaveformViewer
//
//  Created by Daniel Schmidt on 04.02.13.
//  Copyright (c) 2013 Daniel Schmidt. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize parser;

- (void)viewDidLoad
{
  [super viewDidLoad];
  NSString *vcdFile = @"simple";
  NSString *path = [[NSBundle mainBundle] pathForResource:vcdFile ofType:@"vcd"];
  self.parser = [[VCDParser alloc] initWithVCDFile:path];
  [self.parser parse];
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
///**** UITableViewDataSourceDelegate required Methods ***************************************
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
//For dynamic drawing : draw line if cell will be displayed
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
  
}
@end

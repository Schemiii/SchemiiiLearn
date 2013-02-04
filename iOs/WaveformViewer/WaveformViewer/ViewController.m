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

- (void)viewDidLoad
{
    [super viewDidLoad];
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
  return nil;
}
//Return the number of Elements in the Table View
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return 0;
}
//********************************************************************************************
//For dynamic drawing : draw line if cell will be displayed
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
  
}
@end

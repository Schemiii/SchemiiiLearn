//
//  FruitViewController.m
//  NavigationControllerTableView
//
//  Created by Daniel Schmidt on 26.10.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import "FruitViewController.h"

@interface FruitViewController ()

@end

@implementation FruitViewController

@synthesize fruitList;

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
  NSString *fruitPath = [[NSBundle mainBundle] pathForResource:@"fruits" ofType:@"plist"];
  self.fruitList = [[NSArray alloc] initWithContentsOfFile:fruitPath];
  for (NSObject *o in self.fruitList){
    NSLog(@"Object : %@",o);
  }
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  // Return the number of sections.
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  // Return the number of rows in the section.
  return [self.fruitList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fruit"];
  if(cell==nil){
    cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"fruit"];
  }
  cell.textLabel.text = [self.fruitList objectAtIndex:indexPath.row];
  return cell;
}

@end

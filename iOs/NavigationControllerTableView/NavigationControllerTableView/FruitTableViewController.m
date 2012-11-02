//
//  FruitViewController.m
//  NavigationControllerTableView
//
//  Created by Daniel Schmidt on 26.10.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import "FruitTableViewController.h"
#import "FruitViewController.h"

@interface FruitTableViewController ()

@end

@implementation FruitTableViewController

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
   self.title=@"Fruits";
  
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
  cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
  cell.textLabel.text = [self.fruitList objectAtIndex:indexPath.row];
  return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  [self performSegueWithIdentifier:@"FruitDetail" sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
  if([[segue identifier] isEqualToString:@"FruitDetail"]){
    FruitViewController *fruitViewController = [segue destinationViewController];
    [fruitViewController setFruitMasterDelegate:self];
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    //Pass the fruit's name
    [fruitViewController setFruitName:[self.fruitList objectAtIndex:[indexPath row]]];
  }
}

- (void)fruitView:(FruitViewController *)fruitVC changeFruitKCal:(NSNumber *)kcal{
  NSLog(@"I could and should change the data model to %@ kcal",kcal);
}
@end

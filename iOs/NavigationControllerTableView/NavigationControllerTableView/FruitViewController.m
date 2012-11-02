//
//  FruitViewController.m
//  NavigationControllerTableView
//
//  Created by Daniel Schmidt on 02.11.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import "FruitViewController.h"

@interface FruitViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblFruitName;
@end

@implementation FruitViewController
@synthesize fruitName;
@synthesize fruitMasterDelegate;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void) setup{
  [self.imgFruit
   setImage:[[UIImage alloc]
             initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:self.fruitName ofType:@"png"]]];
//  [self.fruitMasterDelegate fruitView:self changeFruitKCal:[NSNumber numberWithDouble:10.3]];
  [self.lblFruitName setText:self.fruitName];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
  [self setup];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

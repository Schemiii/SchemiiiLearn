//
//  FruitViewController.h
//  NavigationControllerTableView
//
//  Created by Daniel Schmidt on 26.10.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//
#import "FruitViewController.h"
@interface FruitTableViewController : UITableViewController<UITableViewDelegate,FruitViewControllerDelegate>
@property (nonatomic,strong) NSArray *fruitList;
@end

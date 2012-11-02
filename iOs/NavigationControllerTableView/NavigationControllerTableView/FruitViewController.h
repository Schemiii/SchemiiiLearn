//
//  FruitViewController.h
//  NavigationControllerTableView
//
//  Created by Daniel Schmidt on 02.11.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

@class FruitViewController;

@protocol FruitViewControllerDelegate <NSObject>
@required
- (void) fruitView:(FruitViewController*)fruitVC
   changeFruitKCal:(NSNumber*) kcal;
@end

@interface FruitViewController : UIViewController

@property(nonatomic,assign) id<FruitViewControllerDelegate> fruitMasterDelegate;

@property (weak, nonatomic) IBOutlet UIImageView *imgFruit;
@property (readwrite) NSString* fruitName;

@end

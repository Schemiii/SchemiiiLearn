//
//  ViewController.m
//  ScrollViewDetailed
//
//  Created by Daniel Schmidt on 27.12.12.
//  Copyright (c) 2012 Daniel Schmidt. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  //Telling the Scrollview that we are its delegate.
  self.appleScroll.delegate=self;
  self.cherryScroll.delegate=self;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
  //Setting up the content Size. This is needed!
  self.appleScroll.contentSize = CGSizeMake(600, 900);
  self.cherryScroll.contentSize = CGSizeMake(600, 600);
  
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
  //DEBUG
  NSLog(@"Printing size of the UIImageView's");
  NSLog(@"apple_height : %f , apple_width : %f",self.applePic.bounds.size.height,self.applePic.bounds.size.width);
  NSLog(@"apple_height : %f , apple_width : %f",self.applePic.image.size.height,self.applePic.image.size.width);
  
  //END DEBUG
  if(scrollView == self.appleScroll){
    return self.applePic;    
  }else if (scrollView==self.cherryScroll){

    return self.cherryPic;
  }
  return nil;
}


@end

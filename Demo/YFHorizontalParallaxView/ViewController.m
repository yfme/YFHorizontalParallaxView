//
//  ViewController.m
//  YFHorizontalParallaxView
//
//  Created by Yang Fei on 13-2-21.
//  Copyright (c) 2013年 Yang Fei. All rights reserved.
//

#import "ViewController.h"
#import "YFHorizontalParallaxView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.title = NSLocalizedString(@"Horizontal Parallax View", @"");
    
    UIImageView *view1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 280*2, 210)];
    view1.image = [UIImage imageNamed:@"pic1"];
    UIImageView *view2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 280*3, 210)];
    view2.image = [UIImage imageNamed:@"pic2"];
    UIImageView *view3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 280*4, 210)];
    view3.image = [UIImage imageNamed:@"pic3"];
    
    YFHorizontalParallaxView *pv = [[YFHorizontalParallaxView alloc] initWithFrame:CGRectMake(20, 20, 280, 210)
                                                                             views:@[view1,view2,view3]];
    pv.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
    [self.view addSubview:pv];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

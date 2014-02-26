//
//  BaseViewController.m
//  Maystall
//
//  Created by ss4346 on 13-10-28.
//  Copyright (c) 2013年 huiztech. All rights reserved.
//

#import "BaseViewController.h"
#import "MayColorValue.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

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
    [self.view setBackgroundColor:BG_ALL_VIEW];
}

- (void)setTabNavigationBarTitleWithText:(NSString *)text
{
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 170, 44)];
    label.text = text;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"Helvetica-Blod" size:17.0];
    label.textAlignment = NSTextAlignmentCenter;
    self.tabBarController.navigationItem.titleView = label;
    
}

- (void)setTabNavigationBarTitleWithImage:(UIImage *)image
{
    UIImageView *titleView = [[UIImageView alloc] initWithImage:image];
    titleView.frame = CGRectMake(0, 0, 90, 20);
    self.tabBarController.navigationItem.titleView = titleView;
}

- (void)setNavigationBarTitleWithText:(NSString *)text
{
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 170, 44)];
    label.text = text;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"Helvetica-Blod" size:17.0];
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = label;
    
}

- (void)setNavigationBarTitleWithImage:(UIImage *)image
{
    UIImageView *titleView = [[UIImageView alloc] initWithImage:image];
    titleView.frame = CGRectMake(0, 0, 90, 20);
    self.navigationItem.titleView = titleView;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

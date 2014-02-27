//
//  CategoryDetailViewController.m
//  Maystall
//
//  Created by DAWEI FAN on 27/02/2014.
//  Copyright (c) 2014 huiztech. All rights reserved.
//

#import "CategoryDetailViewController.h"

@interface CategoryDetailViewController ()

@end

@implementation CategoryDetailViewController
@synthesize name_CategoryDetail=name_CategoryDetail;
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
    [self createNavigationBarItem];
}
- (void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.navigationController.navigationBarHidden = NO;
    [self setTabNavigationBarTitleWithText:@"CategoryDetail"];//不好使
    self.navigationItem.title =name_CategoryDetail;
    self. navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];//更改导航栏标题颜色 为白色
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)createNavigationBarItem
{
    //左键
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 60, 31);
    [leftButton setTitle:@"Back" forState:UIControlStateNormal];
    [leftButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(backToPreviousView) forControlEvents:UIControlEventTouchUpInside];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"btn_nav_back"] forState:UIControlStateNormal];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] init];
    [leftItem setCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    //右键
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 40, 31);
    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(backToPreviousView) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"btn_nav_home"] forState:UIControlStateNormal];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] init];
    [rightItem setCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
}
#pragma -mark button action
- (void)backToPreviousView
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end

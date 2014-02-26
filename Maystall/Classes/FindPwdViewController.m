//
//  FindPwdViewController.m
//  Maystall
//
//  Created by ss4346 on 13-11-5.
//  Copyright (c) 2013年 huiztech. All rights reserved.
//

#import "FindPwdViewController.h"

@interface FindPwdViewController ()

@end

@implementation FindPwdViewController

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
    [self createNavigationItem];
    [self mainView];
}
#pragma -mark button action
- (void)submitAction
{
    SuccessViewController *view = [[SuccessViewController alloc] init];
    [self.navigationController pushViewController:view animated:YES];
}

- (void)backToPreviousView
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma -mark add subview
- (void)mainView
{
    UIImageView *borderTopLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"border_top_line"]];
    borderTopLine.frame = CGRectMake(0, 0, 320, 7);
    
    UILabel *prompt = [[UILabel alloc] initWithFrame:CGRectMake(5, 7, 320, 40)];
    prompt.text = @"Get Back Password";
    prompt.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    prompt.backgroundColor = [UIColor clearColor];
    
    emailTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 45, 300, 30)];
    emailTextField.placeholder = @"please input your email";
    emailTextField.leftViewMode = UITextFieldViewModeAlways;
    emailTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    emailTextField.background = [UIImage imageNamed:@"bg_textfield"];
    
    submitBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 85, 300, 30)];
    [submitBtn setTitle:@"Submit" forState:UIControlStateNormal];
    [submitBtn setBackgroundImage:[UIImage imageNamed:@"btn_login"] forState:UIControlStateNormal];
    [submitBtn setBackgroundImage:[UIImage imageNamed:@"btn_login_pressed"] forState:UIControlStateHighlighted];
    [submitBtn addTarget:self action:@selector(submitAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:borderTopLine];
    [self.view addSubview:prompt];
    [self.view addSubview:emailTextField];
    [self.view addSubview:submitBtn];
}

- (void)createNavigationItem
{
    self.navigationItem.title = @"Get Back Password";
    
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

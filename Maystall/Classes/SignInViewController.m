//
//  SignInViewController.m
//  Maystall
//
//  Created by ss4346 on 13-11-4.
//  Copyright (c) 2013年 huiztech. All rights reserved.
//

#import "SignInViewController.h"
#import "MayColorValue.h"

@interface SignInViewController ()

@end

@implementation SignInViewController

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
- (void)backToPreviousView
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)findPWD
{
    FindPwdViewController *view = [[FindPwdViewController alloc] init];
    [self.navigationController pushViewController:view animated:YES];
}

#pragma -mark add subview
- (void)mainView
{
    UIImageView *borderTopLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"border_top_line"]];
    borderTopLine.frame = CGRectMake(0, 0, 320, 7);
    
    //邮箱输入框
    emailTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 30, 300, 30)];
    emailTextField.placeholder = @"email";
    UILabel *emailLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    emailLabel.text = @"  email";
    emailLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    emailLabel.textColor = [UIColor blackColor];
    emailLabel.backgroundColor = [UIColor clearColor];
    emailTextField.leftView = emailLabel;
    emailTextField.leftViewMode = UITextFieldViewModeAlways;
    emailTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    emailTextField.background = [UIImage imageNamed:@"bg_textfield"];

    //密码输入框
    passTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 70, 300, 30)];
    passTextField.placeholder = @"password";
    UILabel *passLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    passLabel.text = @"  pass";
    passLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    passLabel.textColor = [UIColor blackColor];
    passLabel.backgroundColor = [UIColor clearColor];
    passTextField.leftView = passLabel;
    passTextField.leftViewMode = UITextFieldViewModeAlways;
    passTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    passTextField.background = [UIImage imageNamed:@"bg_textfield"];
    
    loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 110, 300, 30)];
    [loginBtn setTitle:@"Login" forState:UIControlStateNormal];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"btn_login"] forState:UIControlStateNormal];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"btn_login_pressed"] forState:UIControlStateHighlighted];
    
    UIView *text = [[UIView alloc] initWithFrame:CGRectMake(10, 150, 300, 14)];
    text.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"text_login"]];
    
    facebookBtn = [[UIButton alloc] initWithFrame:CGRectMake(80, 180, 50, 50)];
    [facebookBtn setBackgroundImage:[UIImage imageNamed:@"icon_facebook"] forState:UIControlStateNormal];
    
    UILabel *facebook = [[UILabel alloc] initWithFrame:CGRectMake(80, 230, 50, 20)];
    facebook.backgroundColor = [UIColor clearColor];
    facebook.text = @"facebook";
    facebook.textAlignment = NSTextAlignmentCenter;
    facebook.font = [UIFont fontWithName:@"Helvetica" size:11];
    
    twitterBtn = [[UIButton alloc] initWithFrame:CGRectMake(190, 180, 50, 50)];
    [twitterBtn setBackgroundImage:[UIImage imageNamed:@"icon_twitter"] forState:UIControlStateNormal];
    
    UILabel *twitter = [[UILabel alloc] initWithFrame:CGRectMake(190, 230, 50, 20)];
    twitter.backgroundColor = [UIColor clearColor];
    twitter.text = @"twitter";
    twitter.textAlignment = NSTextAlignmentCenter;
    twitter.font = [UIFont fontWithName:@"Helvetica" size:11];
    
    registerBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 250, 300, 30)];
    [registerBtn setTitle:@"Register" forState:UIControlStateNormal];
    [registerBtn setBackgroundImage:[UIImage imageNamed:@"btn_login"] forState:UIControlStateNormal];
    [registerBtn setBackgroundImage:[UIImage imageNamed:@"btn_login_pressed"] forState:UIControlStateHighlighted];
    
    [self.view addSubview:borderTopLine];
    [self.view addSubview:emailTextField];
    [self.view addSubview:passTextField];
    [self.view addSubview:loginBtn];
    [self.view addSubview:text];
    [self.view addSubview:facebookBtn];
    [self.view addSubview:facebook];
    [self.view addSubview:twitterBtn];
    [self.view addSubview:twitter];
    [self.view addSubview:registerBtn];
    
}

- (void)createNavigationItem
{
    self.navigationItem.title = @"Login";
    
    //左键
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 60, 31);
    leftButton.backgroundColor = [UIColor clearColor];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] init];
    [leftItem setCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    //右键
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 60, 31);
    [button setTitle:@"Back" forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(findPWD) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:@"btn_nav_back"] forState:UIControlStateNormal];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] init];
    [rightItem setCustomView:button];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

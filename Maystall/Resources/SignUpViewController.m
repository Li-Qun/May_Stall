//
//  SignUpViewController.m
//  Maystall
//
//  Created by ss4346 on 13-11-4.
//  Copyright (c) 2013年 huiztech. All rights reserved.
//

#import "SignUpViewController.h"
#import "MayColorValue.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

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
- (void)manAction
{
    man.selected = YES;
    woman.selected = NO;
}

- (void)womanAction
{
    man.selected = NO;
    woman.selected = YES;
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
    
    emailTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 30, 300, 30)];
    emailTextField.placeholder = @"email";
    UILabel *emailLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    emailLabel.text = @"  email:";
    emailLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    emailLabel.textColor = [UIColor blackColor];
    emailLabel.backgroundColor = [UIColor clearColor];
    emailTextField.leftView = emailLabel;
    emailTextField.leftViewMode = UITextFieldViewModeAlways;
    emailTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    emailTextField.background = [UIImage imageNamed:@"bg_textfield"];
    
    nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 70, 300, 30)];
    nameTextField.placeholder = @"nickname";
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    nameLabel.text = @"  name:";
    nameLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.backgroundColor = [UIColor clearColor];
    nameTextField.leftView = nameLabel;
    nameTextField.leftViewMode = UITextFieldViewModeAlways;
    nameTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    nameTextField.background = [UIImage imageNamed:@"bg_textfield"];
    
    passTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 110, 300, 30)];
    passTextField.placeholder = @"password";
    UILabel *passLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    passLabel.text = @"  pass:";
    passLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    passLabel.textColor = [UIColor blackColor];
    passLabel.backgroundColor = [UIColor clearColor];
    passTextField.leftView = passLabel;
    passTextField.leftViewMode = UITextFieldViewModeAlways;
    passTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    passTextField.background = [UIImage imageNamed:@"bg_textfield"];
    
    UILabel *sexLabel = [[UILabel alloc] initWithFrame:CGRectMake(17, 150, 40, 25)];
    sexLabel.backgroundColor = [UIColor clearColor];
    sexLabel.textColor = [UIColor blackColor];
    sexLabel.text = @"sex:";
    sexLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    
    man = [[UIButton alloc] initWithFrame:CGRectMake(70, 150, 25, 25)];
    [man setBackgroundImage:[UIImage imageNamed:@"radiobtn_bg"] forState:UIControlStateNormal];
    [man setBackgroundImage:[UIImage imageNamed:@"radiobtn_bg"] forState:UIControlStateHighlighted];
    [man setImage:[UIImage imageNamed:@"radiobtn_selected"] forState:UIControlStateSelected];
    [man addTarget:self action:@selector(manAction) forControlEvents:UIControlEventTouchUpInside];
    
    woman = [[UIButton alloc] initWithFrame:CGRectMake(150, 150, 25, 25)];
    [woman setBackgroundImage:[UIImage imageNamed:@"radiobtn_bg"] forState:UIControlStateNormal];
    [woman setBackgroundImage:[UIImage imageNamed:@"radiobtn_bg"] forState:UIControlStateHighlighted];
    [woman setImage:[UIImage imageNamed:@"radiobtn_selected"] forState:UIControlStateSelected];
    [woman addTarget:self action:@selector(womanAction) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:emailTextField];
    [self.view addSubview:nameTextField];
    [self.view addSubview:passTextField];
    [self.view addSubview:sexLabel];
    [self.view addSubview:man];
    [self.view addSubview:woman];
    
    [self.view addSubview:borderTopLine];
}

- (void)createNavigationItem
{
    self.navigationItem.title = @"Product Detail";
    
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

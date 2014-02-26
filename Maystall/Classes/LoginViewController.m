//
//  LoginViewController.m
//  Maystall
//
//  Created by 宋硕 on 14-2-12.
//  Copyright (c) 2014年 huiztech. All rights reserved.
//

#import "LoginViewController.h"

#import "RegisterViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize nicknameView = _nicknameView;
@synthesize nicknameFiled = _nicknameFiled;
@synthesize passwordView = _passwordView;
@synthesize passwordFiled = _passwordFiled;

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
    // Do any additional setup after loading the view from its nib.
    [self setNavigationBarTitleWithText:@"Login"];
    _nicknameView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"inputbox_form"]];
    _passwordView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"inputbox_form"]];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -mark
#pragma custom method

- (IBAction)loginAction:(id)sender
{

}

- (IBAction)registerAction:(id)sender
{
    RegisterViewController *view = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:view animated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

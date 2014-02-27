//
//  UserCenterViewController.m
//  Maystall
//
//  Created by ss4346 on 13-10-29.
//  Copyright (c) 2013年 huiztech. All rights reserved.
//

#import "UserCenterViewController.h"
#import "MayColorValue.h"

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "AccountViewController.h"

@interface UserCenterViewController ()

@end

@implementation UserCenterViewController
@synthesize loginBtn = _loginBtn;
@synthesize rigsiterBtn = _rigsiterBtn;
@synthesize topView = _topView;

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
    
    [self setDetailView];
    
    if ([Config Instance].isLogin) {
        NSLog(@"login");
    }
    
//    [_topView removeFromSuperview];

}

- (void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.navigationController.navigationBarHidden = YES;
    [self setTabNavigationBarTitleWithText:@"Me"];
}

- (void)setDetailView
{
    [_topView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_home_nav"]]];
    
    UIImage *originalImage = [UIImage imageNamed:@"buy_bg.png"];
    UIEdgeInsets insets = UIEdgeInsetsMake(25 , 25, 10, 10);
    UIImage *stretchableImage = [originalImage resizableImageWithCapInsets:insets];
    [_loginBtn setBackgroundImage:stretchableImage forState:UIControlStateNormal];
    [_rigsiterBtn setBackgroundImage:stretchableImage forState:UIControlStateNormal];
    
}

#pragma -mark
- (IBAction)toLoginView:(id)sender
{
    LoginViewController *view = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:view animated:YES];
    [self dismissViewControllerAnimated:YES completion:Nil];
}

- (IBAction)registerAction:(id)sender
{
    RegisterViewController *view = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:view animated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma -mark button action
- (void)mailAction
{
    
}

- (void)photoAction
{
    
}

- (void)orderStatusAction
{
    
}

- (void)pendingPaymentOrders
{
    
}

- (void)allOrdersAction
{
    
}

- (void)iLikedAction
{
    
}

- (void)messageCenterAction
{
    
}

- (void)secureAction
{
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

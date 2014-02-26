//
//  UserCenterViewController.m
//  Maystall
//
//  Created by ss4346 on 13-10-29.
//  Copyright (c) 2013年 huiztech. All rights reserved.
//

#import "UserCenterViewController.h"
#import "MayColorValue.h"

@interface UserCenterViewController ()

@end

@implementation UserCenterViewController

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
    
//    [self isUserLogin];
}

#pragma -mark custom method
- (void)isUserLogin
{
//    SignUpViewController *view = [[SignUpViewController alloc] init];
    
    SignInViewController *view = [[SignInViewController alloc] init];
    
    [self.navigationController pushViewController:view animated:NO];
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

- (void)returnOrReplaceAction
{
    RepairViewController *view = [[RepairViewController alloc] init];
    [self.navigationController pushViewController:view animated:YES];
}

#pragma -mark add subview
- (void)mainView
{
    
    //头像部分
    UIView *headBg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 90)];
    headBg.backgroundColor = NAV_COLOR;
    
    UIImageView *headCircle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_head"]];
    headCircle.frame = CGRectMake(122, 7, 76, 76);
    
    headImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_head"]];
    headImage.frame = CGRectMake(125, 10, 70, 70);
    
    [headBg addSubview:headCircle];
    [headBg addSubview:headImage];
    [self.view addSubview:headBg];
    
    //设置部分
    UIScrollView *orderScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, 320, [UIScreen mainScreen].bounds.size.height - [UIApplication sharedApplication].statusBarFrame.size.height -93 -100)];
    orderScrollView.contentSize = CGSizeMake(320, 480);
    
    //订单中心
    UILabel *orderLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 200, 30)];
    orderLabel.textColor = TAB_COLOR_DARK;
    orderLabel.backgroundColor = [UIColor clearColor];
    orderLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:13];
    orderLabel.text = @"Orders Center";
    
    UIButton *orderStatus = [UIButton buttonWithType:UIButtonTypeCustom];
    orderStatus.frame = CGRectMake(11, 35, 298, 52);
    orderStatus.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [orderStatus.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [orderStatus  setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [orderStatus setTitleColor:TAB_COLOR_DARK forState:UIControlStateNormal];
    [orderStatus setTitle:@"Order Status" forState:UIControlStateNormal];
    [orderStatus addTarget:self action:@selector(orderStatusAction) forControlEvents:UIControlEventTouchUpInside];
    [orderStatus setBackgroundImage:[UIImage imageNamed:@"set_box_header"] forState:UIControlStateNormal];
    [orderStatus setBackgroundImage:[UIImage imageNamed:@"set_box_header_press"] forState:UIControlStateHighlighted];
    
    UIButton *pendingPaymentOrders = [UIButton buttonWithType:UIButtonTypeCustom];
    pendingPaymentOrders.frame = CGRectMake(11, 87, 298, 52);
    pendingPaymentOrders.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [pendingPaymentOrders.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [pendingPaymentOrders  setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [pendingPaymentOrders setTitleColor:TAB_COLOR_DARK forState:UIControlStateNormal];
    [pendingPaymentOrders setTitle:@"Pending Payment Orders" forState:UIControlStateNormal];
    [pendingPaymentOrders addTarget:self action:@selector(pendingPaymentOrders) forControlEvents:UIControlEventTouchUpInside];
    [pendingPaymentOrders setBackgroundImage:[UIImage imageNamed:@"set_box_middle"] forState:UIControlStateNormal];
    [pendingPaymentOrders setBackgroundImage:[UIImage imageNamed:@"set_box_middle_press"] forState:UIControlStateHighlighted];
    
    UIButton *allOrders = [UIButton buttonWithType:UIButtonTypeCustom];
    allOrders.frame = CGRectMake(11, 139, 298, 52);
    allOrders.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [allOrders.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [allOrders  setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [allOrders setTitleColor:TAB_COLOR_DARK forState:UIControlStateNormal];
    [allOrders setTitle:@"All Orders" forState:UIControlStateNormal];
    [allOrders addTarget:self action:@selector(allOrdersAction) forControlEvents:UIControlEventTouchUpInside];
    [allOrders setBackgroundImage:[UIImage imageNamed:@"set_box_bottom"] forState:UIControlStateNormal];
    [allOrders setBackgroundImage:[UIImage imageNamed:@"set_box_bottom_press"] forState:UIControlStateHighlighted];

    [orderScrollView addSubview:orderLabel];
    [orderScrollView addSubview:orderStatus];
    [orderScrollView addSubview:pendingPaymentOrders];
    [orderScrollView addSubview:allOrders];
    
    //账户中心
    UILabel *accountCenter = [[UILabel alloc] initWithFrame:CGRectMake(10, 192, 200, 30)];
    accountCenter.textColor = TAB_COLOR_DARK;
    accountCenter.backgroundColor = [UIColor clearColor];
    accountCenter.font = [UIFont fontWithName:@"Helvetica-Bold" size:13];
    accountCenter.text = @"Account Center";
    
    UIButton *iLiked = [UIButton buttonWithType:UIButtonTypeCustom];
    iLiked.frame = CGRectMake(11, 227, 298, 52);
    iLiked.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [iLiked.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [iLiked  setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [iLiked setTitleColor:TAB_COLOR_DARK forState:UIControlStateNormal];
    [iLiked setTitle:@"I Liked" forState:UIControlStateNormal];
    [iLiked addTarget:self action:@selector(iLikedAction) forControlEvents:UIControlEventTouchUpInside];
    [iLiked setBackgroundImage:[UIImage imageNamed:@"set_box_header"] forState:UIControlStateNormal];
    [iLiked setBackgroundImage:[UIImage imageNamed:@"set_box_header_press"] forState:UIControlStateHighlighted];
    
    UIButton *messageCenter = [UIButton buttonWithType:UIButtonTypeCustom];
    messageCenter.frame = CGRectMake(11, 279, 298, 52);
    messageCenter.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [messageCenter.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [messageCenter  setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [messageCenter setTitleColor:TAB_COLOR_DARK forState:UIControlStateNormal];
    [messageCenter setTitle:@"Message Center" forState:(UIControlStateNormal)];
    [messageCenter addTarget:self action:@selector(messageCenterAction) forControlEvents:UIControlEventTouchUpInside];
    [messageCenter setBackgroundImage:[UIImage imageNamed:@"set_box_middle"] forState:UIControlStateNormal];
    [messageCenter setBackgroundImage:[UIImage imageNamed:@"set_box_middle_press"] forState:UIControlStateHighlighted];
    
    UIButton *secure = [UIButton buttonWithType:UIButtonTypeCustom];
    secure.frame = CGRectMake(11, 331, 298, 52);
    secure.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [secure.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [secure  setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [secure setTitleColor:TAB_COLOR_DARK forState:UIControlStateNormal];
    [secure setTitle:@"Secure" forState:UIControlStateNormal];
    [secure addTarget:self action:@selector(secureAction) forControlEvents:UIControlEventTouchUpInside];
    [secure setBackgroundImage:[UIImage imageNamed:@"set_box_bottom"] forState:UIControlStateNormal];
    [secure setBackgroundImage:[UIImage imageNamed:@"set_box_bottom_press"] forState:UIControlStateHighlighted];
    
    [orderScrollView addSubview:accountCenter];
    [orderScrollView addSubview:iLiked];
    [orderScrollView addSubview:messageCenter];
    [orderScrollView addSubview:secure];
    
    //客户服务
    UILabel *customerService = [[UILabel alloc] initWithFrame:CGRectMake(10, 384, 200, 30)];
    customerService.textColor = TAB_COLOR_DARK;
    customerService.backgroundColor = [UIColor clearColor];
    customerService.font = [UIFont fontWithName:@"Helvetica-Bold" size:13];
    customerService.text = @"Customer Service";
    
    UIButton *returnOrReplace = [UIButton buttonWithType:UIButtonTypeCustom];
    returnOrReplace.frame = CGRectMake(11, 419, 298, 52);
    returnOrReplace.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [returnOrReplace.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [returnOrReplace  setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [returnOrReplace setTitle:@"Return Or Replace" forState:UIControlStateNormal];
    [returnOrReplace setTitleColor:TAB_COLOR_DARK forState:UIControlStateNormal];
    [returnOrReplace addTarget:self action:@selector(returnOrReplaceAction) forControlEvents:UIControlEventTouchUpInside];
    [returnOrReplace setBackgroundImage:[UIImage imageNamed:@"set_box"] forState:UIControlStateNormal];
    [returnOrReplace setBackgroundImage:[UIImage imageNamed:@"set_box_press"] forState:UIControlStateHighlighted];
    
    [orderScrollView addSubview:customerService];
    [orderScrollView addSubview:returnOrReplace];
    [self.view addSubview:orderScrollView];
}

- (void)createNavigationItem
{
    self.tabBarController.navigationItem.title = @"Comments";
    
    //左键
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 60, 31);
    [leftButton setTitle:@"Back" forState:UIControlStateNormal];
    [leftButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(mailAction) forControlEvents:UIControlEventTouchUpInside];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"btn_nav_back"] forState:UIControlStateNormal];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] init];
    [leftItem setCustomView:leftButton];
    self.tabBarController.navigationItem.leftBarButtonItem = leftItem;
    
    //右键
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 60, 31);
    [rightButton setTitle:@"Back" forState:UIControlStateNormal];
    [rightButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(mailAction) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"btn_nav_back"] forState:UIControlStateNormal];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] init];
    [rightItem setCustomView:rightButton];
    self.tabBarController.navigationItem.rightBarButtonItem = rightItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

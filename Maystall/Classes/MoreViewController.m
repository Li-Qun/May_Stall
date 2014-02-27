//
//  MoreViewController.m
//  Maystall
//
//  Created by ss4346 on 13-10-29.
//  Copyright (c) 2013年 huiztech. All rights reserved.
//

#import "MoreViewController.h"
#import "MayColorValue.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

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
    [self mainView];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.navigationController.navigationBarHidden = NO;
    [self setTabNavigationBarTitleWithText:@"More"];
}

#pragma -mark button action
- (void)lookForFriend
{
    
}

- (void)attentionMaystallFacebook
{
    
}

- (void)attentionMaystallTwitter
{
    
}

- (void)checkForUpdates
{
    
}

- (void)feedback
{
    
}

- (void)clearCache
{
    
}

- (void)pushsetting
{
    
}

#pragma -mark add subview
- (void)mainView
{
    //设置部分
    UIScrollView *orderScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - [UIApplication sharedApplication].statusBarFrame.size.height -93)];
    orderScrollView.contentSize = CGSizeMake(320, 480);

    //按钮 look for friend
    UIButton *lookForFriend = [UIButton buttonWithType:UIButtonTypeCustom];
    lookForFriend.frame = CGRectMake(11, 20, 298, 52);
    lookForFriend.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [lookForFriend.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [lookForFriend  setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [lookForFriend setTitleColor:TAB_COLOR_DARK forState:UIControlStateNormal];
    [lookForFriend setTitle:@"Look for friend" forState:UIControlStateNormal];
    [lookForFriend addTarget:self action:@selector(lookForFriend) forControlEvents:UIControlEventTouchUpInside];
    [lookForFriend setBackgroundImage:[UIImage imageNamed:@"set_box_header"] forState:UIControlStateNormal];
    [lookForFriend setBackgroundImage:[UIImage imageNamed:@"set_box_header_press"] forState:UIControlStateHighlighted];
    
    //按钮 attention maystall facebook
    UIButton *attentionMaystallFacebook = [UIButton buttonWithType:UIButtonTypeCustom];
    attentionMaystallFacebook.frame = CGRectMake(11, 72, 298, 52);
    attentionMaystallFacebook.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [attentionMaystallFacebook.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [attentionMaystallFacebook  setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [attentionMaystallFacebook setTitleColor:TAB_COLOR_DARK forState:UIControlStateNormal];
    [attentionMaystallFacebook setTitle:@"Attention maystall Facebook" forState:(UIControlStateNormal)];
    [attentionMaystallFacebook addTarget:self action:@selector(attentionMaystallFacebook) forControlEvents:UIControlEventTouchUpInside];
    [attentionMaystallFacebook setBackgroundImage:[UIImage imageNamed:@"set_box_middle"] forState:UIControlStateNormal];
    [attentionMaystallFacebook setBackgroundImage:[UIImage imageNamed:@"set_box_middle_press"] forState:UIControlStateHighlighted];
    
    
    //按钮 attention maystall twitter
    UIButton *attentionMaystallTwitter = [UIButton buttonWithType:UIButtonTypeCustom];
    attentionMaystallTwitter.frame = CGRectMake(11, 124, 298, 52);
    attentionMaystallTwitter.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [attentionMaystallTwitter.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [attentionMaystallTwitter  setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [attentionMaystallTwitter setTitleColor:TAB_COLOR_DARK forState:UIControlStateNormal];
    [attentionMaystallTwitter setTitle:@"Attention maystall Twitter" forState:UIControlStateNormal];
    [attentionMaystallTwitter addTarget:self action:@selector(attentionMaystallTwitter) forControlEvents:UIControlEventTouchUpInside];
    [attentionMaystallTwitter setBackgroundImage:[UIImage imageNamed:@"set_box_bottom"] forState:UIControlStateNormal];
    [attentionMaystallTwitter setBackgroundImage:[UIImage imageNamed:@"set_box_bottom_press"] forState:UIControlStateHighlighted];
    
    //按钮 check for updates
    UIButton *checkForUpdates = [UIButton buttonWithType:UIButtonTypeCustom];
    checkForUpdates.frame = CGRectMake(11, 186, 298, 52);
    checkForUpdates.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [checkForUpdates.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [checkForUpdates  setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [checkForUpdates setTitle:@"Check for updates" forState:UIControlStateNormal];
    [checkForUpdates setTitleColor:TAB_COLOR_DARK forState:UIControlStateNormal];
    [checkForUpdates addTarget:self action:@selector(checkForUpdates) forControlEvents:UIControlEventTouchUpInside];
    [checkForUpdates setBackgroundImage:[UIImage imageNamed:@"set_box"] forState:UIControlStateNormal];
    [checkForUpdates setBackgroundImage:[UIImage imageNamed:@"set_box_press"] forState:UIControlStateHighlighted];
    
    
    //按钮 feedback
    UIButton *feedback = [UIButton buttonWithType:UIButtonTypeCustom];
    feedback.frame = CGRectMake(11, 248, 298, 52);
    feedback.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [feedback.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [feedback  setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [feedback setTitle:@"feedback" forState:UIControlStateNormal];
    [feedback setTitleColor:TAB_COLOR_DARK forState:UIControlStateNormal];
    [feedback addTarget:self action:@selector(feedback) forControlEvents:UIControlEventTouchUpInside];
    [feedback setBackgroundImage:[UIImage imageNamed:@"set_box"] forState:UIControlStateNormal];
    [feedback setBackgroundImage:[UIImage imageNamed:@"set_box_press"] forState:UIControlStateHighlighted];
    
    //按钮 clear cache
    UIButton *clearCache = [UIButton buttonWithType:UIButtonTypeCustom];
    clearCache.frame = CGRectMake(11, 310, 298, 52);
    clearCache.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [clearCache.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [clearCache  setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [clearCache setTitleColor:TAB_COLOR_DARK forState:UIControlStateNormal];
    [clearCache setTitle:@"Clear cache" forState:UIControlStateNormal];
    [clearCache addTarget:self action:@selector(clearCache) forControlEvents:UIControlEventTouchUpInside];
    [clearCache setBackgroundImage:[UIImage imageNamed:@"set_box_header"] forState:UIControlStateNormal];
    [clearCache setBackgroundImage:[UIImage imageNamed:@"set_box_header_press"] forState:UIControlStateHighlighted];
    
    //按钮 attention maystall twitter
    UIButton *pushsetting = [UIButton buttonWithType:UIButtonTypeCustom];
    pushsetting.frame = CGRectMake(11, 362, 298, 52);
    pushsetting.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [pushsetting.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [pushsetting  setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [pushsetting setTitleColor:TAB_COLOR_DARK forState:UIControlStateNormal];
    [pushsetting setTitle:@"Pushing setting - open" forState:UIControlStateNormal];
    [pushsetting addTarget:self action:@selector(pushsetting) forControlEvents:UIControlEventTouchUpInside];
    [pushsetting setBackgroundImage:[UIImage imageNamed:@"set_box_bottom"] forState:UIControlStateNormal];
    [pushsetting setBackgroundImage:[UIImage imageNamed:@"set_box_bottom_press"] forState:UIControlStateHighlighted];
    
    
    [orderScrollView addSubview:lookForFriend];
    [orderScrollView addSubview:attentionMaystallFacebook];
    [orderScrollView addSubview:attentionMaystallTwitter];
    [orderScrollView addSubview:checkForUpdates];
    [orderScrollView addSubview:feedback];
    [orderScrollView addSubview:clearCache];
    [orderScrollView addSubview:pushsetting];
    
    [self.view addSubview:orderScrollView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

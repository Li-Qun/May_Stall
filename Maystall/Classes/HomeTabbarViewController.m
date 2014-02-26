//
//  HomeTabbarViewController.m
//  Maystall
//
//  Created by ss4346 on 13-10-28.
//  Copyright (c) 2013年 huiztech. All rights reserved.
//

#import "HomeTabbarViewController.h"

@interface HomeTabbarViewController ()

@end

@implementation HomeTabbarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self addCenterButtonWithImage:[UIImage imageNamed:@"icon_twitter"] highlightImage:[UIImage imageNamed:@"icon_twitter"]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:BG_ALL_VIEW];
    
    //创建各部分选项卡
    [self setTabView];
    
    //指向首页
    [self setSelectedIndex:2];
}

#pragma -mark add subview
-(void)willAppearIn:(UINavigationController *)navigationController
{
    [self addCenterButtonWithImage:[UIImage imageNamed:@"cameraTabBarItem.png"] highlightImage:nil];
}

-(UIViewController*) viewControllerWithTabTitle:(NSString*) title image:(UIImage*)image
{
    UIViewController* viewController = [[UIViewController alloc] init];
    viewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:image tag:0];
    return viewController;
}

-(void) addCenterButtonWithImage:(UIImage*)buttonImage highlightImage:(UIImage*)highlightImage
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    
    CGFloat heightDifference = buttonImage.size.height - self.tabBar.frame.size.height;
    if (heightDifference < 0)
        button.center = self.tabBar.center;
    else
    {
        CGPoint center = self.tabBar.center;
        center.y = center.y - heightDifference/2.0;
        button.center = center;
    }
    
    [self.view addSubview:button];
}

-(void)setTabView
{
    ShoppingCartViewController *shoppingCartView = [[ShoppingCartViewController alloc] initWithNibName:nil bundle:nil];
    shoppingCartView.tabBarItem.title = @"Cart";
    
    CategoryViewController *categoryView = [[CategoryViewController alloc] initWithNibName:nil bundle:nil];
    categoryView.tabBarItem.title = @"Category";
    
    HomeViewController *homeView = [[HomeViewController alloc] initWithNibName:nil bundle:nil];
    homeView.tabBarItem.title = @"Home";
    
    UserCenterViewController *userCenterView = [[UserCenterViewController alloc] initWithNibName:nil bundle:nil];
    userCenterView.tabBarItem.title = @"me";
    
    MoreViewController *moreView = [[MoreViewController alloc] initWithNibName:nil bundle:nil];
    moreView.tabBarItem.title = @"more";
    
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (version >= 7.0) {
        shoppingCartView.tabBarItem.image = [[UIImage imageNamed:@"icon_tab_normal_cart"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        shoppingCartView.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_tab_selected_cart"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        categoryView.tabBarItem.image = [[UIImage imageNamed:@"icon_tab_normal_cat"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        categoryView.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_tab_selected_cat"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        homeView.tabBarItem.image = [[UIImage imageNamed:@"icon_tab_normal_home"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        homeView.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_tab_selected_home"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        userCenterView.tabBarItem.image = [[UIImage imageNamed:@"icon_tab_normal_me"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        userCenterView.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_tab_selected_me"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        moreView.tabBarItem.image = [[UIImage imageNamed:@"icon_tab_normal_more"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        moreView.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_tab_selected_more"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
    }else{
        shoppingCartView.tabBarItem.image = [UIImage imageNamed:@"icon_tab_normal_cart"];
        shoppingCartView.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_tab_selected_cart"];
        
        categoryView.tabBarItem.image = [UIImage imageNamed:@"icon_tab_normal_cat"];
        categoryView.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_tab_selected_cat"];
        
        homeView.tabBarItem.image = [UIImage imageNamed:@"icon_tab_normal_home"];
        homeView.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_tab_selected_home"];
        
        userCenterView.tabBarItem.image = [UIImage imageNamed:@"icon_tab_normal_me"];
        userCenterView.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_tab_selected_me"];
        
        moreView.tabBarItem.image = [UIImage imageNamed:@"icon_tab_normal_more"];
        moreView.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_tab_selected_more"];
        
    }
    
    self.viewControllers = [NSArray arrayWithObjects: shoppingCartView, categoryView, homeView, userCenterView, moreView, nil];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end

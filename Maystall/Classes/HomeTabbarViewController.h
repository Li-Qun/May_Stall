//
//  HomeTabbarViewController.h
//  Maystall
//
//  Created by ss4346 on 13-10-28.
//  Copyright (c) 2013年 huiztech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import "MoreViewController.h"
#import "CategoryViewController.h"
#import "UserCenterViewController.h"
#import "ShoppingCartViewController.h"

@interface HomeTabbarViewController : UITabBarController

-(UIViewController*) viewControllerWithTabTitle:(NSString*)title image:(UIImage*)image;

-(void) addCenterButtonWithImage:(UIImage*)buttonImage highlightImage:(UIImage*)highlightImage;

@end
